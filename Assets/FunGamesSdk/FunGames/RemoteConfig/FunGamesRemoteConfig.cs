using System;
using System.Collections.Generic;
using FunGamesSdk.FunGames.RemoteConfig.Helpers;
using UnityEngine;


namespace FunGames.Sdk.RemoteConfig
{
    public class FunGamesRemoteConfig : MonoBehaviour
    {
        public void Awake()
        {
            RemoteConfigHelpers.Initialize();
        }

        public static void SetDefaultValues(Dictionary<string, object> defaultValues) =>
            RemoteConfigHelpers.SetDefaultValues(defaultValues);
        
        public static void FetchValues(Action callback) => RemoteConfigHelpers.FetchVariables(callback);
        
        public static Dictionary<string, object> GetValuesDictionary() => RemoteConfigHelpers.GetValuesDictionary();
        
        public static object GetValueByKey(string key) => RemoteConfigHelpers.GetValueByKey(key);
    }
}