using System;
using System.Collections.Generic;
using FunGames.Sdk.Analytics;
using UnityEngine;
using FunGames.Sdk.Tune.Helpers;

namespace FunGames.Sdk.Tune
{
    class FunGamesTune : MonoBehaviour
    {
        public void Awake()
        {
            QuestionHelpers.Initialize();
        }

        public static void SendQuestions(IEnumerable<Question> questions) => QuestionHelpers.SendQuestions(questions);
        public static void SendQuestions(Question question) => QuestionHelpers.SendQuestions(question);
    }
}