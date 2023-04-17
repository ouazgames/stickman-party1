using FunGamesSdk;
// using OgurySdk;
using UnityEngine;

public class FunGamesThumbail
{
    // private static OguryThumbnailAd _thumbnailAd;

    private static bool _isThumbnailLoaded;
    private static bool _showThumbnailAsked;

    // Start is called on the start of FunGamesAds
    internal static void Start()
    {
        var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

        if (settings.useOgury)
        {
            // _thumbnailAd = new OguryThumbnailAd(settings.androidThumbnailAdUnitId, settings.iOSThumbnailAdUnitId);
            // InitializeThumbnailAd();
            // Debug.Log("Ogury CM Start");
            //FungamesOguryChoiceManager.Start();
        }
    }

    // private void OnThumbnailComplete(OguryChoiceManager.Answer answer)
    // {
    //     Debug.Log("OnThumbnailComplete");
    //     _thumbnailAd.Load();
    // }

    // internal static void InitializeThumbnailAd()
    // {
    // 	_thumbnailAd.OnAdLoaded += ThumbnailIsLoaded;
    // 	_thumbnailAd.OnAdClosed += ThumbnailLoad;
    // 	_thumbnailAd.Load();
    // }

    // private static void ThumbnailLoad(OguryThumbnailAd ad)
    // {
    // 	Debug.Log("ThumbnailLoad");

    // 	_showThumbnailAsked = false;
    // 	_thumbnailAd.Load();

    // }

    // private static void ThumbnailIsLoaded(OguryThumbnailAd ad)
    // {
    // 	_isThumbnailLoaded = true;
    // 	Debug.Log("_isThumbnailLoaded is set to " + _isThumbnailLoaded);
    // 	if (_showThumbnailAsked)
    // 	{
    // 		ShowThumbnailAd();
    // 	}
    // }

    // internal static void ShowThumbnailAd()
    // {
    // 	if (_showThumbnailAsked == false)
    // 	{
    // 		_showThumbnailAsked = true;
    // 	}
    // 	//_isThumbnailLoaded = true;
    // 	Debug.Log("Thumbnail satus show : " + _showThumbnailAsked + " _isThumbnailLoaded : " + _isThumbnailLoaded);
    // 	if (_isThumbnailLoaded == false)
    // 	{
    // 		return;
    // 	}
    // 	_thumbnailAd.Show();
    // 	//FunGamesAnalytics.NewAdEvent(GAAdAction.Show, GAAdType.Undefined);
    // }
}
