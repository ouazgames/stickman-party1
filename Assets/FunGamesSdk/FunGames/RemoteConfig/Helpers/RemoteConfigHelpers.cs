using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using FunGames.Sdk.Analytics;
using FunGames.Sdk.Tools;
using FunGames.Sdk.Tune.Helpers;
using Proyecto26;
using SimpleJSON;
using UnityEngine;

namespace FunGamesSdk.FunGames.RemoteConfig.Helpers
{
    internal static class RemoteConfigHelpers
    {
        private static string _remoteConfigApi = "https://api.tnapps.xyz/v1/abtests/";

        private static Dictionary<string, object> _variables;

        internal static void Initialize()
        {
            _variables = new Dictionary<string, object>();
            SetApiEntryPoint();
            Cache.Initialize();
        }
        
        private static void SetApiEntryPoint()
        {
            _remoteConfigApi += Application.identifier;
        }
        
        internal static void SetDefaultValues(Dictionary<string, object> defaultValues)
        {
            foreach (var variable in defaultValues)
            {
                _variables.Add(variable.Key, variable.Value);
            }
        }

        internal static void FetchVariables(Action callback)
        {
            var hash = FunGamesApiHelpers.CreateToken(_remoteConfigApi);
            var bitString = FunGamesApiHelpers.GetBitString();
            
            RestClient.DefaultRequestHeaders["Content-Type"] = "application/json";
            RestClient.DefaultRequestHeaders["User-Agent"] = SystemInfo.deviceModel;
            RestClient.DefaultRequestHeaders["Authorization"] = "HMAC " + bitString + " " + hash;
            /**
             * To test the different cohorts it is necessary to modify the device id
             * For example, you can use 1111-1111-1111-1111 or 1111-1111-1111-1112
             * Be careful to do only for testing, you have to leave SystemInfo.deviceUniqueIdentifier in release
             */
            RestClient.DefaultRequestHeaders["x-device-id"] = SystemInfo.deviceUniqueIdentifier;
            RestClient.DefaultRequestHeaders["x-app-build"] = Application.version;

            RestClient.Get(_remoteConfigApi)
                .Then(response =>
                {
                    Debug.Log(response.Text);
                    HandleResponse(response.Text);
                    CacheResponse(response.Text);
                    Debug.Log("[Remote Config] Fetch OK");
                    if(callback != null)
                        callback();
                })
                .Catch(err =>
                {
                    Debug.Log("[Remote Config] Fetch KO");
                    Debug.LogWarning(err.Message);
                    GetCachedResponse();
                    if (callback != null)
                        callback();
                });
        }

        internal static Dictionary<string, object> GetValuesDictionary()
        {
            return _variables;
        }
        
        internal static object GetValueByKey(string key)
        {
            if (_variables is null || key is null)
            {
                return null;
            }
            
            return _variables[key];
        }

        private static void HandleResponse(string response)
        {
            var node = JSON.Parse(response);
            Debug.Log("HandleResponse");
            foreach (var elem in node.AsArray)
            {
                if (elem.Value.HasKey("type") && elem.Value["type"].Value == "CONFIG")
                {
                    HandleJsonNode(elem);
                }
            }
            foreach (var elem in node.AsArray)
            {
                if (elem.Value.HasKey("type") && elem.Value["type"].Value == "ABTEST")
                {
                    HandleJsonNode(elem);
                }
            }
        }

        private static void HandleJsonNode(JSONNode node)
        {
            SendCohortToApi(node["id"].Value, node["name"].Value);
            Debug.Log("HandleJsonNode");
            if (node.HasKey("params"))
            {
                MergeVariables(node["params"]);
            }
            else
            {
                MergeVariable(node["param_name"], node["param_value"]);
            }
        }
        
        private static void SendCohortToApi(string id, string name)
        {
            Debug.Log("New Design Event : " + "RemoteConfigCohort:" + id + ":" + name);
            FunGamesAnalytics.NewDesignEvent("RemoteConfigCohort", id + ":" + name);
        }

        private static void MergeVariables(JSONNode node)
        {
            var keys = node.Keys;
            var values = node.Values;

            for (var i = 0; i < node.Children.Count(); i++)
            {
                keys.MoveNext();
                values.MoveNext();
                MergeVariable(keys.Current, values.Current);
            }
        }

        private static void MergeVariable(string key, JSONNode value)
        {
            if (!_variables.ContainsKey(key))
            {
                return;
            }
            _variables[key] = SimpleJsonHelpers.GetObjectFromJsonNode(value);
        }

        private static void CacheResponse(string response)
        {
            var node = JSON.Parse(response);

            foreach (var elem in node.AsArray)
            {
                if (elem.Value.HasKey("type") && elem.Value["type"].Value == "CONFIG")
                {
                    CacheConfigNode(elem);
                }
                else if (elem.Value.HasKey("type") && elem.Value["type"].Value == "ABTEST")
                {
                    CacheTestNode(elem);
                }
            }
        }

        private static void CacheConfigNode(JSONNode node)
        {
            if (node.HasKey("params"))
            {
                var keys = node["params"].Keys;
                var values = node["params"].Values;

                for (var i = 0; i < node["params"].Children.Count(); i++)
                {
                    keys.MoveNext();
                    values.MoveNext();
                    Cache.AddVariable(keys.Current, values.Current);
                }
            }
            else
            {
                Cache.AddVariable(node["param_name"], node["param_value"]);
            }
        }
        
        private static void CacheTestNode(JSONNode node)
        {
            var key = node["name"].Value;
            
            if (node.HasKey("params") == false)
            {
                var par = new JSONObject();

                par.Add(node["param_name"], node["param_value"]);
                
                node.Add("params", par);
                node.Remove("param_name");
                node.Remove("param_value");
            }
            
            node.Remove("id");
            node.Remove("name");
            node.Remove("startTs");
            node.Remove("cohort");
            node.Remove("app_id");
            node.Remove("type");
            node.Remove("updateTime");
            
            Cache.AddNode(node, key);
        }

        private static void GetCachedResponse()
        {
            var cachedJson = Cache.GetRoot();
            var currentTimestamp = DateTime.Now.ToUniversalTime();
            var keys = cachedJson.Keys;
            var values = cachedJson.Values;
            
            for (var i = 0; i <  cachedJson.Children.Count(); i++)
            {
                keys.MoveNext();
                values.MoveNext();
                if (keys.Current == "remoteVariables")
                {
                    MergeVariables(values.Current);
                }
                else if (IsExpired(currentTimestamp, values.Current["endTs"].Value))
                {
                    Cache.RemoveNode(keys.Current);
                }
                else
                {
                    MergeVariables(values.Current["params"]);
                }
            }
        }

        private static bool IsExpired(DateTime now, string endTs)
        {
            var endTsValue = DateTime.Parse(endTs, null, DateTimeStyles.RoundtripKind);

            return now > endTsValue;
        }
    }
}