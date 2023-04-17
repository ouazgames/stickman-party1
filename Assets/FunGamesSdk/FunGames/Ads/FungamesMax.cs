using System;
using FunGames.Sdk.Analytics;
using FunGamesSdk;
using FunGamesSdk.FunGames.Ads;
using GameAnalyticsSDK;
using GoogleMobileAds.Api;
// using OgurySdk;
using UnityEngine;

public class FunGamesMax
{
    public static event System.Action OnFunGamesInitialized;

    public static bool _USE_APPOPEN_ADMOBOnly;
    public static bool _USE_BANNER_ADMOBOnly;

    private static string _maxSdkKey;
    private static string _interstitialAdUnitId;
    private static string _rewardedAdUnitId;
    private static string _bannerAdUnitId;
    private static string _appopenAdUnitId;
    public static string _appopenAdmobAdUnitId;
    public static string _bannerAdmobAdUnitId;

    private static int _interstitialRetryAttempt;
    private static int _rewardedRetryAttempt;
    private static int _bannerRetryAttempt;

    private static Action<string, string, int> _rewardedCallback;
    private static string _rewardedCallbackArgString;
    private static int _rewardedCallbackArgInt;

    private static Action<string, string, int> _interstitialCallback;
    private static string _interstitialCallbackArgString;
    private static int _interstitialCallbackArgInt;

    private static bool _isBannerLoaded;
    private static bool _showBannerAsked;
    private static bool _isBannerShowing;

    // Awake is called on the awake of FunGamesAds
    internal static void Awake()
    {
        var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");
        _maxSdkKey = settings.maxSdkKey;

        _USE_APPOPEN_ADMOBOnly = settings.Use_Appopen_AdmobOnly;
        _USE_BANNER_ADMOBOnly = settings.Use_Banner_AdmobOnly;

#if UNITY_IOS
		_interstitialAdUnitId = settings.iOSInterstitialAdUnitId;
		_rewardedAdUnitId = settings.iOSRewardedAdUnitId;
		_bannerAdUnitId = settings.iOSBannerAdUnitId;
		_appopenAdUnitId = settings.IOSAppopenAdUnitId;
        _appopenAdmobAdUnitId = settings.IOSAppopenAdmobAdUnitId;
        _bannerAdmobAdUnitId = settings.IOSBannerAdmobAdUnitId;
#endif

#if UNITY_ANDROID
        _interstitialAdUnitId = settings.androidInterstitialAdUnitId;
        _rewardedAdUnitId = settings.androidRewardedAdUnitId;
        _bannerAdUnitId = settings.androidBannerAdUnitId;
        _appopenAdUnitId = settings.androidAppopenAdUnitId;
        _appopenAdmobAdUnitId = settings.androidAppopenAdmobAdUnitId;
        _bannerAdmobAdUnitId = settings.androidBannerAdmobAdUnitId;
#endif
    }

    // Start is called on the start of FunGamesAds
    internal static void Start()
    {
        var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");
        if (settings.useMax)
        {
            MaxSdkCallbacks.OnSdkInitializedEvent += (MaxSdkBase.SdkConfiguration sdkConfiguration) =>
            {
                if (sdkConfiguration.ConsentDialogState == MaxSdkBase.ConsentDialogState.Applies)
                {
                    if (PlayerPrefs.HasKey("GDPRAnswered"))
                    {
                        MaxSdk.SetHasUserConsent(PlayerPrefs.GetInt("GDPRAnswered") == 1);
                        MaxSdk.SetIsAgeRestrictedUser(false);
                    }
                    else
                    {
                        MaxSdk.SetHasUserConsent(false);
                        MaxSdk.SetIsAgeRestrictedUser(true);
                    }
                }
                else
                {
                    // No need to show consent dialog, proceed with initialization
                    MaxSdk.SetHasUserConsent(true);
                    MaxSdk.SetIsAgeRestrictedUser(false);
                }
                InitializeInterstitialAds();
                InitializeRewardedAds();
                InitializeBannerAds();
                InitializeAppOpenAds();
                OnFunGamesInitialized?.Invoke();
            };
            //FunGamesMax.Start();
            if (PlayerPrefs.HasKey("GDPRAnswered"))
            {
                MaxSdk.SetHasUserConsent(PlayerPrefs.GetInt("GDPRAnswered") == 1);
                MaxSdk.SetIsAgeRestrictedUser(false);
            }
            else
            {
                MaxSdk.SetHasUserConsent(false);
                MaxSdk.SetIsAgeRestrictedUser(true);
            }

            MaxSdk.SetSdkKey(_maxSdkKey);

            MaxSdk.InitializeSdk();
            Debug.Log("Initializing FunGamesAds");
        }
        else
        {
            OnFunGamesInitialized?.Invoke();
        }
    }

    public static void InitializeAds()
    {
        InitializeInterstitialAds();
        InitializeRewardedAds();
        InitializeBannerAds();
        InitializeAppOpenAds();
    }

    private static void InitializeInterstitialAds()
    {
        MaxSdkCallbacks.Interstitial.OnAdLoadedEvent += OnInterstitialLoadedEvent;
        MaxSdkCallbacks.Interstitial.OnAdLoadFailedEvent += OnInterstitialFailedEvent;
        MaxSdkCallbacks.Interstitial.OnAdDisplayFailedEvent += InterstitialFailedToDisplayEvent;
        MaxSdkCallbacks.Interstitial.OnAdDisplayedEvent += OnInterstitialDisplayedEvent;
        MaxSdkCallbacks.Interstitial.OnAdHiddenEvent += OnInterstitialDismissedEvent;
        try
        {
            LoadInterstitial();
        }
        catch
        {
            Debug.Log("Failed Load Interstitials : Please Check Ad Unit");
        }
    }

    private static void LoadInterstitial()
    {
        MaxSdk.LoadInterstitial(_interstitialAdUnitId);
    }

    private static void OnInterstitialLoadedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        _interstitialRetryAttempt = 0;
        printApplovinAdInfo("Intertitial OnInterstitialLoadedEvent", adInfo);
    }

    private static void OnInterstitialFailedEvent(string adUnitId, MaxSdkBase.ErrorInfo errorInfo)
    {
        _interstitialRetryAttempt++;
        var retryDelay = Math.Pow(2, _interstitialRetryAttempt);

        FunGamesAds._instance.Invoke(nameof(LoadInterstitial), (float)retryDelay);
        FunGamesAnalytics.NewAdEvent(GAAdAction.FailedShow, GAAdType.Interstitial);
        _interstitialCallback?.Invoke("fail", _interstitialCallbackArgString, _interstitialCallbackArgInt);
        _interstitialCallback = null;
        printApplovinAdInfo("Intertitial OnInterstitialFailedEvent", null, errorInfo);
    }

    private static void OnInterstitialDisplayedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        FunGamesAnalytics.NewAdEvent(GAAdAction.Show, GAAdType.Interstitial);
        _interstitialCallback?.Invoke("success", _interstitialCallbackArgString, _interstitialCallbackArgInt);
        _interstitialCallback = null;
        printApplovinAdInfo("Intertitial OnInterstitialDisplayedEvent", adInfo);
    }

    private static void InterstitialFailedToDisplayEvent(string adUnitId, MaxSdkBase.ErrorInfo errorInfo, MaxSdkBase.AdInfo adInfo)
    {
        LoadInterstitial();
        FunGamesAnalytics.NewAdEvent(GAAdAction.FailedShow, GAAdType.Interstitial);
        _interstitialCallback?.Invoke("fail", _interstitialCallbackArgString, _interstitialCallbackArgInt);
        _interstitialCallback = null;
        printApplovinAdInfo("Intertitial InterstitialFailedToDisplayEvent", adInfo, errorInfo);
    }

    private static void OnInterstitialDismissedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        LoadInterstitial();
        FunGamesAnalytics.NewDesignEvent("Interstitial", "Dismissed");
        printApplovinAdInfo("Intertitial OnInterstitialDismissedEvent", adInfo);
    }

    private static void InitializeRewardedAds()
    {
        MaxSdkCallbacks.Rewarded.OnAdLoadedEvent += OnRewardedAdLoadedEvent;
        MaxSdkCallbacks.Rewarded.OnAdLoadFailedEvent += OnRewardedAdFailedEvent;
        MaxSdkCallbacks.Rewarded.OnAdDisplayFailedEvent += OnRewardedAdFailedToDisplayEvent;
        MaxSdkCallbacks.Rewarded.OnAdDisplayedEvent += OnRewardedAdDisplayedEvent;
        MaxSdkCallbacks.Rewarded.OnAdClickedEvent += OnRewardedAdClickedEvent;
        MaxSdkCallbacks.Rewarded.OnAdHiddenEvent += OnRewardedAdDismissedEvent;
        MaxSdkCallbacks.Rewarded.OnAdReceivedRewardEvent += OnRewardedAdReceivedRewardEvent;

        try
        {
            LoadRewardedAd();
        }
        catch
        {
            Debug.Log("Failed Load Rewarded : Please Check Ad Unit");
        }
    }

    private static void LoadRewardedAd()
    {
        MaxSdk.LoadRewardedAd(_rewardedAdUnitId);
    }

    private static void OnRewardedAdLoadedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        _rewardedRetryAttempt = 0;
        FunGamesAnalytics.NewAdEvent(GAAdAction.Loaded, GAAdType.RewardedVideo);
        printApplovinAdInfo("Reward OnRewardedAdLoadedEvent", adInfo);

    }

    private static void OnRewardedAdFailedEvent(string adUnitId, MaxSdkBase.ErrorInfo errorInfo)
    {
        _rewardedRetryAttempt++;
        var retryDelay = Math.Pow(2, _rewardedRetryAttempt);

        FunGamesAds._instance.Invoke("LoadRewardedAd", (float)retryDelay);
        FunGamesAnalytics.NewAdEvent(GAAdAction.FailedShow, GAAdType.RewardedVideo);
        _rewardedCallback?.Invoke("fail", _rewardedCallbackArgString, _rewardedCallbackArgInt);
        _rewardedCallback = null;
        printApplovinAdInfo("Reward OnRewardedAdFailedEvent", null, errorInfo);
    }

    private static void OnRewardedAdDisplayedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        FunGamesAnalytics.NewAdEvent(GAAdAction.Show, GAAdType.RewardedVideo);
        printApplovinAdInfo("Reward OnRewardedAdDisplayedEvent", adInfo);
    }

    private static void OnRewardedAdFailedToDisplayEvent(string adUnitId, MaxSdkBase.ErrorInfo errorInfo, MaxSdkBase.AdInfo adInfo)
    {
        LoadRewardedAd();
        FunGamesAnalytics.NewAdEvent(GAAdAction.FailedShow, GAAdType.RewardedVideo);
        _rewardedCallback?.Invoke("fail", _rewardedCallbackArgString, _rewardedCallbackArgInt);
        _rewardedCallback = null;
        printApplovinAdInfo("Reward OnRewardedAdFailedToDisplayEvent", adInfo, errorInfo);
    }

    private static void OnRewardedAdClickedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        FunGamesAnalytics.NewAdEvent(GAAdAction.Clicked, GAAdType.RewardedVideo);
        printApplovinAdInfo("Reward OnRewardedAdClickedEvent", adInfo);
    }

    private static void OnRewardedAdDismissedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        LoadRewardedAd();
        // _rewardedCallback?.Invoke("success", _rewardedCallbackArgString, _rewardedCallbackArgInt);
        // _rewardedCallback = null;
        printApplovinAdInfo("Reward OnRewardedAdDismissedEvent", adInfo);
    }

    private static void OnRewardedAdReceivedRewardEvent(string adUnitId, MaxSdkBase.Reward reward, MaxSdkBase.AdInfo adInfo)
    {
        FunGamesAnalytics.NewAdEvent(GAAdAction.RewardReceived, GAAdType.RewardedVideo);
        _rewardedCallback?.Invoke("reward", _rewardedCallbackArgString, _rewardedCallbackArgInt);
        _rewardedCallback = null;
        printApplovinAdInfo("Reward OnRewardedAdReceivedRewardEvent", adInfo);
    }
    public static MaxSdkBase.BannerPosition bannerPosition = MaxSdkBase.BannerPosition.BottomCenter;

    public static bool isAdmobInitialized;
    static BannerView _bannerView;
    public static void InitializeBannerAds()
    {
        if (_USE_BANNER_ADMOBOnly)
        {
            if (isAdmobInitialized)
            {
                if (_bannerView != null)
                {
                    _bannerView.Destroy();
                }
                _bannerView = new BannerView(_bannerAdmobAdUnitId, AdSize.Banner, bannerPosition == MaxSdkBase.BannerPosition.BottomCenter ? AdPosition.Bottom : AdPosition.Top);
                // Raised when an ad is loaded into the banner view.
                _bannerView.OnAdLoaded += (object sender, EventArgs eventArgs) =>
                {
                    // Debug.Log("Banner view loaded an ad with response : "
                    //     + _bannerView.GetResponseInfo());
                    printApplovinAdInfo<ResponseInfo, string>("Banner view loaded", _bannerView.GetResponseInfo(), "");
                };
                _bannerView.OnAdClosed += (object sender, EventArgs eventArgs) =>
                {
                    // Debug.Log("Banner view loaded an ad with response : "
                    //     + _bannerView.GetResponseInfo());
                    printApplovinAdInfo<ResponseInfo, string>("Banner view closed", _bannerView.GetResponseInfo(), "");
                };
                _bannerView.OnAdOpening += (object sender, EventArgs eventArgs) =>
                {
                    // Debug.Log("Banner view loaded an ad with response : "
                    //     + _bannerView.GetResponseInfo());
                    printApplovinAdInfo<ResponseInfo, string>("Banner view Opening", _bannerView.GetResponseInfo(), "");
                };
                // Raised when an ad fails to load into the banner view.
                _bannerView.OnAdFailedToLoad += (object sender, AdFailedToLoadEventArgs error) =>
                {
                    Debug.LogError("Banner view failed to load an ad with error : "
                        + error);
                    printApplovinAdInfo<ResponseInfo, string>("Banner view faild", error.LoadAdError.GetResponseInfo(), error.LoadAdError.ToString());
                };
                // Raised when the ad is estimated to have earned money.
                _bannerView.OnPaidEvent += (object sender, AdValueEventArgs adValue) =>
                {
                    printApplovinAdInfo<string, string>("Banner view paid", adValue.AdValue.ToString(), "");
                    // Debug.Log(String.Format("Banner view paid {0} {1}.",
                    //     adValue.Value,
                    //     adValue.CurrencyCode));
                };

                Debug.Log("Banner admobOnly Created");
                ShowBannerAd();
            }

        }
        else
        {

            MaxSdkCallbacks.OnBannerAdLoadedEvent += BannerIsLoaded;


            MaxSdkCallbacks.Banner.OnAdLoadFailedEvent += OnBannerAdLoadFailedEvent;
            MaxSdkCallbacks.Banner.OnAdClickedEvent += OnBannerAdClickedEvent;
            MaxSdkCallbacks.Banner.OnAdRevenuePaidEvent += OnBannerAdRevenuePaidEvent;
            MaxSdkCallbacks.Banner.OnAdExpandedEvent += OnBannerAdExpandedEvent;
            MaxSdkCallbacks.Banner.OnAdCollapsedEvent += OnBannerAdCollapsedEvent;

            try
            {
                MaxSdk.CreateBanner(_bannerAdUnitId, bannerPosition);
                MaxSdk.SetBannerBackgroundColor(_bannerAdUnitId, Color.clear);
                Debug.Log("Banner Created");
            }
            catch
            {
                Debug.Log("Failed Create Banner : Please Check Ad Unit");
            }
        }
    }
    public static bool IsBannerLoaded;

    private static void InitializeAppOpenAds()
    {

        MaxSdkCallbacks.AppOpen.OnAdHiddenEvent += OnAppOpenDismissedEvent;

        try
        {

            ShowAdIfReady(_appopenAdUnitId);
            Debug.Log("App Open Initiated");
        }
        catch
        {
            Debug.Log("Failed Initiate AppOpen : Please Check Ad Unit");
        }
    }
    public static void OnAppOpenDismissedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        MaxSdk.LoadAppOpenAd(_appopenAdUnitId);
        printApplovinAdInfo("AppOpen OnAppOpenDismissedEvent", adInfo);
    }
    public static void _OnApplicationPause(bool pauseStatus)
    {
        if (!pauseStatus)
        {
            ShowAdIfReady(_appopenAdUnitId);
        }
    }
    public static void showAppOpen()
    {
        ShowAdIfReady(_appopenAdUnitId);
    }
    public static void ShowAdIfReady(string AppOpenAdUnitId)
    {
        if (_USE_APPOPEN_ADMOBOnly)
        {
            return;
        }
        if (MaxSdk.IsAppOpenAdReady(AppOpenAdUnitId))
        {
            Debug.Log("Show App Open");
            MaxSdk.ShowAppOpenAd(AppOpenAdUnitId);
        }
        else
        {
            Debug.Log("Load App Open");
            AdsManager.isAppOpenInitiaed = true;
            MaxSdk.LoadAppOpenAd(AppOpenAdUnitId);
        }
    }

    public static void printApplovinAdInfo(string tag, MaxSdkBase.AdInfo adInfo, MaxSdkBase.ErrorInfo errorInfo = null)
    {
        printApplovinAdInfo<MaxSdkBase.AdInfo, MaxSdkBase.ErrorInfo>(tag, adInfo, errorInfo);
    }
    public static void printApplovinAdInfo<T, T1>(string tag, T adInfo, T1 errorInfo)
    {
        string _tag = "[[" + tag + "]]";
        string _adInfo = "";
        string _ironSourceError = "";
        if (adInfo != null)
        {
            _adInfo = " | " + adInfo.ToString();
        }
        if (errorInfo != null)
        {
            _ironSourceError = " | " + errorInfo.ToString();

        }
        Debug.Log(_tag + _adInfo + _ironSourceError);
    }

    private static void OnBannerAdLoadedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        printApplovinAdInfo("Banner Ad Loaded Event", adInfo);
    }

    private static void OnBannerAdLoadFailedEvent(string adUnitId, MaxSdkBase.ErrorInfo errorInfo)
    {
        printApplovinAdInfo("Banner Ad Load Failed Event", null, errorInfo);
        IsBannerLoaded = false;

    }

    private static void OnBannerAdClickedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        printApplovinAdInfo("Banner Ad Clicked Event", adInfo);

    }

    private static void OnBannerAdRevenuePaidEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        printApplovinAdInfo("Banner Ad Revenue Paid Event", adInfo);

    }

    private static void OnBannerAdExpandedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        printApplovinAdInfo("Banner Ad Expanded Event", adInfo);
        IsBannerLoaded = true;

    }

    private static void OnBannerAdCollapsedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    {
        printApplovinAdInfo("Banner Ad Collapsed Event", adInfo);
        IsBannerLoaded = false;

    }

    internal static void BannerIsLoaded(string adUnitId)
    {
        _isBannerLoaded = true;

        if (_showBannerAsked)
        {
            ShowBannerAd();
        }
    }

    internal static void ShowBannerAd()
    {
        if (_USE_BANNER_ADMOBOnly)
        {
            if (_bannerView == null)
            {
                return;
            }
            var requiest = new AdRequest.Builder();
            _bannerView.LoadAd(requiest.Build());
        }
        else
        {
            if (_isBannerShowing)
            {
                return;
            }

            if (_showBannerAsked == false)
            {
                _showBannerAsked = true;
            }

            if (_isBannerLoaded == false)
            {
                return;
            }

            Debug.Log("Show Banner");

            MaxSdk.ShowBanner(_bannerAdUnitId);
            _isBannerShowing = true;
        }
        FunGamesAnalytics.NewAdEvent(GAAdAction.Show, GAAdType.Banner);
    }

    internal static void HideBannerAd()
    {
        if (_isBannerLoaded == false)
        {
            return;
        }

        MaxSdk.HideBanner(_bannerAdUnitId);
        _isBannerShowing = false;
        _showBannerAsked = false;
    }

    internal static bool IsRewardedAdReady()
    {
        return MaxSdk.IsRewardedAdReady(_rewardedAdUnitId);
    }

    internal static void LoadAds()
    {
        ShowBannerAd();
        LoadRewardedAd();
        LoadInterstitial();
    }

    internal static void ShowRewarded(Action<string, string, int> callback, string callbackArgsString = "", int callbackArgsInt = 0)
    {
        _rewardedCallback = callback;
        _rewardedCallbackArgString = callbackArgsString;
        _rewardedCallbackArgInt = callbackArgsInt;

        if (MaxSdk.IsRewardedAdReady(_rewardedAdUnitId))
        {
            try
            {
                MaxSdk.ShowRewardedAd(_rewardedAdUnitId);
                FunGamesAnalytics.NewDesignEvent("Rewarded" + callbackArgsString, "succeeded");
                callback?.Invoke("succeeded", callbackArgsString, callbackArgsInt);
            }
            catch (Exception e)
            {
                callback?.Invoke("fail", callbackArgsString, callbackArgsInt);
                FunGamesAnalytics.NewDesignEvent("RewardedError" + callbackArgsString, "UserQuitBeforeEndingAd");
                Debug.Log(e);
                throw;
            }
        }
        else
        {
            callback?.Invoke("fail", callbackArgsString, callbackArgsInt);
            FunGamesAnalytics.NewDesignEvent("RewardedNoAd" + callbackArgsString, "NoAdReady");
            _rewardedCallback = null;
        }
    }
    public enum AdState
    {
        succeeded,
        rewarded,
        failed
    }

    internal static void ShowAd(bool isReward, Action<AdState> callback)
    {
        if (isReward)
        {
            ShowRewarded((state, argStr, argInt) =>
            {
                if (state == "reward")
                {
                    callback?.Invoke(AdState.rewarded);
                }
                else if (state == "success")
                {
                    callback?.Invoke(AdState.succeeded);

                }
                else if (state == "fail")
                {
                    callback?.Invoke(AdState.failed);

                }
                // else
                // {
                //     callback?.Invoke(AdState.failed);

                // }
            });
        }
        else
        {

            ShowInterstitial((state, argStr, argInt) =>
            {
                if (state == "success")
                {
                    callback?.Invoke(AdState.succeeded);

                }
                else if (state == "fail")
                {
                    callback?.Invoke(AdState.failed);

                }
                else
                {
                    callback?.Invoke(AdState.failed);

                }
            });
        }
    }
    internal static void ShowInterstitial(Action<string, string, int> callback, string callbackArgsString = "", int callbackArgsInt = 0)
    {
        _interstitialCallback = callback;
        _interstitialCallbackArgString = callbackArgsString;
        _interstitialCallbackArgInt = callbackArgsInt;

        if (MaxSdk.IsInterstitialReady(_interstitialAdUnitId))
        {
            try
            {
                MaxSdk.ShowInterstitial(_interstitialAdUnitId);
            }
            catch (Exception e)
            {
                callback?.Invoke("fail", callbackArgsString, callbackArgsInt);
                FunGamesAnalytics.NewDesignEvent("Error", "UserQuitBeforeEndingAd");
                Debug.Log(e);
                throw;
            }
        }
        else
        {
            callback?.Invoke("fail", callbackArgsString, callbackArgsInt);
            _interstitialCallback = null;
        }
    }

    void InterstitialCallbackFunc(string status, string argString, int argInt)
    {
        FunGamesAnalytics.NewDesignEvent("InterstitialComplete");
    }
}
