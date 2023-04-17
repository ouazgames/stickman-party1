using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BannerAdapter : MonoBehaviour
{

    [SerializeField] RectTransform targetAddapting;

    AdsManager _adsManager;

    Vector2 orgSize;
    private void Start()
    {
        orgSize = targetAddapting.sizeDelta;
        if (_adsManager == null)
        {
            _adsManager = AdsManager.Instance;
        }
        if (_adsManager == null)
        {
            return;
        }
        UpdateLayout();
        

    }


    float timeProc;

    private void Update()
    {
        if (_adsManager == null)
        {
            _adsManager = AdsManager.Instance;
        }
        if (_adsManager == null)
        {
            return;
        }
        timeProc += Time.deltaTime;
        if (timeProc >= 0.5f)
        {
            timeProc = 0;
            UpdateLayout();
        }




    }

    void UpdateLayout()
    {


        // float bannerHeight = _adsManager.CalcBannerHeight((int)targetAddapting.rect.height);
        // var size = orgSize;
        // size.y -= bannerHeight;
        // targetAddapting.sizeDelta = size;
        _adsManager.setPanelBanner(orgSize, targetAddapting);




    }
}
