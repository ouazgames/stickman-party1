using System.IO;
using FunGames.Sdk.Tune.Helpers;
using SimpleJSON;
using UnityEngine;

namespace FunGamesSdk.FunGames.RemoteConfig.Helpers
{
    public static class Cache
    {
        private static readonly string CachePath = Path.Combine(Application.persistentDataPath, "remoteConfig.json");
        
        public static void Initialize()
        {
            CheckInitialization();
        }

        public static bool IsVariableCached(string key)
        {
            if (key == null)
                return false;
            CheckInitialization();

            var cachedJson = JSON.Parse(File.ReadAllText(CachePath));

            return cachedJson.HasKey(key);
        }

        public static JSONNode GetRoot()
        {
            CheckInitialization();

            return JSON.Parse(File.ReadAllText(CachePath));
        }

        public static object GetValueByKey(string key)
        {
            if (key == null)
                return null;
            CheckInitialization();

            var cachedJson = JSON.Parse(File.ReadAllText(CachePath));
            
            return SimpleJsonHelpers.GetObjectFromJsonNode(cachedJson["remoteVariables"][key]);
        }

        public static void AddVariable(string key, object value)
        {
            if (key == null)
                return;
            CheckInitialization();

            var cachedJson = JSON.Parse(File.ReadAllText(CachePath));

            if (value is JSONNode val)
            {
                value = SimpleJsonHelpers.GetObjectFromJsonNode(val);
            }
            var obj = cachedJson["remoteVariables"].AsObject;
            SimpleJsonHelpers.AddObjectToJsonObject(ref obj, key, value);
            
            File.WriteAllText(CachePath, cachedJson.ToString());
        }
        
        public static void EraseVariable(string key)
        {
            if (key == null)
                return;
            CheckInitialization();

            var cachedJson = JSON.Parse(File.ReadAllText(CachePath));
            
            cachedJson["remoteVariables"].Remove(key);
            File.WriteAllText(CachePath, cachedJson.ToString());
        }

        public static void AddNode(JSONNode node, string key = "")
        {
            if (node == null)
                return;
            CheckInitialization();

            var cachedJson = JSON.Parse(File.ReadAllText(CachePath));

            cachedJson.Add(key, node);
            File.WriteAllText(CachePath, cachedJson.ToString());
        }

        public static void RemoveNode(string key)
        {
            if (key == null)
                return;
            CheckInitialization();

            var cachedJson = JSON.Parse(File.ReadAllText(CachePath));

            cachedJson.Remove(key);
            File.WriteAllText(CachePath, cachedJson.ToString());
        }
        
        private static void CheckInitialization()
        {
            if (File.Exists(CachePath))
            {
                var cachedJson = JSON.Parse(File.ReadAllText(CachePath));

                if (cachedJson.HasKey("remoteVariables"))
                {
                    return;
                }
            }
            var json = new JSONObject();

            json.Add("remoteVariables", new JSONObject());
            File.WriteAllText(CachePath, json.ToString());
        }
        
    }
}