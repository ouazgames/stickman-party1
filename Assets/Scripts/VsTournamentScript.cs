using UnityEngine;
using UnityEngine.SceneManagement;

public class VsTournamentScript : MonoBehaviour
{
	public int GameCount;

	public string[] Levelname = new string[3]
	{
		"",
		"",
		""
	};

	private bool IsEnd;

	private AudioSource Source;

	public AudioClip ButtonSound;

	public AudioClip ButtonSoundBack;

	private void Start()
	{
		Source = GetComponent<AudioSource>();
	}

	public void PlaySound()
	{
		Source.PlayOneShot(ButtonSound);
	}

	private void FixedUpdate()
	{
		if (GameCount == 3 && !IsEnd)
		{
			Invoke("StartGame", 0.1f);
			PlayerPrefs.SetString("Level2name", Levelname[1]);
			PlayerPrefs.SetString("Level3name", Levelname[2]);
			PlayerPrefs.SetInt("IsCups", 1);
			IsEnd = true;
		}
	}

	public void ClearLevels()
	{
		if (GameCount < 3 && !IsEnd)
		{
			Source.PlayOneShot(ButtonSoundBack);
			GameCount = 0;
		}
	}

	private void StartGame()
	{
		SceneManager.LoadScene(Levelname[0]);
	}
}
