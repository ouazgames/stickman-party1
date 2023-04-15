using UnityEngine;

public class OptionsIntro : MonoBehaviour
{
	public int AudioCheck;

	public int VibrationCheck;

	public static OptionsIntro Instance
	{
		get;
		set;
	}

	private void Awake()
	{
		Instance = this;
		Object.DontDestroyOnLoad(base.gameObject);
		AudioCheck = PlayerPrefs.GetInt("AudioCheck");
		VibrationCheck = PlayerPrefs.GetInt("VibrationCheck");
		if (AudioCheck == 0)
		{
			AudioListener.volume = 1f;
		}
		else if (AudioCheck == 1)
		{
			AudioListener.volume = 0f;
		}
	}

	private void OnDisable()
	{
	}

	public void OffAllSound()
	{
		AudioCheck = 1;
		AudioListener.volume = 0f;
		PlayerPrefs.SetInt("AudioCheck", AudioCheck);
	}

	public void OnAllSound()
	{
		AudioCheck = 0;
		AudioListener.volume = 1f;
		PlayerPrefs.SetInt("AudioCheck", AudioCheck);
	}

	public void OffVibration()
	{
		VibrationCheck = 1;
		PlayerPrefs.SetInt("VibrationCheck", VibrationCheck);
	}

	public void OnVibration()
	{
		VibrationCheck = 0;
		TriggerSelection();
		PlayerPrefs.SetInt("VibrationCheck", VibrationCheck);
	}

	public virtual void TriggerVibrate()
	{
		if (VibrationCheck == 0)
		{
			MMVibrationManager.Vibrate();
		}
	}

	public virtual void TriggerSelection()
	{
		if (VibrationCheck == 0)
		{
			MMVibrationManager.Haptic(HapticTypes.Selection);
		}
	}
}
