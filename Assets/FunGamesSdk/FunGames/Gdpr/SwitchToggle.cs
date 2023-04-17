using System;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class SwitchToggle : MonoBehaviour
{
    [SerializeField] RectTransform uiHandleRectTransform;
    [SerializeField] Color backgroundActiveColor;
    [SerializeField] Color handleActiveColor;

    Image backgroundImage, handleImage;

    Color backgroundDefaultColor, handleDefaultColor;

    Toggle toggle;

    Vector2 handlePosition;

    bool isRunning = false;

    void Awake()
    {
        toggle = GetComponent<Toggle>();

        handlePosition = uiHandleRectTransform.anchoredPosition;

        backgroundImage = uiHandleRectTransform.parent.GetComponent<Image>();
        handleImage = uiHandleRectTransform.GetComponent<Image>();

        backgroundDefaultColor = backgroundImage.color;
        handleDefaultColor = handleImage.color;

        toggle.onValueChanged.AddListener(OnSwitch);

        if (toggle.isOn)
            OnSwitch(true);
    }

    void OnSwitch(bool on)
    {
        //uiHandleRectTransform.anchoredPosition = on ? handlePosition * -1 : handlePosition; // no anim
        //uiHandleRectTransform.DOAnchorPos(on ? handlePosition * -1 : handlePosition, .4f).SetEase(Ease.InOutBack);

        //backgroundImage.color = on ? backgroundActiveColor : backgroundDefaultColor ; // no anim
        //backgroundImage.DOColor(on ? backgroundActiveColor : backgroundDefaultColor, .6f);
        float startTime = Time.time;
        if(!isRunning)
            StartCoroutine(Anim(startTime, 0.2f, on));
        //handleImage.color = on ? handleActiveColor : handleDefaultColor ; // no anim
        //handleImage.DOColor(on ? handleActiveColor : handleDefaultColor, .4f);

    }

    IEnumerator Anim(float startTime, float length, bool on)
    {
        isRunning = true;
        float dist = uiHandleRectTransform.anchoredPosition.x * -2;
        float startPos = uiHandleRectTransform.anchoredPosition.x;
        float P0 = 0;
        float P1 = (dist / 2);
        float P2 = (dist / 2);
        float P3 = dist;
        float t = 0;
        while (startTime + length > Time.time)
        {
            //uiHandleRectTransform.anchoredPosition = new Vector2(uiHandleRectTransform.anchoredPosition.x + dist*(Time.deltaTime/length), uiHandleRectTransform.anchoredPosition.y);
            t += Time.deltaTime / length;
            uiHandleRectTransform.anchoredPosition = new Vector2(startPos + (float)(P0 * Math.Pow((1 - t), 3) + P1 * 3 * t * Math.Pow((1 - t), 2) + P2 * 3 * Math.Pow(t, 2) * (1 - t) + P3 * Math.Pow(t, 3)), uiHandleRectTransform.anchoredPosition.y);
            yield return null;
        }
        uiHandleRectTransform.anchoredPosition = new Vector2(startPos+dist, uiHandleRectTransform.anchoredPosition.y);
        backgroundImage.color = on ? backgroundActiveColor : backgroundDefaultColor;
        isRunning = false;
    }

    void OnDestroy()
    {
        toggle.onValueChanged.RemoveListener(OnSwitch);
    }
}