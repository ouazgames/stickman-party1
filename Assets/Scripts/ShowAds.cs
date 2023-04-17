using UnityEngine;

public class ShowAds : MonoBehaviour
{
	private static int advCount;

	public void ShowInter()
	{
		advCount++;
		if (advCount % 2 == 0)
		{
			bool isReady = false;// AdManager.IsInterstitialAdReady();
// Show it if it's ready
if (isReady)
{
//AdManager.ShowInterstitialAd();
}
		}
	}
}
