using System.Collections.Generic;
using UnityEngine;
using Proyecto26;
using UnityEngine.Analytics;
using System;
using FunGames.Sdk.Analytics.Helpers;
using FunGames.Sdk.Analytics.Funnel;
using System.Collections;
using System.Security.Cryptography;
using System.Text;
using FunGames.Sdk.Tools;
using FunGamesSdk.FunGames.Analytics.Helpers;

namespace FunGames.Sdk.Analytics.Helpers
{
    // internal class FunGamesApiAnalytics
    // {
    //     private const string AnalyticsUrl = "https://api.tnapps.xyz/v1/tracking";
    //     private static string _idfa = "";

    //     internal static void Initialize()
    //     {
    //         var datetimeString = DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString();

    //         if (Application.isEditor == false)
    //         {
    //             Application.RequestAdvertisingIdentifierAsync(
    //                 (advertisingId, trackingEnabled, error) =>{ 
    //                     _idfa = advertisingId;
    //                     NewEvent("ga_user",datetimeString);
    //                 }
    //             );
    //         }
    //         else
    //         {
    //             _idfa = "unity-editor";
    //             NewEvent("ga_user",datetimeString);
    //         }
    //         FunGamesFunnel.Initialize();
    //     }

    //     private static Dictionary<string, string> GetUserInfo(Dictionary<string, string> parameters = null)
    //     {
    //         if (parameters == null)
    //         {
    //             parameters = new Dictionary<string, string>();
    //         }

    //         var userId = AnalyticsSessionInfo.userId;
    //         var sessionId = AnalyticsSessionInfo.sessionId.ToString();

    //         parameters.Add("bundle_id", Application.identifier);
    //         parameters.Add("user_id", userId);
    //         parameters.Add("session_id",sessionId);
    //         parameters.Add("idfa",_idfa);
    //         parameters.Add("os",SystemInfo.operatingSystem);
    //         parameters.Add("build", Application.version);

    //         return parameters;
    //     }

    //     internal static void NewEvent(string eventName, string value)
    //     {
    //         var userInfo = GetUserInfo();

    //         var trackingParams = new FunGamesTracking()
    //         {
    //             idfa = userInfo["idfa"],
    //             bundle_id = userInfo["bundle_id"],
    //             session_id = userInfo["session_id"],
    //             os = userInfo["os"],
    //             build = userInfo["build"],
    //             metrics = new List<Metrics>
    //             {
    //                 new Metrics
    //                 {
    //                     evt = eventName,
    //                     value = value,
    //                     ts = DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString()
    //                 }
    //             }
    //         };

    //         var bodyString = JsonUtility.ToJson(trackingParams);
    //         var hash = FunGamesApiHelpers.CreateToken(bodyString);
    //         var bitString = FunGamesApiHelpers.GetBitString();

    //         RestClient.DefaultRequestHeaders["Content-Type"] = "application/json";
    //         RestClient.DefaultRequestHeaders["Authorization"] = "hmac " + bitString + " " + hash;
    //         RestClient.DefaultRequestHeaders["User-Agent"] = SystemInfo.deviceModel;

    //         RestClient.Post(AnalyticsUrl, trackingParams).Then(response => {
    //             ParseResponse(response.Text);
    //         }).Catch(err => {
    //             Debug.Log (err.Message);
    //         });
    //     }

    //     private static void ParseResponse(string response)
    //     {
    //         FunGamesFunnel.ParseFunnel(response);
    //     }

    //     public static string GetFunnelValue(string varName)
    //     {
    //         return FunGamesFunnel.GetValue(varName);
    //     }
    // }
}