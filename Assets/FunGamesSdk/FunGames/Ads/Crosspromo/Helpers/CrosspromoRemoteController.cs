using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using FunGames.Sdk.Ads.Crosspromo;
using FunGames.Sdk.Tools;
using Proyecto26;
using SimpleJSON;
using TMPro;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;
using UnityEngine.Video;
using Random = UnityEngine.Random;

namespace FunGamesSdk.FunGames.Ads.Crosspromo.Scripts
{
    public class CrosspromoRemoteController : MonoBehaviour
    {
        public static CrosspromoRemoteController instance;

        [SerializeField] private bool fetchAtInit = true;
        [SerializeField] private bool cacheVideo = true;
        [SerializeField] private int maxNumCachedVideos = 3;

        private readonly List<string> _videoUrLs = new List<string>();
        private readonly List<string> _promotedUrls = new List<string>();
        private readonly List<string> _promotedStoreIds = new List<string>();
        private readonly List<string> _titles = new List<string>();
        private readonly List<string> _descriptions = new List<string>();
        
        private VideoPlayer _videoPlayer;
        private TextMeshProUGUI _videoTitle;
        private TextMeshProUGUI _videoDescription;
        private Button _videoButton;
        private Button _playButton;

        private string _crossPromoApi = "https://api.tnapps.xyz/v1/crosspromo/";

        private string _promotedUrl;

        private Coroutine _videoPlayingCoroutine;

        private string[] _cache;

        private void Awake ()
        {
            instance = this;
            
            _videoPlayer = transform.Find("Root/Video").GetComponent<VideoPlayer>();
            _videoTitle = transform.Find("Root/Title").GetComponent<TextMeshProUGUI>();
            _videoDescription = transform.Find("Root/Description").GetComponentInChildren<TextMeshProUGUI>();
            _videoButton = transform.Find("Root/Video").GetComponent<Button>();
            _playButton = transform.Find("Root/PlayButton").GetComponent<Button>();
            
            if (_videoPlayer != null)
                _videoPlayer.Stop ();

            _crossPromoApi += Application.identifier;
            
            #if UNITY_ANDROID
                _crossPromoApi += "?os=android";
            #endif
            #if UNITY_IPHONE
                _crossPromoApi += "?os=ios";
            #endif
        }
        
        public void LoadVideoUrls(Action<bool> complete)
        {
            if (fetchAtInit)
            {
                FetchVideosInfos(complete);
            }
            else
            {
                complete.Invoke(true);
            }
        }

        private void FetchVideosInfos(Action<bool> callback)
        {
            var hash = FunGamesApiHelpers.CreateToken(_crossPromoApi);
            var bitString = FunGamesApiHelpers.GetBitString();
            
            RestClient.DefaultRequestHeaders["Content-Type"] = "application/json";
            RestClient.DefaultRequestHeaders["User-Agent"] = SystemInfo.deviceModel;
            RestClient.DefaultRequestHeaders["Authorization"] = "HMAC " + bitString + " " + hash;
            RestClient.DefaultRequestHeaders["x-device-id"] = SystemInfo.deviceUniqueIdentifier;
            
            RestClient.Get(_crossPromoApi)
                .Then(response =>
                {
                    HandleResponse(response.Text);
                    Debug.Log("[Remote Config] Fetch OK");
                    callback?.Invoke(true);
                })
                .Catch(err =>
                {
                    Debug.Log("[Remote Config] Fetch KO");
                    Debug.LogError(err.Message);
                    callback?.Invoke(false);
                });
        }

        private void HandleResponse(string response)
        {
            var node = JSON.Parse(response);

            foreach (var elem in node.AsArray)
            {
                HandleJsonNode(elem);
            }
        }

        private void HandleJsonNode(JSONNode node)
        {
            if (node.HasKey("video_url"))
            {
                _videoUrLs.Add(node["video_url"]);
            }
            else
            {
                return;
            }
            
            if (node.HasKey("promoted_url"))
            {
                _promotedUrls.Add(node["promoted_url"]);
            }
            else
            {
                _videoUrLs.Remove(node["video_url"]);
                return;
            }
            
            if (node.HasKey("promoted_store_id"))
            {
                _promotedStoreIds.Add(node["promoted_store_id"]);
            }
            else
            {
                _videoUrLs.Remove(node["video_url"]);
                _promotedUrls.Remove(node["promoted_url"]);
            }
            
            if (node.HasKey("title"))
            {
                _titles.Add(node["title"]);
            }
            else
            {
                _titles.Add("");
            }
            
            if (node.HasKey("description"))
            {
                _descriptions.Add(node["description"]);
            }
            else
            {
                _descriptions.Add("");
            }
        }

        public void PlayVideo(Action complete)
        {
            _videoButton.onClick.RemoveAllListeners();
            _playButton.onClick.RemoveAllListeners();
            
            _videoButton.onClick.AddListener(Redirect);
            _playButton.onClick.AddListener(Redirect);
            
            if (_videoPlayer == null)
            {
                Debug.LogError("videoPlayer == null");
                return;
            }
            if (_videoUrLs.Count == 0)
            {
                Debug.Log("Nothing to play");
                return;
            }

            var index = Random.Range(0, _videoUrLs.Count);
            
            _promotedUrl = _promotedUrls[index];
            
            SetTitle(_titles[index]);
            SetDescription(_descriptions[index]);
            
            var videoUrL = _videoUrLs[index];
            
            if (cacheVideo)
            {
                Debug.Log("Check Video Caching ..");
                
                var cachedVideoIndex = GetCacheVideoIndex(videoUrL);
                
                if (cachedVideoIndex > 0)
                {
                    Debug.Log("Video Cached");
                    Debug.Log("Url : " + videoUrL);
                    videoUrL = GetLocalVideoUrl(videoUrL, cachedVideoIndex);
                    StartPlayingVideo(videoUrL, complete);
                }
                else
                {
                    Debug.Log("Video Not Cached");
                    CacheAndPlayVideo(videoUrL, complete);
                }
            }
            else
            {
                StartPlayingVideo(videoUrL, complete);
            }
        }
        
        private void SetTitle(string title)
        {
            _videoTitle.text = title;
        }

        private void SetDescription(string description)
        {
            _videoDescription.text = description;
        }

        private void StartPlayingVideo (string videoUrl, Action complete)
        {
            Debug.Log("URL ::: " + videoUrl);
            
            _videoPlayer.url = videoUrl;
            _videoPlayer.Play();

            if (_videoPlayingCoroutine != null)
            {
                StopCoroutine (_videoPlayingCoroutine);
            }

            _videoPlayingCoroutine = StartCoroutine( CheckVideoFinish(complete) );
        }
        
        private IEnumerator CheckVideoFinish(Action complete)
        {
            while (true)
            {
                if (_videoPlayer.isPaused)
                {
                    complete?.Invoke ();
                    yield break;
                }

                yield return null;
            }
        }
        
        private void Redirect()
        {
            Application.OpenURL(_promotedUrl);
        }

        #region Cache functions
        
        private int GetCacheVideoIndex (string videoUrl)
        {
            ParseCache();

            for (var i = 1; i < _cache.Length; i++)
            {
                Debug.Log("Cached url n°" + i + " : " + "\"" + _cache[i] + "\"");
                if (_cache[i] == videoUrl)
                {
                    return i;
                }
            }
            
            return 0;
        }

        private void ParseCache ()
        {
            if (_cache != null)
            {
                return;
            }

            _cache = new string[maxNumCachedVideos + 1];
            _cache[0] = "0";
            
            for (var i = 0; i < maxNumCachedVideos; i++)
            {
                _cache[i+1] = "";
            }

            var cu = GetLocalCacheUrl();
            if (!File.Exists(cu))
            {
                return;
            }
            
            StreamReader reader = new StreamReader(cu);
            
            var u = reader.ReadLine();
            
            reader.Close();

            if (string.IsNullOrEmpty(u))
            {
                return;
            }
            
            var cs = u.Split(',');
            
            for (var i = 0; i < maxNumCachedVideos + 1; i++)
            {
                if (i < cs.Length)
                {
                    _cache[i] = cs[i];
                }
            }
        }

        private void SaveCache ()
        {
            if (_cache.Length == 0) return;

            var writer = new StreamWriter( GetLocalCacheUrl() , false);
            
            writer.WriteLine( string.Join(",", _cache) );
            writer.Close();
        }

        private void CacheAndPlayVideo (string videoUrl, Action complete)
        {
            StartCoroutine( DownloadAndPlayVideo(videoUrl, complete));
        }

        private IEnumerator DownloadAndPlayVideo (string videoUrl, Action complete)
        {
            var www = UnityWebRequest.Get(videoUrl);
            
            yield return www.SendWebRequest();

            Debug.Log("Starting Video Download");
            Debug.Log(videoUrl);
            
            if (www.isNetworkError || www.isHttpError)
            {
                Debug.Log(www.error);
            }
            else
            {
                var n = int.Parse(_cache[0]);
                var index = 1 + (n % maxNumCachedVideos);
                _cache[0] = "" + (n+1);
                _cache[index] = videoUrl;

                var u = GetLocalVideoUrl(videoUrl, index);

                File.WriteAllBytes(u, www.downloadHandler.data);
                SaveCache();
                
                StartPlayingVideo(u, complete);
            }
        }

        private string GetLocalCacheUrl ()
        {
            return GetLocalPath("cpcache.txt");
        }

        private string GetLocalVideoUrl (string videoUrl, int index)
        {
            return GetLocalPath("cpvideo" + index + Path.GetExtension(videoUrl));
        }
        
        private static string GetLocalPath (string fileName)
        {
            return Path.Combine(Application.persistentDataPath, fileName);
        }

        #endregion
    }
}