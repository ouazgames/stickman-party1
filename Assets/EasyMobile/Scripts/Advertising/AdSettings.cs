using UnityEngine;
using System.Collections;

namespace EasyMobile
{
    [System.Serializable]
    public class AdSettings
    {
        public AdColonyConfig AdColonyIds
        {
            get
            {
                if (Application.platform == RuntimePlatform.Android)
                    return _androidAdColonyConfig;
                else if (Application.platform == RuntimePlatform.IPhonePlayer)
                    return _iosAdColonyConfig;
                else
                    return new AdColonyConfig();
            }
        }

        public bool AdColonyShowRewardedAdPrePopup { get { return _adColonyShowRewardedAdPrePopup; } }

        public bool AdColonyShowRewardedAdPostPopup { get { return _adColonyShowRewardedAdPostPopup; } }

        public AdOrientation AdColonyAdOrientation { get { return _adColonyAdOrientation; } }

        public AdMobConfig AdMobIds
        {
            get
            {
                if (Application.platform == RuntimePlatform.Android)
                    return _androidAdMobConfig;
                else if (Application.platform == RuntimePlatform.IPhonePlayer)
                    return _iosAdMobConfig;
                else
                    return new AdMobConfig();
            }
        }

        [System.Obsolete("This property is now obsolete. Use AdMobIds obtain cross-platform AdMob IDs.")]
        public AdMobConfig IosAdMobConfig { get { return _iosAdMobConfig; } }

        [System.Obsolete("This property is now obsolete. Use AdMobIds to obtain cross-platform AdMob IDs.")]
        public AdMobConfig AndroidAdMobConfig { get { return _androidAdMobConfig; } }

        public bool AdMobDesignedForFamilies { get { return _admobDesignedForFamilies; } }

        public AdMobChildDirectedTreatment AdMobChildDirected { get { return _adMobChildDirected; } }

        public bool AdMobEnableTestMode { get { return _admobEnableTestMode; } }

        public string[] AdMobTestDeviceIds { get { return _admobTestDeviceIds; } }

        public string HeyzapPublisherId { get { return _heyzapPublisherId; } }

        public bool HeyzapShowTestSuite { get { return _heyzapShowTestSuite; } }

        public bool IsAutoLoadDefaultAds { get { return _autoLoadDefaultAds; } set { _autoLoadDefaultAds = value; } }

        public float AdCheckingInterval { get { return _adCheckingInterval; } set { _adCheckingInterval = value; } }

        public float AdLoadingInterval { get { return _adLoadingInterval; } set { _adLoadingInterval = value; } }

        public DefaultAdNetworks IosDefaultAdNetworks { get { return _iosDefaultAdNetworks; } }

        public DefaultAdNetworks AndroidDefaultAdNetworks { get { return _androidDefaultAdNetwork; } }

        // AdColony config
        [SerializeField]
        private AdColonyConfig _iosAdColonyConfig;
        [SerializeField]
        private AdColonyConfig _androidAdColonyConfig;
        [SerializeField]
        private AdOrientation _adColonyAdOrientation = AdOrientation.AdOrientationAll;
        [SerializeField]
        private bool _adColonyShowRewardedAdPrePopup;
        [SerializeField]
        private bool _adColonyShowRewardedAdPostPopup;

        // AdMob config
        [SerializeField]
        private AdMobConfig _iosAdMobConfig;
        [SerializeField]
        private AdMobConfig _androidAdMobConfig;
        [SerializeField]
        private bool _admobDesignedForFamilies;
        [SerializeField]
        private AdMobChildDirectedTreatment _adMobChildDirected = AdMobChildDirectedTreatment.Unspecified;
        [SerializeField]
        private bool _admobEnableTestMode;
        [SerializeField]
        private string[] _admobTestDeviceIds;

        // Heyzap config
        [SerializeField]
        private string _heyzapPublisherId;
        [SerializeField]
        private bool _heyzapShowTestSuite;

        // Automatic ad-loading config
        [SerializeField]
        private bool _autoLoadDefaultAds = true;
        [SerializeField]
        private float _adCheckingInterval = 10f;
        [SerializeField]
        private float _adLoadingInterval = 20f;

        // Default ad networks
        [SerializeField]
        private DefaultAdNetworks _iosDefaultAdNetworks = new DefaultAdNetworks(BannerAdNetwork.None, InterstitialAdNetwork.None, RewardedAdNetwork.None);
        [SerializeField]
        private DefaultAdNetworks _androidDefaultAdNetwork = new DefaultAdNetworks(BannerAdNetwork.None, InterstitialAdNetwork.None, RewardedAdNetwork.None);

        [System.Serializable]
        public struct DefaultAdNetworks
        {
            public BannerAdNetwork bannerAdNetwork;
            public InterstitialAdNetwork interstitialAdNetwork;
            public RewardedAdNetwork rewardedAdNetwork;

            public DefaultAdNetworks(BannerAdNetwork banner, InterstitialAdNetwork interstitial, RewardedAdNetwork rewarded)
            {
                bannerAdNetwork = banner;
                interstitialAdNetwork = interstitial;
                rewardedAdNetwork = rewarded;
            }
        }

        [System.Serializable]
        public struct AdColonyConfig
        {
            public string appId;
            public string interstitialAdId;
            public string rewardedAdId;
        }

        [System.Serializable]
        public struct AdMobConfig
        {
            public string bannerAdId;
            public string interstitialAdId;
            public string rewardedAdId;
        }

        public enum AdMobChildDirectedTreatment
        {
            Yes,
            No,
            Unspecified
        }

        public enum AdOrientation
        {
            AdOrientationPortrait,
            AdOrientationLandscape,
            AdOrientationAll
        }
    }

    // List of all supported ad networks
    public enum AdNetwork
    {
        None,
        AdColony,
        AdMob,
        Chartboost,
        Heyzap,
        UnityAds
    }

    public enum AdType
    {
        Banner,
        Interstitial,
        Rewarded
    }

    public enum BannerAdNetwork
    {
        None = AdNetwork.None,
        AdMob = AdNetwork.AdMob,
        Heyzap = AdNetwork.Heyzap
    }

    public enum InterstitialAdNetwork
    {
        None = AdNetwork.None,
        AdColony = AdNetwork.AdColony,
        AdMob = AdNetwork.AdMob,
        Chartboost = AdNetwork.Chartboost,
        Heyzap = AdNetwork.Heyzap,
        UnityAds = AdNetwork.UnityAds
    }

    public enum RewardedAdNetwork
    {
        None = AdNetwork.None,
        AdColony = AdNetwork.AdColony,
        AdMob = AdNetwork.AdMob,
        Chartboost = AdNetwork.Chartboost,
        Heyzap = AdNetwork.Heyzap,
        UnityAds = AdNetwork.UnityAds
    }
}

