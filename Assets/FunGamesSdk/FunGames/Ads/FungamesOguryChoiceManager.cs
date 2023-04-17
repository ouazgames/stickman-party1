using FunGamesSdk;
// using OgurySdk;
using UnityEngine;

public class FungamesOguryChoiceManager
{
    // Start is called on the start of FunGamesAds
    internal static void Start()
    {
        var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

        if (settings.useOgury)
        {

            // OguryChoiceManager.OnAskComplete += OnCMComplete;
            // OguryChoiceManager.OnAskError += OnCMError;
            // Debug.Log("Ogury Ask");
            // OguryChoiceManager.Ask();
        }
    }

    // private static void OnCMComplete(OguryChoiceManager.Answer answer)
    // {
    //     // will serve personalized ads when the user consents
    //     if (OguryChoiceManager.Answer.FullApproval == answer)
    //     {
    //         MaxSdk.SetHasUserConsent(true);
    //         MaxSdk.SetIsAgeRestrictedUser(false);
    //         PlayerPrefs.SetInt("GDPRAnswered", 1);
    //     }
    //     else if (OguryChoiceManager.Answer.NoAnswer != answer)
    //     {
    //         MaxSdk.SetHasUserConsent(false);
    //         MaxSdk.SetIsAgeRestrictedUser(false);
    //         PlayerPrefs.SetInt("GDPRAnswered", 0);
    //     }
    //     else
    //     {
    //         MaxSdk.SetIsAgeRestrictedUser(true);
    //     }
    //     StartSdks();
    // }

    // private static void OnCMError(OguryError error)
    // {
    //     // will serve personalized ads when the user consents
    //     StartSdks();
    // }

    // private static void StartSdks()
    // {
    //     // initialize Ogury Ads
    //     Ogury.StartAds();

    //     var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");
    //     if (settings.useMax)
    //     {
    //         FunGamesMax.Start();
    //     }
    // }
}
