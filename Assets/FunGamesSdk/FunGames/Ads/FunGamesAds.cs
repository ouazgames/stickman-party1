using System;
using FunGames.Sdk.Analytics;
using GameAnalyticsSDK;
// using OgurySdk;
using UnityEngine;

namespace FunGamesSdk.FunGames.Ads
{
    public class FunGamesAds : MonoBehaviour
    {
        public static FunGamesAds _instance;


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

        public void Start()
        {

            /*var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

			if (settings.useOgury)
			{
				Debug.Log("Initialize Ogury");
				gameObject.AddComponent<OguryCallbacks>();
			
				Ogury.Start(settings.oguryAndroidAssetKey, settings.oguryIOSAssetKey);

				FunGamesThumbail.Start();
			}
			
			if (settings.useMax)
			{
				Debug.Log("Initialize Max");
				FunGamesMax.Start();
			}*/
        }
    }
}
