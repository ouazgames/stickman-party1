using FunGamesSdk.FunGames.SettingsPanel;
using UnityEngine;

public class ExampleSettingsPanel : MonoBehaviour
{
    private void Start()
    {
        FunGamesSettingsPanel.ShowSettingsPanel(
                FunGamesSettingsPanel.BackgroundStyle.GREEN,
                FunGamesSettingsPanel.ButtonStyle.WHITE_ROUNDED)
            .DisplaySoundToggle(false, SoundCallback)
            .DisplayVibrationToggle(false, VibrationCallback)
            .ConnectGiftButton(() => Debug.Log("Gifted 50 coins !"));
    }

    private static void SoundCallback(bool isEnabled)
    {
        Debug.Log("Sound: " + isEnabled);
    }
    
    private static void VibrationCallback(bool isEnabled)
    {
        Debug.Log("Vibrations: " + isEnabled);
    }
}
