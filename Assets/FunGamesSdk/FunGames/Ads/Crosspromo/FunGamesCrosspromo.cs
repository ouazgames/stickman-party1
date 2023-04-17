using FunGames.Sdk.Analytics;
using FunGames.Sdk.Analytics.Helpers;
using FunGamesSdk;
using FunGamesSdk.FunGames.Ads.Crosspromo.Scripts;
using GameAnalyticsSDK;
using UnityEngine;

namespace FunGames.Sdk.Ads.Crosspromo
{
    internal static class FunGamesCrosspromo
    {
        private static bool _playLocalVideos;
        private static bool _playRemoteVideos;
        
        internal static void Init (System.Action<bool> complete) 
        {
            var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

            _playLocalVideos = settings.playLocalVideos;
            _playRemoteVideos = settings.playRemoteVideos;
            
            if (_playLocalVideos == false && _playRemoteVideos == false)
            {
                complete.Invoke(false);
                return;
            }
            
            if (CrosspromoRemoteController.instance == null) {
                Debug.LogWarning("CrosspromoController.instance == null");
                complete.Invoke(false);
                return;
            }

            if (_playRemoteVideos)
            {
                CrosspromoRemoteController.instance.LoadVideoUrls(complete);
            }
            complete.Invoke(true);
        }

        internal static void PlayVideo(System.Action complete)
        {
            if (_playLocalVideos && _playRemoteVideos)
            {
                var r = Random.Range(0, 1);

                if (r == 0)
                {
                    PlayRemoteVideo(complete);
                }
                else
                {
                    PlayLocalVideo(complete);
                }

                return;
            }
            
            if (_playRemoteVideos)
            {
                PlayRemoteVideo(complete);
                return;
            }

            if (_playLocalVideos)
            {
                PlayLocalVideo(complete);
                return;
            }
        }

        internal static void PlayRemoteVideo(System.Action complete) 
        {
            if (CrosspromoRemoteController.instance == null)
            {
                Debug.LogError ("CrosspromoController.instance == null");
                return;
            }
            
            CrosspromoRemoteController.instance.PlayVideo(complete);
            FunGamesAnalytics.NewDesignEvent("crossPromo", "show");
        }

        internal static void PlayLocalVideo(System.Action complete)
        {
            if (CrosspromoRemoteController.instance == null)
            {
                Debug.LogError ("CrosspromoController.instance == null");
                return;
            }

            CrosspromoLocalController.instance.PlayVideo(complete);
            
            FunGamesAnalytics.NewDesignEvent("crossPromo", "show");
        }
    }
}