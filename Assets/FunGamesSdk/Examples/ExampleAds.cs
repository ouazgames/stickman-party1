using FunGames.Sdk.Ads;
using FunGames.Sdk.Analytics;
using FunGamesSdk.FunGames.Ads;
using UnityEngine;

namespace DefaultNamespace
{
    public class ExampleAds
    {
        public void ClaimTheLoot()
        {
            FunGamesMax.ShowRewarded(EarnExtraCoins, "gained", 100);
        }

        private void EarnExtraCoins(string status, string strArgs, int earnedCoins)
        {
            if (status == "success")
            {
                Debug.Log("Earned Extra Coins");
            }
        }

        public void EarnDoubleMoney()
        {
            FunGamesMax.ShowRewarded(GrabDoubleMoney, "moneyDoubled", 2);
        }

        void GrabDoubleMoney(string status, string argString, int doubledMoney)
        {
            if (status == "success")
            {
                Debug.Log("Grabbed double money");
            }

            else
            {
                Debug.Log("No reward granted");
            }
        }


        public void ShowInterstitial()
        {
            FunGamesMax.ShowInterstitial(GoToNextLevel);
        }

        void GoToNextLevel(string status, string argString, int argInt)
        {
            //foo
        }

        public void ShowBanner()
        {
            FunGamesMax.ShowBannerAd();
        }

        public void ShowThumbnailAd()
        {
            // FunGamesThumbail.ShowThumbnailAd();
        }

        public void HideBannerAd()
        {
            FunGamesMax.HideBannerAd();
        }
    }
}