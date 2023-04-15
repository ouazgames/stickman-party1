using UnityEngine;
using EasyMobile;
public class ShowAds : MonoBehaviour
{
	private static int advCount;

	public void ShowInter()
	{
		advCount++;
		if (advCount % 2 == 0)
		{
bool isReady = AdManager.IsInterstitialAdReady();
// Show it if it's ready
if (isReady)
{
AdManager.ShowInterstitialAd();
}
		}
	}
}
