using FunGames.Sdk.Ads.Crosspromo;
using UnityEngine;

namespace FunGamesSdk.Examples
{
    public class ExampleCrosspromo : MonoBehaviour {
        private void Start () {
            FunGamesCrosspromo.Init ((b) => {
                if (b)
                {
                    Debug.Log("test");
                    FunGamesCrosspromo.PlayVideo(PlayVideoCallback);
                }
            });
        }

        private static void PlayVideoCallback()
        {
            Debug.Log("Finished Playing Crosspromo Video");
        }
    }
}
