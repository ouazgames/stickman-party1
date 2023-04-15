using UnityEngine;

public class Options : MonoBehaviour
{
	public GameObject SoundButtonOn;

	public GameObject SoundButtonOff;

	public GameObject VButtonOn;

	public GameObject VButtonOff;

	public AudioClip ButtonSound;

	public AudioClip ButtonBackSound;

	public AudioClip OpenOptionsSound;

	private AudioSource Source;

	public GameObject OptionsPanel;

	private void Awake()
	{
		Source = GetComponent<AudioSource>();
		if (OptionsIntro.Instance.AudioCheck == 0)
		{
			SoundButtonOn.SetActive(value: true);
			SoundButtonOff.SetActive(value: false);
		}
		else if (OptionsIntro.Instance.AudioCheck == 1)
		{
			SoundButtonOn.SetActive(value: false);
			SoundButtonOff.SetActive(value: true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			VButtonOn.SetActive(value: true);
			VButtonOff.SetActive(value: false);
		}
		else if (OptionsIntro.Instance.VibrationCheck == 1)
		{
			VButtonOn.SetActive(value: false);
			VButtonOff.SetActive(value: true);
		}
	}

	public void OffAllSound()
	{
		SoundButtonOn.SetActive(value: false);
		SoundButtonOff.SetActive(value: true);
		OptionsIntro.Instance.OffAllSound();
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void OnAllSound()
	{
		SoundButtonOn.SetActive(value: true);
		SoundButtonOff.SetActive(value: false);
		OptionsIntro.Instance.OnAllSound();
		Source.PlayOneShot(ButtonSound);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void OffVibration()
	{
		VButtonOn.SetActive(value: false);
		VButtonOff.SetActive(value: true);
		Source.PlayOneShot(ButtonSound);
		OptionsIntro.Instance.OffVibration();
	}

	public void OnVibration()
	{
		VButtonOn.SetActive(value: true);
		VButtonOff.SetActive(value: false);
		Source.PlayOneShot(ButtonSound);
		OptionsIntro.Instance.OnVibration();
	}

	public void OpenOption()
	{
		OptionsPanel.SetActive(value: true);
		Source.PlayOneShot(ButtonSound);
		Source.PlayOneShot(OpenOptionsSound);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void CloseOptionsPanel()
	{
		OptionsPanel.SetActive(value: false);
		Source.PlayOneShot(ButtonBackSound);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}
}
