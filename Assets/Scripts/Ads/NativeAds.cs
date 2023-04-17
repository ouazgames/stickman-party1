using UnityEngine;
using UnityEngine.UI;

public class NativeAds : MonoBehaviour
{

    [SerializeField] GameObject rootNative;
    [SerializeField] RawImage rawImage;
    [SerializeField] Text label;


    bool adLoaded;



    private void Update()
    {
        if (!adLoaded)
        {
            adLoaded = true;
            rootNative.SetActive(false);
            // AdsManager.Instance.RequestNativeAd((nativeAd)=>{
            //      rootNative.SetActive(true);
            //      // Get Texture2D for icon asset of native ad.
            //      Texture2D iconTexture = nativeAd.GetIconTexture();


            //      rawImage.texture = iconTexture;

            //      // Register GameObject that will display icon asset of native ad.
            //      if (!nativeAd.RegisterIconImageGameObject(rawImage.gameObject))
            //      {
            //           // Handle failure to register ad asset.
            //           Debug.Log("failure to register ad asset.",gameObject);
            //      }

            // },
            // ()=>{
            //      Debug.Log("failure to load native.",gameObject);
            //      // rootNative.SetActive(false);
            // });
        }
    }


}