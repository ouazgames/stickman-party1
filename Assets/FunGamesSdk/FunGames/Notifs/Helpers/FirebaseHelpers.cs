/*using System;
using UnityEngine;
using Firebase;
using Firebase.Messaging;
using FunGames.Sdk.Analytics;

namespace FunGames.Sdk.Notifs.Helpers
{
    public static class FirebaseHelpers
    {
        internal static void Initialize()
        {
            FirebaseApp app;
            
            Debug.Log("Init FCM...");
            FirebaseApp.CheckAndFixDependenciesAsync().ContinueWith(task => {
                var dependencyStatus = task.Result;
                if (dependencyStatus == DependencyStatus.Available) {
                    app = FirebaseApp.DefaultInstance;
                    Debug.Log("FCM Dependencies ok...");

                    InitFcm();
                } else {
                    Debug.LogError($"Could not resolve all Firebase dependencies: {dependencyStatus}");
                }
            });
        }
        
        private static void InitFcm()
        {
            Debug.Log("Setting FCM callbacks....");

            FirebaseMessaging.TokenReceived += OnTokenReceived;
            FirebaseMessaging.MessageReceived += OnMessageReceived;
            FirebaseMessaging.TokenRegistrationOnInitEnabled = false;
        }
        
        private static void OnTokenReceived(object sender, TokenReceivedEventArgs token) {
            Debug.Log("Received Registration Token: " + token.Token);
            SendTokenToFunGamesApi(token);
        }

        private static void OnMessageReceived(object sender, MessageReceivedEventArgs e) {
            Debug.Log("Received a new message from: " + e.Message.From);
        }

        private static void SendTokenToFunGamesApi(TokenReceivedEventArgs token)
        {
            FunGamesAnalytics.NewDesignEvent("firebaseToken",token.Token);
        }
    }
}*/