using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using FunGames.Sdk.Analytics;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Video;
using Random = UnityEngine.Random;

namespace FunGamesSdk.FunGames.Ads.Crosspromo.Scripts
{
    public class CrosspromoLocalController : MonoBehaviour
    {
        public static CrosspromoLocalController instance;
        
        public List<VideoClip> clips;
        public List<string> titles;
        public List<string> descriptions;
        public List<string> promotedUrls;
        public List<string> promotedStoreIds;

        private VideoPlayer _videoPlayer;
        private TextMeshProUGUI _videoTitle;
        private TextMeshProUGUI _videoDescription;
        private Button _videoButton;
        private Button _playButton;

        private string _promotedUrl;

        private Coroutine _videoPlayingCoroutine;

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
        }
        
        public void PlayVideo(Action complete)
        {
            _videoButton.onClick.RemoveAllListeners();
            _playButton.onClick.RemoveAllListeners();
            
            _videoButton.onClick.AddListener(Redirect);
            _playButton.onClick.AddListener(Redirect);
            
            if (_videoPlayer == null)
            {
                Debug.LogError ("videoPlayer == null");
                return;
            }
            if (clips.Count == 0)
            {
                Debug.Log("Nothing to play");
                return;
            }

            var index = Random.Range(0, clips.Count);

            _promotedUrl = promotedUrls[index];
            
            SetTitle(titles[index]);
            SetDescription(descriptions[index]);
            StartPlayingVideo(clips[index], complete);
        }

        private void SetTitle(string title)
        {
            _videoTitle.text = title;
        }

        private void SetDescription(string description)
        {
            _videoDescription.text = description;
        }
        
        private void StartPlayingVideo (VideoClip clip, Action complete)
        {
            _videoPlayer.clip = clip;
            _videoPlayer.Play();

            if (_videoPlayingCoroutine != null)
                StopCoroutine (_videoPlayingCoroutine);

            _videoPlayingCoroutine = StartCoroutine( CheckVideoFinish(complete) );
        }
        
        private IEnumerator CheckVideoFinish (Action complete)
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
            FunGamesAnalytics.NewDesignEvent("crossPromo", "click;" + _promotedUrl);

            Application.OpenURL(_promotedUrl);
        }
    }
}