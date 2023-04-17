using System.Collections;
using System.Collections.Generic;
using FunGames.Sdk.Analytics;
using FunGamesSdk.FunGames.Notifs;
#if UNITY_ANDROID
using Unity.Notifications.Android;
#elif UNITY_IOS
using Unity.Notifications.iOS;
#endif
using UnityEngine;

public class ExempleNotifs : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        // If you didn't activate Reschedule Notifications on Device Restart option
        // AskAuthorization();
    }

    public void AskAuthorization()
    {
#if UNITY_IOS
        FunGamesNotifs._instance.AskRequest();
# elif UNITY_ANDROID
        FunGamesNotifs.SetChannel("channel_id", "Default Channel", "Generic notifications");
#else
        Debug.LogWarning("You are not on an iOS mobile device, it's going to do nothing");
#endif
    }

    /**
     * This is an example of a function to request a notification after 10 seconds
     */
    public void CreateTimeNotifs()
    {
#if UNITY_ANDROID
        FunGamesNotifs.CreateTimeIntervalNotifs("Title of the notifs", "Body of the the notifs", "channel_id", 0, 0, 10);
#elif UNITY_IOS
        FunGamesNotifs._instance.RemoveNotif("NotifsTest1");
        FunGamesNotifs._instance.CreateTimeIntervalNotifs(0, 0, 10, "NotifsTest1", "Title of the notifs", "Body of the the notifs", "This a test");
#else
Debug.LogWarning("You are not on an mobile device, it's going to do nothing");
#endif

    }

    public void GetNotifcation()
    {
#if UNITY_IOS
        iOSNotification notification = FunGamesNotifs._instance.GetNotifUserOpenAppWith();
        if (notification != null)
        {
            var msg = "Last Received Notification: " + notification.Identifier;
            msg += "\n - Notification received: ";
            msg += "\n - .Title: " + notification.Title;
            msg += "\n - .Badge: " + notification.Badge;
            msg += "\n - .Body: " + notification.Body;
            msg += "\n - .CategoryIdentifier: " + notification.CategoryIdentifier;
            msg += "\n - .Subtitle: " + notification.Subtitle;
            msg += "\n - .Data: " + notification.Data;
            Debug.Log(msg);
            FunGamesAnalytics.NewDesignEvent("NotificationOpenAppWith", notification.Identifier);
        }
# elif UNITY_ANDROID
        AndroidNotificationIntentData notification = FunGamesNotifs._instance.GetNotifUserOpenAppWith();
        if (notification != null)
        {
            var msg = "Last Received Notification: " + notification.Id;
            msg += "\n - Notification received: ";
            msg += "\n - .Channel ID: " + notification.Channel;
            msg += "\n - .Title: " + notification.Notification.Title;
            msg += "\n - .Text: " + notification.Notification.Text;
            Debug.Log(msg);
            FunGamesAnalytics.NewDesignEvent("NotificationOpenAppWith", notification.Id.ToString());
        }
#else
        Debug.LogWarning("You are not on a mobile device, it's going to do nothing");
#endif
    }
}
