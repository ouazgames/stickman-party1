using UnityEngine;

namespace FunGamesSdk.FunGames.Ads.Crosspromo.Scripts
{
    public class AdLabelController : MonoBehaviour
    {
        private void Awake()
        {
            #if UNITY_IOS
                gameObject.SetActive(false);
            #endif
        }
    }
}
