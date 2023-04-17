using UnityEngine;
using System.Collections;

namespace FunGames.Sdk.Ads.Crosspromo
{
	
	public class AppstoreCrossPromo : MonoBehaviour 
	{
		public string m_appID_IOS = "840066184";
		public string m_appID_Android = "com.orangenose.noone";

		public void OnButtonClick (string buttonName)
		{	
			Debug.Log("Button Clicked");
			if(buttonName == "ViewApp")
			{	
				if(!Application.isEditor)
				{
					#if UNITY_IPHONE
					AppstoreHandler.Instance.openAppInStore(m_appID_IOS);
					#endif

					#if UNITY_ANDROID
					AppstoreHandler.Instance.openAppInStore(m_appID_Android);
					#endif
				}
				else Debug.Log("AppstoreTestScene:: Cannot view app in Editor.");
			}
		}
	}

}