using UnityEngine;
using System.Collections;
using System;

namespace EasyMobile
{
    public class EM_PrefabManager : MonoBehaviour
    {
        public static EM_PrefabManager Instance { get; private set; }

        private const string APP_INSTALLATION_TIMESTAMP_PPKEY = "EM_APP_INSTALLATION_TIMESTAMP";

        void Awake()
        {
            if (Instance != null)
            {
                Destroy(gameObject);
            }
            else
            {
                // Store installation timestamp.
                if (Helper.GetTime(APP_INSTALLATION_TIMESTAMP_PPKEY, Helper.UnixEpoch) == Helper.UnixEpoch)
                {
                    // No timestamp was stored previously. Store the current time as installation time.
                    Helper.StoreTime(APP_INSTALLATION_TIMESTAMP_PPKEY, DateTime.Now);
                }

                Instance = this;
                DontDestroyOnLoad(gameObject);

                // Debug logging setting: only enable debug log in editor or development builds.
                #if DEBUG || DEVELOPMENT_BUILD
                SetLogEnabled(true);
                #else
                SetLogEnabled(false);
                #endif
            }
        }

        void SetLogEnabled(bool isEnabled)
        {
            #if UNITY_2017_1_OR_NEWER
            Debug.unityLogger.logEnabled = isEnabled;
            #else
            Debug.logger.logEnabled = isEnabled;
            #endif
        }

        void OnDestroy()
        {
            if (Instance == this)
            {
                Instance = null;
            }
        }

        #region Public API

        /// <summary>
        /// Gets the installation timestamp of this app.
        /// </summary>
        /// <returns>The installation timestamp.</returns>
        public DateTime GetAppInstallationTimestamp()
        {
            return Helper.GetTime(APP_INSTALLATION_TIMESTAMP_PPKEY, Helper.UnixEpoch);
        }

        #endregion
    }
}

