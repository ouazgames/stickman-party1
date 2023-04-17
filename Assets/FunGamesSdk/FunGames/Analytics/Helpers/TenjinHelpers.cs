using System.Collections.Generic;
using FunGamesSdk;
using GameAnalyticsSDK;
using UnityEngine;

namespace FunGames.Sdk.Analytics.Helpers
{
    public class TenjinHelpers : MonoBehaviour
    {
        private static bool _isFirstSession;

        public static void Initialize()
        {
            var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

            if (settings.useTenjin == false)
            {
                return;
            }

            var instance = Tenjin.getInstance(settings.tenjinApiKey);

            instance.Connect();
            instance.GetDeeplink(DeferredDeeplinkCallback);
        }

        public void OnApplicationPause(bool pause)
        {
            if (pause)
            {
                return;
            }

            var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");
            var instance = Tenjin.getInstance(settings.tenjinApiKey);

            instance.Connect();
        }

        private static void DeferredDeeplinkCallback(Dictionary<string, string> data)
        {
            if (data.ContainsKey("is_first_session"))
            {
                _isFirstSession = data["is_first_session"] == "true";
            }

            if (_isFirstSession == false)
                return;

            var call = "";

            if (data.ContainsKey("ad_network"))
            {
                call += data["ad_network"];
            }
            else
            {
                call += "organic";
            }

            call += ";";

            if (data.ContainsKey("campaign_id"))
            {
                call += data["campaign_id"];
            }
            else
            {
                call += "unknown";
            }

            // FunGamesApiAnalytics.NewEvent("ga_new_user", call);
        }
    }
}

