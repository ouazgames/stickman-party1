using System.Collections;
using UnityEngine;

public class NativeShare : MonoBehaviour
{
	public string subject;

	public string ShareMessage;

	public string url;

	private bool isProcessing;

	public string ScreenshotName = "screenshot.png";

	public void ShareScreenshotWithText()
	{
	}

	public void Share()
	{
		if (!isProcessing)
		{
			StartCoroutine(ShareScreenshot());
		}
	}

	public IEnumerator ShareScreenshot()
	{
		isProcessing = true;
		yield return new WaitForEndOfFrame();
		string screenShotPath = Application.persistentDataPath + "/" + ScreenshotName;
		ScreenCapture.CaptureScreenshot(ScreenshotName);
		yield return new WaitForSeconds(1f);
		if (!Application.isEditor)
		{
			AndroidJavaClass androidJavaClass = new AndroidJavaClass("android.content.Intent");
			AndroidJavaObject androidJavaObject = new AndroidJavaObject("android.content.Intent");
			androidJavaObject.Call<AndroidJavaObject>("setAction", new object[1]
			{
				androidJavaClass.GetStatic<string>("ACTION_SEND")
			});
			AndroidJavaObject androidJavaObject2 = new AndroidJavaClass("android.net.Uri").CallStatic<AndroidJavaObject>("parse", new object[1]
			{
				"file://" + screenShotPath
			});
			androidJavaObject.Call<AndroidJavaObject>("putExtra", new object[2]
			{
				androidJavaClass.GetStatic<string>("EXTRA_STREAM"),
				androidJavaObject2
			});
			androidJavaObject.Call<AndroidJavaObject>("setType", new object[1]
			{
				"image/png"
			});
			androidJavaObject.Call<AndroidJavaObject>("putExtra", new object[2]
			{
				androidJavaClass.GetStatic<string>("EXTRA_TEXT"),
				ShareMessage
			});
			AndroidJavaObject @static = new AndroidJavaClass("com.unity3d.player.UnityPlayer").GetStatic<AndroidJavaObject>("currentActivity");
			AndroidJavaObject androidJavaObject3 = androidJavaClass.CallStatic<AndroidJavaObject>("createChooser", new object[2]
			{
				androidJavaObject,
				"YO! I Love Who Lurks!"
			});
			@static.Call("startActivity", androidJavaObject3);
		}
		isProcessing = false;
	}
}
