using System;
using System.Linq;
using FunGames.Sdk.Analytics;
using FunGames.Sdk.Tune.Helpers;
using SimpleJSON;
using UnityEngine;

namespace FunGames.Sdk.Tune
{
    [Serializable]
    public class Answer
    {
        public string name;
        public object value;

        public Answer(
            string json,
            Question question)
        {
            if (json is null || question is null)
                return;

            Debug.Log("Answer : " + json);
            
            var responseNode = JSON.Parse(json);

            name = responseNode["name"];
            
            if (name != question.Name)
                return;

            var nodeValue = SimpleJsonHelpers.GetObjectFromJsonNode(responseNode["value"]);
            
            value = nodeValue;
            
            if (CheckValues(question) == false)
            {
                value = question.DefaultValue;
            }
            FunGamesAnalytics.NewDesignEvent("FunGamesTune", name + ":" + value);
        }

        private bool CheckValues(Question question)
        {
            if (!(question.ListAlternatives is null))
            {
                return question.ListAlternatives.Contains(value);
            }
            if (value is double d)
            {
                return d >= question.RangeAlternatives.start && d < question.RangeAlternatives.length;
            }
            return false;
        }
    }
}