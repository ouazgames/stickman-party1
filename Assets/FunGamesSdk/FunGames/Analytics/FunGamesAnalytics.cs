using UnityEngine;
using System;
using FunGames.Sdk.Analytics.Helpers;
using FunGamesSdk;
using FunGamesSdk.FunGames.Analytics.Helpers;
using GameAnalyticsSDK;

namespace FunGames.Sdk.Analytics
{
    internal class FunGamesAnalytics : MonoBehaviour
    {
        private static bool _newSession;

        private static FunGamesAnalytics _funGamesAnalytics;

        private void Start()
        {
            DontDestroyOnLoad(this);
            var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

            if (settings.useGameAnalytics == false)
            {
                return;
            }

            if (_funGamesAnalytics == null)
            {
                _funGamesAnalytics = this;

                TenjinHelpers.Initialize();
                GameAnalyticsHelpers.Initialize();
                // FunGamesApiAnalytics.Initialize();
            }
            else
            {
                Destroy(gameObject);
            }
        }

        private void OnValidate()
        {
            var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

            if (settings.useGameAnalytics == false)
            {
                return;
            }

            var gameAnalytics = FindObjectOfType<GameAnalytics>();

            if (settings.useGameAnalytics && gameAnalytics == null)
                throw new Exception("It seems like you haven't instantiated GameAnalytics GameObject");
        }

        private void OnApplicationFocus(bool hasFocus)
        {
            if (hasFocus == false)
            {
                return;
            }

            if (_newSession)
            {
                _newSession = false;
            }
        }

        private void OnApplicationPause(bool pause)
        {
            if (pause == false)
            {
                return;
            }

            var datetimeString = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            // FunGamesApiAnalytics.NewEvent("ga_session_end",datetimeString);
        }

        private void OnApplicationQuit()
        {
            var datetimeString = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");

            // FunGamesApiAnalytics.NewEvent("ga_session_end",datetimeString);
        }

        public static void NewProgressionEvent(string typeEvent, string level, string subLevel = "", int score = -1)
        {
            switch (typeEvent)
            {
                case "Start":
                    OnLevelStart(level, subLevel);
                    break;
                case "Complete":
                    OnLevelComplete(level, subLevel, score);
                    break;
                case "Fail":
                    OnLevelFail(level, subLevel, score);
                    break;
                default:
                    Debug.LogError("typeEvent must set to either Start, Fail, Complete");
                    break;
            }
        }

        public static void OnLevelStart(string level, string subLevel = "")
        {
            GameAnalyticsHelpers.ProgressionEvent("Start", level, subLevel);
            // FunGamesApiAnalytics.NewEvent("ga_progression","Start;" + level + ";" + subLevel);
        }

        public static void OnLevelComplete(string level, string subLevel = "", int score = -1)
        {
            GameAnalyticsHelpers.ProgressionEvent("Complete", level, subLevel, score);
            // FunGamesApiAnalytics.NewEvent("ga_progression","Complete;" + level + ";" + subLevel + ";" + score);
        }

        public static void OnLevelFail(string level, string subLevel = "", int score = -1)
        {
            GameAnalyticsHelpers.ProgressionEvent("Fail", level, subLevel, score);
            // FunGamesApiAnalytics.NewEvent("ga_progression","Fail;" + level + ";" + subLevel + ";" + score);
        }

        public static void NewDesignEvent(string eventId, string eventValue = "")
        {
            if (eventValue != "")
            {
                GameAnalyticsHelpers.NewDesignEvent(eventId, eventValue);
                // FunGamesApiAnalytics.NewEvent("ga_design",eventId + ";" + eventValue);
            }
            else
            {
                GameAnalyticsHelpers.NewDesignEvent(eventId);
                // FunGamesApiAnalytics.NewEvent("ga_design",eventId);
            }
        }

        public static void NewAdEvent(GAAdAction adAction, GAAdType adType)
        {
            GameAnalyticsHelpers.NewAdEvent(adAction, adType, "Max", "null");
            // FunGamesApiAnalytics.NewEvent("ga_design",adType + ";" + adAction);
        }

        public static void NewCohortEvent(string cohortName, string userCohortAssigned)
        {
            GameAnalyticsHelpers.NewDesignEvent("cohort:" + cohortName + ":" + userCohortAssigned);
            // FunGamesApiAnalytics.NewEvent("ga_design",cohortName + ";" + userCohortAssigned);
        }

        // public static string GetFunnelValue(string varName)
        // {
        //     return FunGamesApiAnalytics.GetFunnelValue(varName);
        // }
    }
}