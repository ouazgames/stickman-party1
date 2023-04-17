/*using FunGames.Sdk.Notifs.Helpers;using UnityEngine;namespace FunGamesSdk.FunGames.Notifs{    public class FunGamesNotifs : MonoBehaviour    {        private static FunGamesNotifs _funGamesNotifs;        private void Awake()        {            var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");            if (settings.usePushNotifications == false)            {                return;            }                        DontDestroyOnLoad(this);                        if (_funGamesNotifs == null)            {                _funGamesNotifs = this;                FirebaseHelpers.Initialize();            }            else            {                Destroy(gameObject);            }        }    }}*/using System;using System.Collections;#if UNITY_ANDROIDusing Unity.Notifications.Android;#elif UNITY_IOSusing Unity.Notifications.iOS;#endifusing UnityEngine;namespace FunGamesSdk.FunGames.Notifs{    public class FunGamesNotifs : MonoBehaviour    {        public static FunGamesNotifs _instance;        private void Awake()        {            if (_instance == null)            {                _instance = this;                DontDestroyOnLoad(this.gameObject);            }            else            {                Destroy(this);            }        }        private void Start()        {
            //_instance.StartCoroutine(_RequestAuthorization());
            var settings = Resources.Load<FunGamesSettings>("FunGamesSettings");

            if (settings.usePushNotifications)
            {
                Debug.Log("Initialize Notification");
#if UNITY_IOS
                FunGamesNotifs._instance.AskRequest();
#elif UNITY_ANDROID
            FunGamesNotifs.SetChannel("channel_id", "Default Channel", "Generic notifications");
#else
            Debug.LogWarning("You are not on a mobile device, it's going to do nothing");
#endif            }        }




#if UNITY_ANDROID
        /// <summary>
        /// all notifications must be assigned to a notification channel
        /// </summary>
        /// <param name="a_ChannelId">Set Id of the channel you want to create</param>
        /// <param name="a_Name">Set the name of the channel you want to create</param>
        /// <param name="a_Description">Set the descrition of the channel you want to create</param>
        /// <param name="a_Importance">Set importance of the channel you want to create default value <value>Importance.Default</param></param>        public static void SetChannel(string a_ChannelId, string a_Name, string a_Description, Importance a_Importance = Importance.Default)        {            var channel = new AndroidNotificationChannel()            {                Id = a_ChannelId,                Name = a_Name,                Importance = a_Importance,                Description = a_Description,            };            AndroidNotificationCenter.RegisterNotificationChannel(channel);        }


        #region TimeInternalNotifsAndroid
        /// <summary>
        /// Function to create schedule notification on Andorid, it's create <see cref="AndroidNotification"/> and then call <seealso cref="CreateTimeIntervalNotifs"/>
        /// </summary>
        /// <param name="a_Title">Set the title of the notification</param>
        /// <param name="a_Text">Set the title of the notification</param>
        /// <param name="a_ChannelId">Set the title of the notification</param>
        /// <param name="a_hours">Set the title of the notification</param>
        /// <param name="a_minutes">Set the title of the notification</param>
        /// <param name="a_seconds">Set the title of the notification</param>        public static void CreateTimeIntervalNotifs(string a_Title, string a_Text, string a_ChannelId, int a_hours = 0, int a_minutes = 0, int a_seconds = 0)        {            var notification = new AndroidNotification();            notification.Title = a_Title;            notification.Text = a_Text;            notification.FireTime = System.DateTime.Now.AddHours(a_hours);            notification.FireTime = System.DateTime.Now.AddMinutes(a_minutes);            notification.FireTime = System.DateTime.Now.AddSeconds(a_seconds);            CreateTimeIntervalNotifs(notification, a_ChannelId);        }

        /// <summary>
        /// Use to get the user use to come on the app
        /// </summary>
        /// <returns>null if the user doesn't come from a notification</returns>        public AndroidNotificationIntentData GetNotifUserOpenAppWith()
        {
            return AndroidNotificationCenter.GetLastNotificationIntent(); ;
        }

        /// <summary>
        /// Function that send the notification
        /// </summary>
        /// <param name="a_notification">Var that contains all the data for the notification</param>
        /// <param name="a_ChannelId">This for the id of the channel where the notification is send</param>        public static void CreateTimeIntervalNotifs(AndroidNotification a_notification, string a_ChannelId)        {            AndroidNotificationCenter.SendNotification(a_notification, a_ChannelId);        }        /// <summary>
        /// You can use this function to remove all schedule notification
        /// </summary>        public static void RemoveAllNotifs()        {            AndroidNotificationCenter.CancelAllScheduledNotifications();        }
        #endregion
#elif UNITY_IOS        private bool NotificationAuthorizationGranted;        /// <summary>
        /// Need to be call before creating a notification, but we call if it's not call before when creating a notification
        /// </summary>        public void AskRequest()        {            StartCoroutine(_RequestAuthorization());        }        public IEnumerator _RequestAuthorization()        {            var authorizationOption = AuthorizationOption.Alert | AuthorizationOption.Sound | AuthorizationOption.Badge;            using (var req = new AuthorizationRequest(authorizationOption, true))            {                while (!req.IsFinished)                {                    yield return null;                };                NotificationAuthorizationGranted = req.Granted;                string res = "\n RequestAuthorization:";                res += "\n finished: " + req.IsFinished;                res += "\n granted :  " + req.Granted;                res += "\n error:  " + req.Error;                res += "\n deviceToken:  " + req.DeviceToken;                Debug.Log(res);            }        }        /// <summary>
        /// Use to get the user use to come on the app
        /// </summary>
        /// <returns>null if the user doesn't come from a notification</returns>        public iOSNotification GetNotifUserOpenAppWith()
        {
            return iOSNotificationCenter.GetLastRespondedNotification();
        }        public void RemoveNotif(string a_idNotifs)        {            iOSNotificationCenter.RemoveScheduledNotification(a_idNotifs);        }        public void RemoveAllNotif()        {            iOSNotificationCenter.RemoveAllScheduledNotifications();        }


        #region TimeInternalNotifsIOS
        /// <summary>
        /// Function to create schedule notification on iOS, it's create <see cref="iOSNotificationTimeIntervalTrigger"/> and <see cref="iOSNotification"/> and then call CreateTimeIntervalNotifs <seealso cref="CreateTimeIntervalNotifs"/>
        /// </summary>
        /// <param name="hours">Number of hours the notification to be launched</param>
        /// <param name="minutes">Number of minutes the notification to be launched</param>
        /// <param name="seconds">Number of seconds the notification to be launched</param>
        /// <param name="a_Identifier">You have to set the id of the notification if you want to delete later</param>
        /// <param name="a_Title">The title of the notification</param>
        /// <param name="a_Body">The body of the notification</param>
        /// <param name="a_Subtitle">The subtitile of the notification</param>
        /// <param name="a_CategoryIdentifier">The category identifier of the notification, default value <value>Category_1</value></param>
        /// <param name="a_ThreadIdentifier">The thread identifier of the notification, default value <value>thread1</param>        public void CreateTimeIntervalNotifs(int hours, int minutes, int seconds, string a_Identifier, string a_Title, string a_Body, string a_Subtitle, string a_CategoryIdentifier = "Category_1", string a_ThreadIdentifier = "thread1")        {            var timeTrigger = new iOSNotificationTimeIntervalTrigger()            {                TimeInterval = new TimeSpan(hours, minutes, seconds),                Repeats = false            };            var notification = new iOSNotification()            {                // You can specify a custom identifier which can be used to manage the notification later.                // If you don't provide one, a unique string will be generated automatically.                Identifier = a_Identifier,                Title = a_Title,                Body = a_Body,                Subtitle = a_Subtitle,                ShowInForeground = true,                ForegroundPresentationOption = (PresentationOption.Alert | PresentationOption.Sound),                CategoryIdentifier = a_CategoryIdentifier,                ThreadIdentifier = a_ThreadIdentifier,                Trigger = timeTrigger,            };            //iOSNotificationCenter.ScheduleNotification(notification);            StartCoroutine(CreateTimeIntervalNotifs(notification));        }

        /// <summary>
        /// Function that create a schedule notification it also request authorization if it's not requested before
        /// </summary>
        /// <param name="notification">You will need to create a <see cref="iOSNotification"/> var to store all the value for the schedule notification</param>
        /// <returns><see cref="IEnumerator"/> need to be call in a <see cref="StartCoroutine"/></returns>        public IEnumerator CreateTimeIntervalNotifs(iOSNotification notification)        {            yield return StartCoroutine(_RequestAuthorization());            if(NotificationAuthorizationGranted)                iOSNotificationCenter.ScheduleNotification(notification);        }        #endregion#endif    }}