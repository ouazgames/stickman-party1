using System;
using System.Collections.Generic;
using FunGames.Sdk.Tools;
using Proyecto26;
using SimpleJSON;
using UnityEngine;

namespace FunGames.Sdk.Tune.Helpers
{
    public class QuestionHelpers
    {
        private static string _questionApi = "https://api.tnapps.xyz/v1/game_tune/ask/";
        private static string _idfa = "";
        
        internal static void Initialize()
        {
            SetApiEntryPoint();
            if (Application.isEditor == false)
            {
                Application.RequestAdvertisingIdentifierAsync(
                    (advertisingId, trackingEnabled, error) =>{ 
                        _idfa = advertisingId;
                    }
                );
            }
            else
            {
                _idfa = "unity-editor";
            }
        }

        private static void SetApiEntryPoint()
        {
            _questionApi += Application.identifier;
        }

        public static void SendQuestions(Question question)
        {
            var array = new [] {question};
            
            SendQuestions(array);
        } 

        public static void SendQuestions(IEnumerable<Question> questions)
        {
            var questionsNode = GetQuestionsJsonNode(questions);

            var bodyString = questionsNode.ToString();
            var hash = FunGamesApiHelpers.CreateToken(bodyString);
            var bitString = FunGamesApiHelpers.GetBitString();

            RestClient.DefaultRequestHeaders["Content-Type"] = "application/json";
            RestClient.DefaultRequestHeaders["User-Agent"] = SystemInfo.deviceModel;
            RestClient.DefaultRequestHeaders["Authorization"] = "HMAC " + bitString + " " + hash;
            RestClient.DefaultRequestHeaders["x-device-id"] = SystemInfo.deviceUniqueIdentifier;

            /*
            Debug.Log("Authorization :" + "HMAC" + bitString + " " + hash);
            Debug.Log("bodyString : " + bodyString);
            Debug.Log("Agent :" + SystemInfo.deviceModel);
            Debug.Log("Device-id :" + SystemInfo.deviceModel);
            */

            RestClient.Post(_questionApi, bodyString)
                .Then(response =>
                {
                    ParseResponse(response.Text, questions);
                })
                .Catch(err =>
                {
                    Debug.LogError(err.ToString());
                    ResponseError(questions);
                });
        }

        private static JSONNode GetQuestionsJsonNode(IEnumerable<Question> questions)
        {
            var node = new JSONObject();
            var array = new JSONArray();

            foreach (var q in questions)
            {
                var qNode = q.ToJson();

                if (qNode is null)
                {
                    return null;
                }
                array.Add(qNode);
            }
            
            node.Add("questions", array);
            
            return node;
        }

        private static void ParseResponse(string json, IEnumerable<Question> questions)
        {
            if (json is null || questions is null)
            {
                return;
            }

            // Debug.Log("Response : " + json);
            
            var node = JSON.Parse(json);
            var answers = node["answers"];
            var i = 0;
            
            foreach (var q in questions)
            {
                if (answers[i] is null)
                    return;
                var answer = new Answer(answers[i].ToString(), q);
                ++i;
                q.Callback(answer);
            }
        }

        private static void ResponseError(IEnumerable<Question> questions)
        {
            foreach (var q in questions)
            {
                var answer = new Answer(null, null);

                answer.name = q.Name;
                answer.value = q.DefaultValue;
                
                q.Callback(answer);
            }
        }
    }
}