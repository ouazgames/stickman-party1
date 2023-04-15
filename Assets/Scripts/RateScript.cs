using UnityEngine;

public class RateScript : MonoBehaviour
{
	public GameObject RatePanel;

	public int RateCount;

	public AudioClip ButtonSound;

	public AudioClip ButtonBack;

	public AudioClip OpenPanelSound;

	private AudioSource Source;

	public GameObject[] Text1;

	public GameObject[] Text2;

	private int RandomCount;

	public GameObject LaterButton;

	public GameObject NoButton;

	private void Awake()
	{
		RateCount = PlayerPrefs.GetInt("RateCount");
		RandomCount = PlayerPrefs.GetInt("RandomCount");
	}

	private void Start()
	{
		Source = GetComponent<AudioSource>();
		if (RateCount != 2)
		{
			return;
		}
		if (RandomCount == 0)
		{
			GameObject[] text = Text1;
			for (int i = 0; i < text.Length; i++)
			{
				text[i].SetActive(value: true);
			}
			PlayerPrefs.SetInt("RandomCount", 1);
			LaterButton.SetActive(value: true);
		}
		else if (RandomCount == 1)
		{
			GameObject[] text = Text2;
			for (int i = 0; i < text.Length; i++)
			{
				text[i].SetActive(value: true);
			}
			NoButton.SetActive(value: true);
		}
		Source.PlayOneShot(OpenPanelSound);
		RatePanel.SetActive(value: true);
	}

	public void Later()
	{
		PlayerPrefs.SetInt("RateCount", 1);
		PlayerPrefs.Save();
		Source.PlayOneShot(ButtonBack);
		RatePanel.SetActive(value: false);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void RateNow()
	{
		PlayerPrefs.SetInt("RateCount", 3);
		Source.PlayOneShot(ButtonSound);
		RatePanel.SetActive(value: false);
		Application.OpenURL("market://details?id=com.PlayMax.playergames");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void NoThanks()
	{
		Source.PlayOneShot(ButtonBack);
		PlayerPrefs.SetInt("RateCount", 3);
		RatePanel.SetActive(value: false);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}
}
