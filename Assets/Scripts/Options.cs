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
			SoundButtonOn.SetActive(true);
			SoundButtonOff.SetActive(false);
		}
		else if (OptionsIntro.Instance.AudioCheck == 1)
		{
			SoundButtonOn.SetActive(false);
			SoundButtonOff.SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			VButtonOn.SetActive(true);
			VButtonOff.SetActive(false);
		}
		else if (OptionsIntro.Instance.VibrationCheck == 1)
		{
			VButtonOn.SetActive(false);
			VButtonOff.SetActive(true);
		}
	}

	public void OffAllSound()
	{
		SoundButtonOn.SetActive(false);
		SoundButtonOff.SetActive(true);
		OptionsIntro.Instance.OffAllSound();
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void OnAllSound()
	{
		SoundButtonOn.SetActive(true);
		SoundButtonOff.SetActive(false);
		OptionsIntro.Instance.OnAllSound();
		Source.PlayOneShot(ButtonSound);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void OffVibration()
	{
		VButtonOn.SetActive(false);
		VButtonOff.SetActive(true);
		Source.PlayOneShot(ButtonSound);
		OptionsIntro.Instance.OffVibration();
	}

	public void OnVibration()
	{
		VButtonOn.SetActive(true);
		VButtonOff.SetActive(false);
		Source.PlayOneShot(ButtonSound);
		OptionsIntro.Instance.OnVibration();
	}

	public void OpenOption()
	{
		OptionsPanel.SetActive(true);
		Source.PlayOneShot(ButtonSound);
		Source.PlayOneShot(OpenOptionsSound);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void CloseOptionsPanel()
	{
		OptionsPanel.SetActive(false);
		Source.PlayOneShot(ButtonBackSound);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}
}
