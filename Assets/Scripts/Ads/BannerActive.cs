using UnityEngine;

public class BannerActive : MonoBehaviour {
    public bool showBanner;


    private void Start() {
        show(showBanner);
    }

    public void show(bool ac){
        if(ac){
            AdsManager.Instance.ShowBanner();
        }else{
            AdsManager.Instance.HideBanner();

        }
    }
}