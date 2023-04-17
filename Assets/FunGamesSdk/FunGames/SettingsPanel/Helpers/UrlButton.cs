using FunGames.Sdk.Analytics;
using UnityEngine;

#pragma warning disable 0649

namespace FunGamesSdk.FunGames.SettingsPanel.Scripts
{
    public class UrlButton : MonoBehaviour
    {
        [SerializeField] private string url;

        public void OpenURL()
        {
            FunGamesAnalytics.NewDesignEvent("");
            Application.OpenURL(url);
        }
    }
}
