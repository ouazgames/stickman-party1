using UnityEngine;

namespace FunGamesSdk.FunGames.SettingsPanel.Scripts
{
    public class AudioController : MonoBehaviour
    {
        public void ToggleAudio()
        {
            if (AudioListener.pause)
            {
                AudioListener.pause = true;
            }
            else
            {
                AudioListener.pause = false;
            }
        }
    }
}
