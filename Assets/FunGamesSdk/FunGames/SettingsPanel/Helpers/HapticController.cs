using UnityEngine;

namespace FunGamesSdk.FunGames.SettingsPanel.Scripts
{
    public class HapticController : MonoBehaviour
    {
        public bool IsEnable { get; private set; } = true;
        
        public void ToggleVibrations()
        {
            IsEnable = IsEnable ? false : true;
        }
    }
}
