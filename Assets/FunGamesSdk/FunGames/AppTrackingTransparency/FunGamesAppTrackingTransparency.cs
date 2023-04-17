using FunGames.Sdk;
using FunGames.Sdk.Analytics;
using UnityEngine;
#if UNITY_IOS
using Balaso;
#endif
using FunGames.Sdk.RemoteConfig;
using System.Collections.Generic;
using System.Collections;
// using Facebook.Unity;
#if UNITY_EDITOR
using UnityEditor.Callbacks;
using UnityEditor;
using UnityEditor.iOS.Xcode;
#endif
using System.IO;

namespace FunGamesSdk.FunGames.AppTrackingManager
{
    public class FunGamesAppTrackingTransparency : MonoBehaviour
    {
        private void Start()
        {
            //loadRemoteVar();
            var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");
            // loadRemoteVar();
            if (settings.useATTPopup == false)
            {
                return;
            }



        }
#if UNITY_IOS
        public delegate void ReqCallback();
        public void RequestAuthorizationAppTrackingTransparency(ReqCallback callback)
        {
            AppTrackingTransparency.OnAuthorizationRequestDone += OnAuthorizationRequestDone;
            AppTrackingTransparency.AuthorizationStatus currentStatus = AppTrackingTransparency.TrackingAuthorizationStatus;
            Debug.Log(string.Format("Current authorization status: {0}", currentStatus.ToString()));
            FunGamesAnalytics.NewDesignEvent("GetAppTransparancyStatus", currentStatus.ToString());
            if (currentStatus != AppTrackingTransparency.AuthorizationStatus.AUTHORIZED)
            {
                Debug.Log("Request Tracking");
                AppTrackingTransparency.RequestTrackingAuthorization();
            }
            StartCoroutine(LunchCallback(callback));
        }
        private IEnumerator LunchCallback(ReqCallback callback)
        {
            Debug.Log("Tracking Callback");
            while (AppTrackingTransparency.TrackingAuthorizationStatus != AppTrackingTransparency.AuthorizationStatus.NOT_DETERMINED)
            {
                Debug.Log("Tracking Status : " + AppTrackingTransparency.TrackingAuthorizationStatus);
                yield return null;
            }
            callback();
        }

        /// <summary>
        /// Callback invoked with the user's decision
        /// </summary>
        /// <param name="status"></param>
        private static void OnAuthorizationRequestDone(Balaso.AppTrackingTransparency.AuthorizationStatus status)
        {
            switch (status)
            {
                case Balaso.AppTrackingTransparency.AuthorizationStatus.NOT_DETERMINED:
                    Debug.Log("AuthorizationStatus: NOT_DETERMINED");
                    break;
                case Balaso.AppTrackingTransparency.AuthorizationStatus.RESTRICTED:
                    Debug.Log("AuthorizationStatus: RESTRICTED");
                    break;
                case Balaso.AppTrackingTransparency.AuthorizationStatus.DENIED:
                    Debug.Log("AuthorizationStatus: DENIED");
                    break;
                case Balaso.AppTrackingTransparency.AuthorizationStatus.AUTHORIZED:
                    Debug.Log("AuthorizationStatus: AUTHORIZED");
                    break;
            }

            FunGamesAnalytics.NewDesignEvent("ATTAuthorizationStatus", status.ToString());
            // FB.Mobile.SetAdvertiserTrackingEnabled(FunGamesAppTrackingTransparency.isAuthorizeTracking());
            // Obtain IDFA
            Debug.Log(string.Format("IDFA: {0}", Balaso.AppTrackingTransparency.IdentifierForAdvertising()));
        }

        public static bool isAuthorizeTracking()
        {
            AppTrackingTransparency.AuthorizationStatus currentStatus = AppTrackingTransparency.TrackingAuthorizationStatus;
            if (currentStatus != AppTrackingTransparency.AuthorizationStatus.AUTHORIZED)
            {
                return true;
            }
            return false;
        }
#endif

        // Callback for FetchValues

        //         public static void FetchComplete()
        //         {
        //             // Get a dictionary of all the variables known by the SDK, with their correct value

        //             var values = FunGamesRemoteConfig.GetValuesDictionary();

        //             foreach (var variable in values)
        //             {
        //                 Debug.Log(variable.Key + " : " + variable.Value);
        //             }

        //             // Get a variable by its key, with its correct value

        //             var Test2 = FunGamesRemoteConfig.GetValueByKey("Test2");

        //             Debug.Log("Test2 :: " + Test2);




        //             var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

        //             if (settings.useATTPopup == false)
        //             {
        //                 return;
        //             }

        // #if UNITY_IOS
        //             AppTrackingTransparency.OnAuthorizationRequestDone += OnAuthorizationRequestDone;
        //             AppTrackingTransparency.AuthorizationStatus currentStatus = AppTrackingTransparency.TrackingAuthorizationStatus;
        //             Debug.Log(string.Format("Current authorization status: {0}", currentStatus.ToString()));
        //             FunGamesAnalytics.NewDesignEvent("GetAppTransparancyStatus", currentStatus.ToString());
        //             if (currentStatus != AppTrackingTransparency.AuthorizationStatus.AUTHORIZED)
        //             {
        //                 Debug.Log("Requesting authorization...");
        //                 AppTrackingTransparency.RequestTrackingAuthorization();
        //             }
        // #endif
        //         }

        //         public void loadRemoteVar()
        //         {
        //             // Define the variables you want to remotely configure
        //             var values = new Dictionary<string, object>
        //             {
        //                 {"Variable1", 0},
        //                 {"Test2", 0}
        //             };

        //             // Set those variables as default in the SDK

        //             FunGamesRemoteConfig.SetDefaultValues(values);

        //             // Fetch the values of your variables that are defined on our API
        //             // You can use a callback in argument that will be call when the values are fetch
        //             FunGamesRemoteConfig.FetchValues(FetchComplete);
        //             //FunGamesRemoteConfig.FetchValues(null);
        //         }

        public static FunGamesAppTrackingTransparency _instance;


        private void Awake()
        {
            if (_instance == null)
            {

                _instance = this;
                DontDestroyOnLoad(this.gameObject);
            }
            else
            {
                Destroy(this);
            }
            //RequestAuthorizationAppTrackingTransparency();
        }
        /* #if UNITY_IOS
                #region AppTracking
                public delegate void ReqCallback();
                public void RequestAuthorizationAppTrackingTransparency(ReqCallback callback)
                {
                    if (ATTrackingStatusBinding.GetAuthorizationTrackingStatus() == ATTrackingStatusBinding.AuthorizationTrackingStatus.NOT_DETERMINED)
                    {
                        Debug.Log("Request Tracking");
                        ATTrackingStatusBinding.RequestAuthorizationTracking();
                    }
                    StartCoroutine(LunchCallback(callback));
                }

                private IEnumerator LunchCallback(ReqCallback callback)
                {
                    Debug.Log("Tracking Callback");
                    while (ATTrackingStatusBinding.GetAuthorizationTrackingStatus() ==
                    ATTrackingStatusBinding.AuthorizationTrackingStatus.NOT_DETERMINED)
                    {
                        Debug.Log("Tracking Status : " + ATTrackingStatusBinding.GetAuthorizationTrackingStatus());
                        yield return null;
                    }
                    callback();
                }

                public bool isTrackingAllow()
                {
                    return ATTrackingStatusBinding.GetAuthorizationTrackingStatus() == ATTrackingStatusBinding.AuthorizationTrackingStatus.AUTHORIZED || ATTrackingStatusBinding.GetAuthorizationTrackingStatus() == ATTrackingStatusBinding.AuthorizationTrackingStatus.NOT_DETERMINED;
                }
                #endregion 
        #endif*/
        //         #region PLIST
        // #if UNITY_EDITOR
        //         /// <summary>
        //         /// Description for IDFA request notification 
        //         /// [sets NSUserTrackingUsageDescription]
        //         /// </summary>
        //         const string TrackingDescription =
        //             "This identifier will be used to deliver personalized ads to you. ";

        //         [PostProcessBuild(0)]
        //         public static void OnPostprocessBuild(BuildTarget buildTarget, string pathToXcode)
        //         {
        //             if (buildTarget == BuildTarget.iOS)
        //             {
        //                 AddPListValues(pathToXcode);
        //             }
        //         }

        //         static void AddPListValues(string pathToXcode)
        //         {
        //             // Get Plist from Xcode project 
        //             string plistPath = pathToXcode + "/Info.plist";

        //             // Read in Plist 
        //             PlistDocument plistObj = new PlistDocument();
        //             plistObj.ReadFromString(File.ReadAllText(plistPath));

        //             // set values from the root obj
        //             PlistElementDict plistRoot = plistObj.root;

        //             // Set value in plist
        //             plistRoot.SetString("NSUserTrackingUsageDescription", TrackingDescription);

        //             // save
        //             File.WriteAllText(plistPath, plistObj.WriteToString());
        //         }
        // #endif
        //         #endregion
    }
}