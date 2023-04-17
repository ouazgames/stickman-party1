using System.Collections;
using FunGames.Sdk;
using UnityEngine;

namespace FunGamesSdk.FunGames.Gdpr
{
    public class FunGamesGdpr : MonoBehaviour
    {
        public static FunGamesGdpr _instance;

        private void Awake()
        {
            if (_instance == null)
            {

                _instance = this;
                DontDestroyOnLoad(this.gameObject);
            }
            else
            {
                Destroy(this);
            }
        }
        /*private static string AdsPersonalizationConsent = "Ads";

        public static void ShowSimpleGDPR()
        {
            var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

            if (settings.useGdpr == false)
            {
                return;
            }
            
            FunGamesManager._instance.StartCoroutine(ShowGDPRConsentDialogAndWait());
            
            MaxSdkCallbacks.OnSdkInitializedEvent += sdkConfiguration => {
                if (sdkConfiguration.ConsentDialogState == MaxSdkBase.ConsentDialogState.Applies)
                {
                    FunGamesManager._instance.StartCoroutine(ShowGDPRConsentDialogAndWait());
                }
                else if (sdkConfiguration.ConsentDialogState == MaxSdkBase.ConsentDialogState.DoesNotApply)
                {
                    MaxSdk.SetHasUserConsent(false);
                }
                else
                {
                    MaxSdk.SetHasUserConsent(false);
                }
            };
        }

        private static IEnumerator ShowGDPRConsentDialogAndWait()
        {
            var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

            yield return SimpleGDPR.WaitForDialog( new GDPRConsentDialog().
                AddSectionWithToggle( AdsPersonalizationConsent, "Ads Personalization", "When enabled, you'll see ads that are more relevant to you. Otherwise, you will still receive ads, but they will no longer be tailored toward you." ).
                AddPrivacyPolicies("https://policies.google.com/privacy", "https://unity3d.com/legal/privacy-policy", "https://my.policy.url") );

            if( SimpleGDPR.GetConsentState( AdsPersonalizationConsent ) == SimpleGDPR.ConsentState.Yes )
            {
                MaxSdk.SetHasUserConsent(true);
                MaxSdk.SetIsAgeRestrictedUser(false);
                PlayerPrefs.SetInt("GDPRAnswered", 1);
            }
            else
            {
                MaxSdk.SetHasUserConsent(false);
                MaxSdk.SetIsAgeRestrictedUser(false);
                PlayerPrefs.SetInt("GDPRAnswered", 0);
            }
        }*/

        public GameObject GDPRpanel;
        public void ShowGDPR()
        {
            GDPRpanel.SetActive(true);
        }
    }
}