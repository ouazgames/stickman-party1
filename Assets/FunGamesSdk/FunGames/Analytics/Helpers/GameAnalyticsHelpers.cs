using System;
using FunGamesSdk;
using UnityEngine;
using GameAnalyticsSDK;

namespace FunGames.Sdk.Analytics.Helpers
{
    public static class GameAnalyticsHelpers
    {
        public static void Initialize()
        {
            var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");
            
            var flag = !settings.gameAnalyticsAndroidGameKey.Equals(string.Empty) && !settings.gameAnalyticsAndroidSecretKey.Equals(string.Empty);
            
            if (flag == false)
            {
                flag = !settings.gameAnalyticsIosGameKey.Equals(string.Empty) && !settings.gameAnalyticsIosSecretKey.Equals(string.Empty);
            }
            
            var gameAnalytics = UnityEngine.Object.FindObjectOfType<GameAnalytics>();

            if (gameAnalytics == null)
            {
                throw new Exception("It seems like you haven't instantiated GameAnalytics GameObject");
            }
            
            AddOrUpdatePlatform(RuntimePlatform.IPhonePlayer,settings.gameAnalyticsIosGameKey, settings.gameAnalyticsIosSecretKey);
            
            if (flag)
            {
                AddOrUpdatePlatform(RuntimePlatform.Android,settings.gameAnalyticsAndroidGameKey, settings.gameAnalyticsAndroidSecretKey);
            }
            else
            {
                RemovePlatform(RuntimePlatform.Android);
            }
            
            GameAnalytics.SettingsGA.InfoLogBuild = false;
            GameAnalytics.SettingsGA.InfoLogEditor = false;
            GameAnalytics.Initialize();
        }

        private static void AddOrUpdatePlatform(RuntimePlatform platform, string gameKey, string secretKey)
        {
            if (!GameAnalytics.SettingsGA.Platforms.Contains(platform))
            {
                GameAnalytics.SettingsGA.AddPlatform(platform);
            }
            
            var index = GameAnalytics.SettingsGA.Platforms.IndexOf(platform);
            
            GameAnalytics.SettingsGA.UpdateGameKey(index, gameKey);
            GameAnalytics.SettingsGA.UpdateSecretKey(index, secretKey);
            GameAnalytics.SettingsGA.Build[index] = Application.version;
        }

        private static void RemovePlatform(RuntimePlatform platform)
        {
            if (GameAnalytics.SettingsGA.Platforms.Contains(platform) == false)
            {
                return;
            }
            
            var index = GameAnalytics.SettingsGA.Platforms.IndexOf(platform);
            
            GameAnalytics.SettingsGA.RemovePlatformAtIndex(index);
        }

        internal static void ProgressionEvent(string statusString, string level, string subLevel="", int score=-1){

            var status = GAProgressionStatus.Start;

            switch (statusString.ToLower())
            {
                case "complete":
                    status = GAProgressionStatus.Complete;
                    break;
                case "fail":
                    status = GAProgressionStatus.Fail;
                    break;
            }
   
            if (score == -1)
            {
                GameAnalytics.NewProgressionEvent(status, level, subLevel);
            }
            else
            {
                GameAnalytics.NewProgressionEvent(status, level, subLevel,score);
            }
        }
        internal static void NewDesignEvent(string eventId, string eventValue="")
        {
            if (eventValue != "")
            {
                try
                {
                    var score = float.Parse(eventValue);
                    
                    GameAnalytics.NewDesignEvent(eventId,score);
                }
                catch
                {
                    GameAnalytics.NewDesignEvent(eventId + ":" + eventValue);
                }
            }
            else
            {
                GameAnalytics.NewDesignEvent(eventId);
            }
        }
        
        internal static void NewAdEvent(GAAdAction adAction, GAAdType adType, string adSdkName, string adPlacement)
        {
            GameAnalytics.NewAdEvent(adAction, adType,adSdkName, adPlacement);
        }
    }
}
