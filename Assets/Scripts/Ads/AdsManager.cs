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
public partial class SROptions
{

    [System.ComponentModel.Category("Admob")]
    public void ShowAdmobAdInspector()
    {

        MobileAds.OpenAdInspector((AdError) =>
        {

        });

    }
    [System.ComponentModel.Category("Applovin")]
    public void ShowApplovinDebugger()
    {

        MaxSdk.ShowMediationDebugger();
    }
}
public class AdsManager : MonoBehaviour
{

    // public string YOUR_APP_KEY = "";
    public static event System.Action onAdmobInitialized;

    public static int timingBonus = 5;
    public static int timingBonusShowTime = 5;
    public static int dailyBonus = 1;

    public static int timingInterval = 180;

    public static bool actionTimersEnabled = false;
    public static bool isAdmobInitialized = FunGamesMax.isAdmobInitialized;


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
            FunGamesMax.bannerPosition = MaxSdkBase.BannerPosition.TopCenter;
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
        // IronSourceEvents.onSdkInitializationCompletedEvent += SdkInitializationCompletedEvent;
        // // IronSource.Agent.init(IronSourceAdUnits.BANNER);
        // IronSourceInitilizer.AutoInitialize();
        SdkInitializationCompletedEvent();
        // #if UNITY_EDITOR
        // #endif
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



    // private NativeAd nativeAd;


    // public void RequestNativeAd(System.Action<NativeAd> loadedCallback,System.Action onFaild) {
    //     if(!FunGamesMax._USE_Native_ADMOBOnly){
    //         onFaild?.Invoke();
    //         return;
    //     }
    //     AdLoader adLoader = new AdLoader.Builder(FunGamesMax._nativeAdmobAdUnitId)
    //         .ForNativeAd()
    //         .Build();
    //     var func = new System.EventHandler<NativeAdEventArgs>((sender,args)=>{
    //         Debug.Log("Native ad loaded.");
    //         this.nativeAd = args.nativeAd;
    //         loadedCallback?.Invoke(nativeAd);
    //         FunGamesMax.printApplovinAdInfo<string, string>("Native Ad loaded", args.nativeAd.ToString(),"");

    //     });
    //     var faild = new System.EventHandler<AdFailedToLoadEventArgs >((sender,args)=>{
    //         FunGamesMax.printApplovinAdInfo<ResponseInfo,string>("Native Ad Load Failed Event",args.LoadAdError.GetResponseInfo(),args.LoadAdError.GetMessage());
    //         Debug.Log("Native ad failed to load: " + args.LoadAdError.GetMessage());
    //         onFaild?.Invoke();
    //     });
    //     adLoader.OnNativeAdLoaded += func;
    //     adLoader.OnAdFailedToLoad += faild;
    //     adLoader.LoadAd(new AdRequest.Builder().Build());
    // }


    // private void HandleNativeAdLoaded(object sender, NativeAdEventArgs args) {
    // }






    private void SdkInitializationCompletedEvent()
    {

        RequestConfiguration requestConfiguration =
            new RequestConfiguration.Builder()
            .SetSameAppKeyEnabled(true).build();
        MobileAds.SetRequestConfiguration(requestConfiguration);


        MobileAds.Initialize((i) =>
        {
            if (FunGamesMax._USE_APPOPEN_ADMOBOnly)
            {
                Invoke("initAppOpen", 0.1f);
            }
            FunGamesMax.isAdmobInitialized = true;
            if (FunGamesMax._USE_BANNER_ADMOBOnly)
            {
                FunGamesMax.InitializeBannerAds();
            }
            else
            {
                Invoke("ShowBanner", 0.2f);
            }
            onAdmobInitialized?.Invoke();
        });
    }
    void initAppOpen()
    {
        AppOpenAdManager.Instance.LoadAd();
        AppStateEventNotifier.AppStateChanged += InonAppStateChanged;


    }

    public static bool isAppOpenInitiaed;
    public void OnAppStateChanged()
    {

        if (!FunGamesMax._USE_APPOPEN_ADMOBOnly)
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













    public void ShowBanner()
    {
        // if (bannerView != null) bannerView.Show();
        // else RequestBanner();
        // Advertisements.Instance.ShowBanner(BannerPosition.TOP);

        bannerShow = true;

        FunGamesMax.BannerIsLoaded("");
        FunGamesMax.ShowBannerAd();



    }
    bool bannerShow;
    public void HideBanner()
    {
        bannerShow = false;
        // if (bannerView != null) bannerView.Show();
        // else RequestBanner();
        // Advertisements.Instance.HideBanner();

        FunGamesMax.HideBannerAd();

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

        if (FunGamesMax.IsBannerLoaded)
            bannerHeight = 200;
        else
            bannerHeight = 0;

        if (FunGamesMax._USE_BANNER_ADMOBOnly)
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

        print("HAS INTERSTITIAL : " + bol);
        return bol;
    }

    System.Action _onClosed;
    void _showInterstitial(System.Action onClosed)
    {

        FunGamesMax.ShowAd(false, (s) =>
        {

            onClosed?.Invoke();
        });

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
    public const float MaxTime = 30;
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

        print("HAS REWARD : " + bol);
        return bol;
    }
    System.Action<bool> _ClosedAd;
    void _showRewardedVideo(System.Action<bool> ClosedAd)
    {

        FunGamesMax.ShowAd(true, (s) =>
        {
            ClosedAd?.Invoke(s != FunGamesMax.AdState.failed);
        });


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

    }

}
