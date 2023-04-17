using UnityEngine;
using System;
// using GoogleMobileAds.Api;
// using GoogleMobileAds.Common;
using System.Collections.Generic;
using System;
using UnityEngine.Events;
using System.Collections;
using GoogleMobileAds.Api;
using GoogleMobileAds.Common;
// using GleyMobileAds;

public class AdsManager : MonoBehaviour
{

    // public string YOUR_APP_KEY = "";
    public bool USE_IRONSOURCE => FunGamesMax._USE_IRONSOURCE;
    public static int timingBonus = 5;
    public static int timingBonusShowTime = 5;
    public static int dailyBonus = 1;

    public static int timingInterval = 180;

    public static bool actionTimersEnabled = false;


    // private BannerView bannerView;
    // public InterstitialAd interstitial;
    // public RewardedAd rewardedAd;
    public int bannerUnits = 10;
    // public string[] privacyLinks = new string[] { "https://policies.google.com/privacy", "https://unity3d.com/legal/privacy-policy", "https://my.policy.url" };

    public static Action onRewardedAdClosed, onUserEarnedReward;
    public static AdsManager Instance;

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            FunGamesMax.bannerPosition = MaxSdkBase.BannerPosition.BottomCenter;
            FunGamesMax.OnFunGamesInitialized += Init;
            DontDestroyOnLoad(gameObject);
            return;
        }
        // AdsManager.Instance.ShowBanner();
        Destroy(gameObject);
    }



    private void Start()
    {
        // Debug.Log("Terms of Service has been accepted: " + SimpleGDPR.IsTermsOfServiceAccepted);
        // Debug.Log("Ads personalization consent state: " + SimpleGDPR.GetConsentState(ADS_PERSONALIZATION_CONSENT));
        // Debug.Log("Is user possibly located in the EEA: " + SimpleGDPR.IsGDPRApplicable);
        // if (PlayerPrefs.GetInt("GDPR", 0) > 0)
        // {
        //     IronSource.Agent.setConsent(PlayerPrefs.GetInt("GDPR") == 1);
        //     Init();
        // }
        // else
        // {
        //     StartCoroutine(ShowGDPRConsentDialogAndWait());
        // }


    }

    void Init()
    {
        Debug.Log("AdsManager :: Init");
        IronSourceEvents.onSdkInitializationCompletedEvent += SdkInitializationCompletedEvent;
        // IronSource.Agent.init(IronSourceAdUnits.BANNER);
        IronSourceInitilizer.AutoInitialize();
#if UNITY_EDITOR
        SdkInitializationCompletedEvent();
#endif
        // Advertisements.Instance.Initialize();
    }
    private const string ADS_PERSONALIZATION_CONSENT = "Ads";


    private void UnityAnalyticsButtonClicked()
    {
        // Fetch the URL of the page that allows the user to toggle the Unity Analytics consent
        // "Unity Data Privacy Plug-in" is required: https://assetstore.unity.com/packages/add-ons/services/unity-data-privacy-plug-in-118922
#if !UNITY_5_3_OR_NEWER && !UNITY_5_2 // Initialize must be called on Unity 5.1 or earlier
        //UnityEngine.Analytics.DataPrivacy.Initialize();
#endif
        //UnityEngine.Analytics.DataPrivacy.FetchPrivacyUrl( 
        //	( url ) => SimpleGDPR.OpenURL( url ), // On WebGL, this opens the URL in a new tab
        //	( error ) => Debug.LogError( "Couldn't fetch url: " + error ) );
    }

    private void SdkInitializationCompletedEvent()
    {
        if (USE_IRONSOURCE)
        {
            Debug.Log("AdsManager :: IRONSOURCE Init");
            _loadInterstitial();
        }
        if (FunGamesMax._USE_APPOPEN_ADMOBOnly)
        {
            Invoke("initAppOpen", 0.1f);
        }
        Invoke("ShowBanner", 0.2f);
    }
    void initAppOpen()
    {
        RequestConfiguration requestConfiguration =
            new RequestConfiguration.Builder()
            .SetSameAppKeyEnabled(true).build();
        MobileAds.SetRequestConfiguration(requestConfiguration);


        MobileAds.Initialize((i) =>
        {
            AppOpenAdManager.Instance.LoadAd();
            AppStateEventNotifier.AppStateChanged += InonAppStateChanged;
            isAppOpenInitiaed = true;
        });

    }

    public static bool isAppOpenInitiaed;
    public void OnAppStateChanged()
    {

        if (!FunGamesMax._USE_IRONSOURCE)
        {
            FunGamesMax.showAppOpen();
        }
        else
        {
            InonAppStateChanged();
        }
        // COMPLETE: Show an app open ad if available.

    }
    void InonAppStateChanged(AppState state = AppState.Foreground)
    {
        if (state == AppState.Foreground)
        {
            // COMPLETE: Show an app open ad if available.
            AppOpenAdManager.Instance.ShowAdIfAvailable();
        }
    }

    private void OnEnable()
    {
        IronSourceEvents.onInterstitialAdReadyEvent += InterstitialAdReadyEvent;
        IronSourceEvents.onInterstitialAdLoadFailedEvent += InterstitialAdLoadFailedEvent;
        IronSourceEvents.onInterstitialAdShowSucceededEvent += InterstitialAdShowSucceededEvent;
        IronSourceEvents.onInterstitialAdShowFailedEvent += InterstitialAdShowFailedEvent;
        IronSourceEvents.onInterstitialAdClickedEvent += InterstitialAdClickedEvent;
        IronSourceEvents.onInterstitialAdOpenedEvent += InterstitialAdOpenedEvent;
        IronSourceEvents.onInterstitialAdClosedEvent += InterstitialAdClosedEvent;

        IronSourceEvents.onRewardedVideoAdOpenedEvent += RewardedVideoAdOpenedEvent;
        IronSourceEvents.onRewardedVideoAdClickedEvent += RewardedVideoAdClickedEvent;
        IronSourceEvents.onRewardedVideoAdClosedEvent += RewardedVideoAdClosedEvent;
        IronSourceEvents.onRewardedVideoAvailabilityChangedEvent += RewardedVideoAvailabilityChangedEvent;
        IronSourceEvents.onRewardedVideoAdStartedEvent += RewardedVideoAdStartedEvent;
        IronSourceEvents.onRewardedVideoAdEndedEvent += RewardedVideoAdEndedEvent;
        IronSourceEvents.onRewardedVideoAdRewardedEvent += RewardedVideoAdRewardedEvent;
        IronSourceEvents.onRewardedVideoAdShowFailedEvent += RewardedVideoAdShowFailedEvent;
    }


    // Invoked when the initialization process has failed.
    // @param description - string - contains information about the failure.
    void InterstitialAdLoadFailedEvent(IronSourceError error)
    {
    }
    // Invoked when the ad fails to show.
    // @param description - string - contains information about the failure.
    void InterstitialAdShowFailedEvent(IronSourceError error)
    {

        _onClosed?.Invoke();
        _onClosed = null;

    }
    // Invoked when end user clicked on the interstitial ad
    void InterstitialAdClickedEvent()
    {
    }
    // Invoked when the interstitial ad closed and the user goes back to the application screen.
    void InterstitialAdClosedEvent()
    {

        _onClosed?.Invoke();
        _onClosed = null;
        _loadInterstitial();
    }
    // Invoked when the Interstitial is Ready to shown after load function is called
    void InterstitialAdReadyEvent()
    {
    }
    // Invoked when the Interstitial Ad Unit has opened
    void InterstitialAdOpenedEvent()
    {
    }
    // Invoked right before the Interstitial screen is about to open.
    // NOTE - This event is available only for some of the networks. 
    // You should not treat this event as an interstitial impression, but rather use InterstitialAdOpenedEvent
    void InterstitialAdShowSucceededEvent()
    {
    }

    /////////////////////////REWARD///////////////////////////////

    bool isRewarded;

    //Invoked when the RewardedVideo ad view has opened.
    //Your Activity will lose focus. Please avoid performing heavy 
    //tasks till the video ad will be closed.
    void RewardedVideoAdOpenedEvent()
    {
        isRewarded = false;
    }
    //Invoked when the RewardedVideo ad view is about to be closed.
    //Your activity will now regain its focus.
    void RewardedVideoAdClosedEvent()
    {
        _ClosedAd?.Invoke(isRewarded);
        _ClosedAd = null;
    }
    //Invoked when there is a change in the ad availability status.
    //@param - available - value will change to true when rewarded videos are available. 
    //You can then show the video by calling showRewardedVideo().
    //Value will change to false when no videos are available.
    void RewardedVideoAvailabilityChangedEvent(bool available)
    {
        //Change the in-app 'Traffic Driver' state according to availability.
        bool rewardedVideoAvailability = available;
    }

    //Invoked when the user completed the video and should be rewarded. 
    //If using server-to-server callbacks you may ignore this events and wait for 
    // the callback from the  ironSource server.
    //@param - placement - placement object which contains the reward data
    void RewardedVideoAdRewardedEvent(IronSourcePlacement placement)
    {
        isRewarded = true;
    }
    //Invoked when the Rewarded Video failed to show
    //@param description - string - contains information about the failure.
    void RewardedVideoAdShowFailedEvent(IronSourceError error)
    {
        _ClosedAd?.Invoke(false);
        Debug.Log("IRONSAURCE :: " + error.getCode() + "//" + error.getDescription() + "//" + error.getErrorCode());
        _ClosedAd = null;
    }

    // ----------------------------------------------------------------------------------------
    // Note: the events below are not available for all supported rewarded video ad networks. 
    // Check which events are available per ad network you choose to include in your build. 
    // We recommend only using events which register to ALL ad networks you include in your build. 
    // ----------------------------------------------------------------------------------------

    //Invoked when the video ad starts playing. 
    void RewardedVideoAdStartedEvent()
    {
    }
    //Invoked when the video ad finishes playing. 
    void RewardedVideoAdEndedEvent()
    {
    }
    //Invoked when the video ad is clicked. 
    void RewardedVideoAdClickedEvent(IronSourcePlacement placement)
    {
    }






    public void ShowBanner()
    {
        // if (bannerView != null) bannerView.Show();
        // else RequestBanner();
        // Advertisements.Instance.ShowBanner(BannerPosition.TOP);

        bannerShow = true;
        if (USE_IRONSOURCE)
        {
            IronSource.Agent.loadBanner(IronSourceBannerSize.BANNER, IronSourceBannerPosition.TOP);

        }
        else
        {
            FunGamesMax.BannerIsLoaded("");
            FunGamesMax.ShowBannerAd();
        }


    }
    bool bannerShow;
    public void HideBanner()
    {
        bannerShow = false;
        // if (bannerView != null) bannerView.Show();
        // else RequestBanner();
        // Advertisements.Instance.HideBanner();
        if (USE_IRONSOURCE)
        {
            IronSource.Agent.destroyBanner();
        }
        else
        {
            FunGamesMax.HideBannerAd();
        }
    }

    public bool HasBannerPlacement()
    {
        var bol =/*  Advertisements.Instance.IsBannerOnScreen() || */ bannerShow;
        print("HASBANNERPlacement : " + bol);
        return bol;
    }
    public int CalcBannerHeight(int height)
    {
        // print("HEIGHT SET : " + height);
        // float h = bannerUnits;
        // var ba = Advertisements.Instance.GetBannerAdvertisers();
        // float b = 0;
        // if (ba.Count > 0)
        // {
        //     // Debug.Log(ba[0].advertiserScript.GetTransfrom(), ba[0].advertiserScript.GetTransfrom());
        //     b = ba[0].advertiserScript.GetPixelHeight();
        //     for (int i = 0; i < ba.Count; i++)
        //     {
        //         if (b < ba[0].advertiserScript.GetPixelHeight())
        //         {
        //             b = ba[0].advertiserScript.GetPixelHeight();
        //         }
        //     }
        //     if (b == 0)
        //     {
        //         b = height / bannerUnits;
        //     }
        //     if (b == 0)
        //     {
        //         b = 200;
        //     }
        //     h = 10 + b * 1.5f;
        //     print(b);
        // }
        // else
        // {
        //     b = height / bannerUnits;
        //     if (b == 0)
        //     {
        //         b = 200;
        //     }
        //     h = b;
        // }
        // var bi = GameObject.FindWithTag("BANNER");
        // if (bi != null)
        // {
        //     if (h < bi.transform.GetChild(0).GetComponent<RectTransform>().rect.height)
        //     {
        //         h = bi.transform.GetChild(0).GetComponent<RectTransform>().rect.height + 10;
        //     }

        // }
        return 0;
    }
    public void setPanelBanner(Vector2 orgSize, RectTransform rectTransform)
    {

        var pivotOrg = rectTransform.pivot;
        var bannerHeight = MaxSdkUtils.GetAdaptiveBannerHeight();
        if (USE_IRONSOURCE)
        {
            bannerHeight = 100;
        }
        else
        {
            bannerHeight = 200;
        }
        if (Application.isEditor)
        {
            var banner = GameObject.FindGameObjectWithTag("banner");
            if (banner != null)
            {
                bannerHeight = banner.GetComponent<RectTransform>().sizeDelta.y;
            }
        }
        rectTransform.sizeDelta = orgSize;
        if (FunGamesMax.bannerPosition == MaxSdkBase.BannerPosition.TopCenter)
        {
            rectTransform.pivot = new Vector2(0, pivotOrg.y);
        }
        else
        {
            rectTransform.pivot = new Vector2(1, pivotOrg.y);
        }
        var s = rectTransform.sizeDelta;
        s.y -= bannerHeight;
        rectTransform.sizeDelta = s;
        rectTransform.pivot = pivotOrg;
    }

    // public BannerPosition GetBannerPosition()
    // {
    //     return BannerPosition.BOTTOM;
    // }
    public IronSourceBannerPosition GetBannerPosition()
    {
        return FunGamesMax.bannerPosition == MaxSdkBase.BannerPosition.BottomCenter ? IronSourceBannerPosition.BOTTOM : IronSourceBannerPosition.TOP;
    }

    public void DestroyBanner()
    {
        // Advertisements.Instance.HideBanner();
        // if (bannerView != null)
        // {
        //     bannerView.Destroy();
        //     bannerView = null;
        // }
        HideBanner();
    }

    public bool HasInterstitial()
    {
        var bol = true;
        if (USE_IRONSOURCE)
            bol = IronSource.Agent.isInterstitialReady();
        print("HAS INTERSTITIAL : " + bol);
        return bol;
    }
    void _loadInterstitial()
    {
        IronSource.Agent.loadInterstitial();
    }
    System.Action _onClosed;
    void _showInterstitial(System.Action onClosed)
    {
        if (USE_IRONSOURCE)
        {
            _onClosed = onClosed;
            IronSource.Agent.showInterstitial();
        }
        else
        {
            FunGamesMax.ShowAd(false, (s) =>
            {

                onClosed?.Invoke();
            });
        }
    }

    public bool ShowInterstitial()
    {
        if (Time.time < timer)
        {
            print(Time.time + "// " + timer);
            return false;
        }
        if (HasInterstitial())
        {
            _showInterstitial(() =>
            {
                timer = Time.time + MaxTime;
            });
        }
        /* if (Advertisements.Instance.IsInterstitialAvailable())
        {
            Advertisements.Instance.ShowInterstitial(() =>
            {
                //CUtils.SetActionTime("show_ads");
                timer = Time.time + MaxTime;
            });
            return true;
        } */
        return false;
    }
    public const float MaxTime = 50;
    public static float timer = MaxTime;
    public void ShowInterstitialTimer(Action action)
    {
        if (Time.time < timer)
        {
            print(Time.time + "// " + timer);
            action?.Invoke();
            return;
        }

        /* if (Advertisements.Instance.IsInterstitialAvailable())
        {
            Advertisements.Instance.ShowInterstitial(() =>
            {
                //CUtils.SetActionTime("show_ads");
                action?.Invoke();
                timer = Time.time + MaxTime;
            });
        } */
        if (HasInterstitial())
        {
            _showInterstitial(action);
            timer = Time.time + MaxTime;

        }
        else
        {
            action?.Invoke();

        }
    }

    public bool HasRewardedVideo()
    {
        var bol = FunGamesMax.IsRewardedAdReady();
        if (USE_IRONSOURCE)
            bol = IronSource.Agent.isRewardedVideoAvailable();
        print("HAS REWARD : " + bol);
        return bol;
    }
    System.Action<bool> _ClosedAd;
    void _showRewardedVideo(System.Action<bool> ClosedAd)
    {
        if (USE_IRONSOURCE)
        {
            _ClosedAd = ClosedAd;
            IronSource.Agent.showRewardedVideo();
        }
        else
        {
            FunGamesMax.ShowAd(true, (s) =>
            {
                ClosedAd?.Invoke(s != FunGamesMax.AdState.failed);
            });
        }

    }

    public bool ShowRewardedAd()
    {
        /* if (Advertisements.Instance.IsRewardVideoAvailable())
        {
            Advertisements.Instance.ShowRewardedVideo((b) =>
            {
                if (b)
                {
                    onUserEarnedReward?.Invoke();
                    print("HandleRewardedAdRewarded event received for ");
                }
                onRewardedAdClosed?.Invoke();

            });
            return true;
        }
        else */
        if (HasRewardedVideo())
        {
            _showRewardedVideo((b) =>
            {
                if (b)
                {
                    onUserEarnedReward?.Invoke();
                    print("HandleRewardedAdRewarded event received for ");
                }
                onRewardedAdClosed?.Invoke();

            });
            return true;
        }
        else
        {
            print("Rewarded ad is not ready yet");
            return false;
        }
    }
    public void ShowIntersitial(UnityAction CompleteMethod)
    {
        if (HasInterstitial())
        {
            _showInterstitial(() => { CompleteMethod?.Invoke(); });
        }
        else
        {
            CompleteMethod?.Invoke();
        }
    }
    public void ShowReward(UnityAction<bool> CompleteMethod)
    {
        if (HasRewardedVideo())
        {
            _showRewardedVideo((b) => { CompleteMethod?.Invoke(b); });
        }
        else
        {
            CompleteMethod?.Invoke(false);
        }
    }

    void OnApplicationPause(bool isPaused)
    {
        if (USE_IRONSOURCE)
        {
            IronSource.Agent.onApplicationPause(isPaused);
        }
    }



    // #region Banner callback handlers

    // public void HandleAdLoaded(object sender, EventArgs args)
    // {
    //     print("HandleAdLoaded event received.");
    // }

    // public void HandleAdFailedToLoad(object sender, AdFailedToLoadEventArgs args)
    // {
    //     print("HandleFailedToReceiveAd event received with message: " + args.Message);
    // }

    // public void HandleAdOpened(object sender, EventArgs args)
    // {
    //     print("HandleAdOpened event received");
    // }

    // public void HandleAdClosed(object sender, EventArgs args)
    // {
    //     print("HandleAdClosed event received");
    // }

    // public void HandleAdLeftApplication(object sender, EventArgs args)
    // {
    //     print("HandleAdLeftApplication event received");
    // }

    // #endregion

    // #region Interstitial callback handlers

    // public void HandleInterstitialLoaded(object sender, EventArgs args)
    // {
    //     print("HandleInterstitialLoaded event received.");
    // }

    // public void HandleInterstitialFailedToLoad(object sender, AdFailedToLoadEventArgs args)
    // {
    //     print("HandleInterstitialFailedToLoad event received with message: " + args.Message);
    // }

    // public void HandleInterstitialOpened(object sender, EventArgs args)
    // {
    //     print("HandleInterstitialOpened event received");
    // }

    // public void HandleInterstitialClosed(object sender, EventArgs args)
    // {
    //     print("HandleInterstitialClosed event received");
    //     RequestInterstitial();
    //     CUtils.SetActionTime("show_ads");
    // }

    // public void HandleInterstitialLeftApplication(object sender, EventArgs args)
    // {
    //     print("HandleInterstitialLeftApplication event received");
    // }

    // #endregion

    // #region RewardedAd callback handlers

    // public void HandleRewardedAdLoaded(object sender, EventArgs args)
    // {
    //     print("HandleRewardedAdLoaded event received");
    // }

    // public void HandleRewardedAdFailedToLoad(object sender, AdErrorEventArgs args)
    // {
    //     print("HandleRewardedAdFailedToLoad event received with message: " + args.Message);
    // }

    // public void HandleRewardedAdOpening(object sender, EventArgs args)
    // {
    //     print("HandleRewardedAdOpening event received");
    // }

    // public void HandleRewardedAdFailedToShow(object sender, AdErrorEventArgs args)
    // {
    //     print("HandleRewardedAdFailedToShow event received with message: " + args.Message);
    // }

    // public void HandleRewardedAdClosed(object sender, EventArgs args)
    // {
    //     print("HandleRewardedAdClosed event received");

    //     onRewardedAdClosed?.Invoke();
    //     RequestAndLoadRewardedAd();
    //     CUtils.SetActionTime("show_ads");
    // }

    // public void HandleUserEarnedReward(object sender, Reward args)
    // {
    //     string type = args.Type;
    //     double amount = args.Amount;
    //     print("HandleRewardedAdRewarded event received for " + amount.ToString() + " " + type);

    //     onUserEarnedReward?.Invoke();
    // }

    // #endregion
}
