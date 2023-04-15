using UnityEngine;
using System.Collections;
using System;

namespace EasyMobile
{
    [AddComponentMenu("")]
    internal class Helper : MonoBehaviour
    {
        public static readonly DateTime UnixEpoch =
            DateTime.SpecifyKind(new DateTime(1970, 1, 1), DateTimeKind.Utc);

        public static Helper Instance
        { 
            get
            {
                if (_instance == null)
                {
                    _instance = new GameObject("EM_Helper").AddComponent<Helper>();
                    DontDestroyOnLoad(_instance.gameObject);
                }

                return _instance;
            }
        }

        private static Helper _instance;

        void OnDisable()
        {
            if (_instance == this)
            {
                _instance = null;
            }
        }

        /// <summary>
        /// Destroys the proxy game object that carries the instance of this class if one exists.
        /// </summary>
        static void DestroyProxy()
        {
            if (_instance != null)
            {
                Destroy(_instance.gameObject);
                _instance = null;
            }
        }

        /// <summary>
        /// Gets the app installation timestamp. This requires the EasyMobile prefab instance
        /// to be added to the first scene of the game. If such instance is not found, the
        /// Epoch time (01/01/1970) will be returned instead.
        /// </summary>
        /// <returns>The app installation time.</returns>
        public static DateTime GetAppInstallationTime()
        {
            if (EM_PrefabManager.Instance != null)
            {
                return EM_PrefabManager.Instance.GetAppInstallationTimestamp();
            }
            else
            {
                return Helper.UnixEpoch;
            }
        }

        /// <summary>
        /// Determines if the current build is a development build.
        /// </summary>
        /// <returns><c>true</c> if is development build; otherwise, <c>false</c>.</returns>
        public static bool IsUnityDevelopmentBuild()
        {
            #if DEBUG || DEVELOPMENT_BUILD
            return true;
            #else
            return false;
            #endif
        }

        /// <summary>
        /// Starts a coroutine from non-MonoBehavior objects.
        /// </summary>
        /// <param name="routine">Routine.</param>
        public static void RunCoroutine(IEnumerator routine)
        {
            if (routine != null)
                Instance.StartCoroutine(routine);
        }

        /// <summary>
        /// Stops a coroutine from non-MonoBehavior objects.
        /// </summary>
        /// <param name="routine">Routine.</param>
        public static void EndCoroutine(IEnumerator routine)
        {
            if (routine != null)
                Instance.StopCoroutine(routine);
        }

        /// <summary>
        /// Throws an <see cref="ArgumentNullException"/> if the given value is null.
        /// </summary>
        /// <returns>The input value.</returns>
        /// <param name="value">Value.</param>
        /// <typeparam name="T">The 1st type parameter.</typeparam>
        public static T NullArgumentTest<T>(T value)
        {
            if (value == null)
            {
                throw new ArgumentNullException();
            }
        
            return value;
        }

        /// <summary>
        /// Throws an <see cref="ArgumentNullException"/> with the indicated parameter name if the given value is null.
        /// </summary>
        /// <returns>The argument test.</returns>
        /// <param name="value">Value.</param>
        /// <param name="paramName">Parameter name.</param>
        /// <typeparam name="T">The 1st type parameter.</typeparam>
        public static T NullArgumentTest<T>(T value, string paramName)
        {
            if (value == null)
            {
                throw new ArgumentNullException(paramName);
            }

            return value;
        }

        /// <summary>
        /// Constructs a <see cref="DateTime"/> from the milliseconds since Unix Epoch.
        /// </summary>
        /// <returns>The DateTime value.</returns>
        /// <param name="millisSinceEpoch">Milliseconds since Epoch.</param>
        public static DateTime FromMillisSinceUnixEpoch(long millisSinceEpoch)
        {
            return UnixEpoch.Add(TimeSpan.FromMilliseconds(millisSinceEpoch));
        }

        /// <summary>
        /// Converts a <see cref="TimeSpan"/> to miliseconds.
        /// </summary>
        /// <returns>The milliseconds.</returns>
        /// <param name="span">Time span.</param>
        public static long ToMilliseconds(TimeSpan span)
        {
            double millis = span.TotalMilliseconds;

            if (millis > long.MaxValue)
            {
                return long.MaxValue;
            }

            if (millis < long.MinValue)
            {
                return long.MinValue;
            }

            return Convert.ToInt64(millis);
        }

        /// <summary>
        /// Stores a <see cref="DateTime"/> as string to <see cref="PlayerPrefs"/>.
        /// </summary>
        /// <param name="time">Time.</param>
        /// <param name="ppkey">PlayerPrefs key to store the value.</param>
        public static void StoreTime(string ppkey, DateTime time)
        {
            PlayerPrefs.SetString(ppkey, time.ToBinary().ToString());
            PlayerPrefs.Save();
        }

        /// <summary>
        /// Gets the stored string in the <see cref="PlayerPrefs"/>, converts it to a <see cref="DateTime"/> and returns.
        /// If no value was stored previously, the given default time is returned.
        /// </summary>
        /// <returns>The time.</returns>
        /// <param name="ppkey">PlayPrefs key to retrieve the value.</param>
        public static DateTime GetTime(string ppkey, DateTime defaultTime)
        {
            string storedTime = PlayerPrefs.GetString(ppkey, string.Empty);

            if (!string.IsNullOrEmpty(storedTime))
                return DateTime.FromBinary(Convert.ToInt64(storedTime));
            else
                return defaultTime;
        }
    }
}