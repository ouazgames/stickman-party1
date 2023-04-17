using System;
using SimpleJSON;
using UnityEngine;

namespace FunGames.Sdk.Tune.Helpers
{
    public class Question
    {
        public readonly string Name;
        public readonly object[] ListAlternatives;
        public readonly RangeInt RangeAlternatives = new RangeInt(0, 0);
        public readonly object DefaultValue;
        public Action<Answer> Callback;
        
        public Question(
            string name,
            object[] alternatives,
            object defaultValue,
            Action<Answer> callback)
        {
            Name = name;
            ListAlternatives = alternatives;
            DefaultValue = defaultValue;
            Callback = callback;
        }
        
        public Question(
            string name,
            RangeInt alternatives,
            object defaultValue,
            Action<Answer> callback)
        {
            Name = name;
            RangeAlternatives = alternatives;
            DefaultValue = defaultValue;
            Callback = callback;
        }
        
        public JSONNode ToJson()
        {
            if (Name is null)
            {
                Debug.LogError("FunGameTune : Cannot create Question with null name");
                return null;
            }
            if (ListAlternatives is null && RangeAlternatives.start is 0 && RangeAlternatives.end is 0)
            {
                Debug.LogError("FunGameTune : Cannot create Question with null alternatives");
                return null;
            }
            var questionJson = new JSONObject();
            var alternativesJson = new JSONArray();

            questionJson.Add("name", Name);
            
            if (ListAlternatives is null)
            {
                questionJson.Add("type", "range");
                AddRangeAlternatives(alternativesJson);
            }
            else
            {
                questionJson.Add("type", "list");
                AddListAlternatives(alternativesJson);
            }
            
            questionJson.Add("answers", alternativesJson);
            SimpleJsonHelpers.AddObjectToJsonObject(ref questionJson, "current_value", DefaultValue);
            
            return questionJson;
        }

        private void AddListAlternatives(JSONArray alternativesJson)
        {
            foreach (var obj in ListAlternatives)
            {
                SimpleJsonHelpers.AddObjectToJsonArray(ref alternativesJson, obj);
            }
        }

        private void AddRangeAlternatives(JSONArray alternativesJson)
        {
            SimpleJsonHelpers.AddObjectToJsonArray(ref alternativesJson, RangeAlternatives.start);
            SimpleJsonHelpers.AddObjectToJsonArray(ref alternativesJson, RangeAlternatives.length);
        }
    }
}