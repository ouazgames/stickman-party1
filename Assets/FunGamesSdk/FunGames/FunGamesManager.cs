using System;
using System.Collections;
using System.Collections.Generic;
using FunGames.Sdk.Analytics;
using FunGames.Sdk.Analytics.Helpers;
using FunGames.Sdk.RemoteConfig;
using FunGamesSdk;
using FunGamesSdk.FunGames.AppTrackingManager;
using FunGamesSdk.FunGames.Gdpr;
// using OgurySdk;
using UnityEngine;
#if UNITY_IOS
using UnityEngine.iOS;
#endif

public class FunGamesManager : MonoBehaviour
{
    public static FunGamesManager _instance;


    private void Awake()
    {
        if (_instance == null)
        {

            _instance = this;
            DontDestroyOnLoad(this.gameObject);

            // Rest of your Awake code
            FunGamesMax.Awake();
        }
        else
        {
            Destroy(this);
        }
    }
    public bool forceATT = false;
    // Start is called before the first frame update
    void Start()
    {
        var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");
        // First thing to init is Max but not ads
        if (settings.useMax || settings.Use_IronSourceOnly)
        {
            MaxSdkCallbacks.OnSdkInitializedEvent += MaxIniCallback;
            FunGamesMax.Start();
        }
#if UNITY_IOS && !UNITY_EDITOR
        Version currentVersion = new Version(Device.systemVersion);
        Version iOSATT = new Version("14.5");
        Debug.Log("IOS device version : " + currentVersion + " target version : " + iOSATT);
        if (currentVersion >= iOSATT || forceATT)
        {
            FunGamesAnalytics.NewDesignEvent("ShowingATT", "true");
            FunGamesAppTrackingTransparency._instance.RequestAuthorizationAppTrackingTransparency(FinishTracking);
        }
        else
        {
            FinishTracking();   
        }
#endif
    }
    public void MaxIniCallback(MaxSdkBase.SdkConfiguration sdkConfiguration)
    {
        Debug.Log("OnSdkInitializedEvent Max");
        if (!PlayerPrefs.HasKey("NeedGDPR"))
        {
            if (sdkConfiguration.ConsentDialogState == MaxSdkBase.ConsentDialogState.Applies)
            {
                // Show user consent dialog
                Debug.Log("Show user consent dialog");
                FunGamesGdpr._instance.ShowGDPR();
                GPDRpanelManager._instance.ValidateCallback += EndGDPR;
            }
            else if (sdkConfiguration.ConsentDialogState == MaxSdkBase.ConsentDialogState.DoesNotApply)
            {
                PlayerPrefs.SetInt("NeedGDPR", 0);
                MaxSdk.SetHasUserConsent(true);
                MaxSdk.SetIsAgeRestrictedUser(false);
                MaxSdk.SetDoNotSell(true);
                FunGamesMax.InitializeAds();
            }
            else
            {
                MaxSdk.SetHasUserConsent(true);
                MaxSdk.SetIsAgeRestrictedUser(false);
                MaxSdk.SetDoNotSell(true);
                FunGamesMax.InitializeAds();
                // Consent dialog state is unknown. Proceed with initialization, but check if the consent
                // dialog should be shown on the next application initialization
            }
        }
        else
        {
            FunGamesMax.InitializeAds();
        }
    }

    private void OnApplicationPause(bool pauseStatus)
    {
        FunGamesMax._OnApplicationPause(pauseStatus);
    }

    public void EndGDPR()
    {
        PlayerPrefs.SetInt("GDPRAnswered", 1);
        PlayerPrefs.SetInt("NeedGDPR", 1);
        MaxSdk.SetHasUserConsent(true);
        MaxSdk.SetIsAgeRestrictedUser(false);
        MaxSdk.SetDoNotSell(true);
        FunGamesMax.InitializeAds();
    }

    public static void FinishTracking()
    {
#if UNITY_IOS && !UNITY_EDITOR
        if(FunGamesAppTrackingTransparency.isAuthorizeTracking())
            FunGamesAnalytics.NewDesignEvent("AllowTracking", "true");
#endif
        var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

        TenjinHelpers.Initialize();
        GameAnalyticsHelpers.Initialize();
        // FunGamesApiAnalytics.Initialize();

        /*if (settings.useMax)
        {
            FunGamesMax.InitializeAds();
        }*/
        if (settings.useOgury)
        {
            Debug.Log("Initialize Ogury");
            // new GameObject("OguryCallbacks", typeof(OguryCallbacks));

            // Ogury.Start(settings.oguryAndroidAssetKey, settings.oguryIOSAssetKey);

            FunGamesThumbail.Start();
        }
        // FunGamesFB.Start();
    }
}
