using UnityEngine;
using UnityEngine.SceneManagement;

public class CaseScript : MonoBehaviour
{
	public bool IsTanks;

	public AudioClip ScrollSound;

	public AudioClip OpenSound;

	private AudioSource Source;

	public GameObject Level1;

	public GameObject Level2;

	public GameObject Level3;

	public string Level1name = "";

	public string Level2name = "";

	public string Level3name = "";

	private void Start()
	{
		Source = GetComponent<AudioSource>();
		Source.loop = true;
		Source.clip = ScrollSound;
		Source.Play();
		Invoke("Sound1", 2.5f);
	}

	private void Sound1()
	{
		Source.loop = false;
		Source.clip = OpenSound;
		Source.Play();
		Invoke("Sound2", 0.5f);
	}

	private void Sound2()
	{
		Source.Play();
		Invoke("Sound3", 0.5f);
	}

	private void Sound3()
	{
		Source.Play();
		Invoke("OpenLevel", 0.5f);
	}

	private void OpenLevel()
	{
		PlayerPrefs.SetInt("IsCups", 1);
		if (!IsTanks)
		{
			Level1name = Level1.GetComponent<RandomLevel>().LevelName;
			Level2name = Level2.GetComponent<RandomLevel>().LevelName;
			Level3name = Level3.GetComponent<RandomLevel>().LevelName;
			PlayerPrefs.SetString("Level2name", Level2name);
			PlayerPrefs.SetString("Level3name", Level3name);
            
			SceneManager.LoadScene(Level1name);
		}
		else
		{
			Level1name = Level1.GetComponent<RandomLevelTanks>().LevelName;
			Level2name = Level2.GetComponent<RandomLevelTanks>().LevelName;
			Level3name = Level3.GetComponent<RandomLevelTanks>().LevelName;
			PlayerPrefs.SetString("Level2name", Level2name);
			PlayerPrefs.SetString("Level3name", Level3name);
            
			SceneManager.LoadScene(Level1name);
		}
	}
}
