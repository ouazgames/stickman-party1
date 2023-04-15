using System;
using UnityEngine;


public class Purchaser : MonoBehaviour
{

	public AudioClip ButtonSound;

	private AudioSource Source;

	public static string removeads = "com.playmax.playergames.removeads";

	public static string kProductIDSubscription = "subscription";

	private static string kProductNameAppleSubscription = "com.unity3d.subscription.new";

	private static string kProductNameGooglePlaySubscription = "com.unity3d.subscription.original";

	public int AdsID;

	public GameObject[] AdsButton;

	private void Start()
	{
		Source = GetComponent<AudioSource>();
	}

	private void Update()
	{
		AdsID = PlayerPrefs.GetInt("AdsID");
		if (AdsID == 1)
		{
			GameObject[] adsButton = AdsButton;
			for (int i = 0; i < adsButton.Length; i++)
			{
				adsButton[i].SetActive(value: false);
			}
		}
	}

	
	

	public void BuySubscription()
	{
		BuyProductID(kProductIDSubscription);
	}

	private void BuyProductID(string productId)
	{
		
	}

	public void RestorePurchases()
	{
		
	}

	
	

	public void BuyNoAds()
	{
		BuyProductID(removeads);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	//public PurchaseProcessingResult ProcessPurchase(PurchaseEventArgs args)
	//{
	//	if (string.Equals(args.purchasedProduct.definition.id, removeads, StringComparison.Ordinal))
	//	{
	//		UnityEngine.Debug.Log("Buying No Ads");
	//		AdsID = 1;
	//		PlayerPrefs.SetInt("AdsID", AdsID);
	//		AdManager.Instance.DestroyBanner();
	//		PlayerPrefs.Save();
	//		Source.PlayOneShot(ButtonSound);
	//	}
	//	else if (string.Equals(args.purchasedProduct.definition.id, kProductIDSubscription, StringComparison.Ordinal))
	//	{
	//		UnityEngine.Debug.Log($"ProcessPurchase: PASS. Product: '{args.purchasedProduct.definition.id}'");
	//	}
	//	else
	//	{
	//		UnityEngine.Debug.Log($"ProcessPurchase: FAIL. Unrecognized product: '{args.purchasedProduct.definition.id}'");
	//	}
	//	return PurchaseProcessingResult.Complete;
	//}

	//public void OnPurchaseFailed(Product product, PurchaseFailureReason failureReason)
	//{
	//	UnityEngine.Debug.Log($"OnPurchaseFailed: FAIL. Product: '{product.definition.storeSpecificId}', PurchaseFailureReason: {failureReason}");
	//}
}
