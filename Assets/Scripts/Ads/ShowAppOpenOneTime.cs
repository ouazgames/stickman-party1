using UnityEngine;

public class ShowAppOpenOneTime : MonoBehaviour
{
    public static bool isShowed;

    private void Start()
    {
    }
    private void Update()
    {
        if (!isShowed && AdsManager.isAppOpenInitiaed)
        {
            isShowed = true;
            AdsManager.Instance.OnAppStateChanged();
        }

    }
}