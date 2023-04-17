using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class TankDeathmatchController : MonoBehaviour
{
	private bool IsActive1;

	private bool IsActive2;

	private bool IsActive3;

	private bool IsActive4;

	public GameObject[] LightAnimation;

	public Transform[] SpawnTransform;

	private int WinValue;

	private float time = 120f;

	public Text[] TimerText;

	public Text[] ColorText;

	public int[] ColorCount = new int[4];

	public ShowAds SA;

	private float RandomTimer;

	public GameObject BGMusic;

	public GameObject GameOverPanel;

	public GameObject[] WinObject;

	public GameObject GameOverButtons;

	public GameObject GameOverTie;

	public GameObject TimerAnimation;

	private bool IsStart;

	public AudioClip ButtonSound;

	public AudioClip SoundGo;

	public AudioClip TimerSound;

	private float CountDownSoundTimer = 2f;

	private AudioSource Source;

	public GameObject[] Player;

	public GameObject[] AIPlayer;

	public List<GameObject> Players;

	private string PlayerName;

	private int PlayerNumers;

	public int ListNumber;

	private GameObject[] ActivePlayers;

	private bool IsGameOver;

	private int NeedBot;

	private List<string> names = new List<string>();

	private void Awake()
	{
		PlayerNumers = PlayerPrefs.GetInt("PlayerNumers");
		NeedBot = PlayerPrefs.GetInt("NeedBot");
	}

	private void Start()
	{
		SA = Camera.main.GetComponent<ShowAds>();
		RandomTimer = UnityEngine.Random.Range(4f, 7f);
		if (PlayerNumers == 1)
		{
			Player[0].SetActive(value: true);
			GameObject[] aIPlayer = AIPlayer;
			for (int i = 0; i < aIPlayer.Length; i++)
			{
				aIPlayer[i].SetActive(value: true);
			}
		}
		if (PlayerNumers == 2)
		{
			if (NeedBot == 1)
			{
				Player[0].SetActive(value: true);
				Player[1].SetActive(value: true);
				AIPlayer[1].SetActive(value: true);
				AIPlayer[2].SetActive(value: true);
			}
			else
			{
				Player[0].SetActive(value: true);
				Player[1].SetActive(value: true);
			}
		}
		else if (PlayerNumers == 3)
		{
			if (NeedBot == 1)
			{
				Player[0].SetActive(value: true);
				Player[1].SetActive(value: true);
				Player[2].SetActive(value: true);
				AIPlayer[2].SetActive(value: true);
			}
			else
			{
				Player[0].SetActive(value: true);
				Player[1].SetActive(value: true);
				Player[2].SetActive(value: true);
			}
		}
		else if (PlayerNumers == 4)
		{
			GameObject[] aIPlayer = Player;
			for (int i = 0; i < aIPlayer.Length; i++)
			{
				aIPlayer[i].SetActive(value: true);
			}
		}
		Source = GetComponent<AudioSource>();
		Invoke("StartAnimation", 0.5f);
		Invoke("StartGame", 1.2f);
		ActivePlayers = GameObject.FindGameObjectsWithTag("Player");
		Players = new List<GameObject>(ActivePlayers);
		ListNumber = Players.Count;
	}

	private void StartAnimation()
	{
		TimerAnimation.SetActive(value: true);
		Source.PlayOneShot(SoundGo);
	}

	private void StartGame()
	{
		IsStart = true;
		if (PlayerNumers == 1)
		{
			ActivePlayers[0].GetComponent<TankScript>().IsSMove = true;
			ActivePlayers[1].GetComponent<TankAI>().IsSMove = true;
			ActivePlayers[2].GetComponent<TankAI>().IsSMove = true;
			ActivePlayers[3].GetComponent<TankAI>().IsSMove = true;
		}
		else if (PlayerNumers == 2)
		{
			if (NeedBot == 1)
			{
				ActivePlayers[0].GetComponent<TankScript>().IsSMove = true;
				ActivePlayers[1].GetComponent<TankScript>().IsSMove = true;
				ActivePlayers[2].GetComponent<TankAI>().IsSMove = true;
				ActivePlayers[3].GetComponent<TankAI>().IsSMove = true;
			}
			else
			{
				GameObject[] activePlayers = ActivePlayers;
				for (int i = 0; i < activePlayers.Length; i++)
				{
					activePlayers[i].GetComponent<TankScript>().IsSMove = true;
				}
			}
		}
		else if (PlayerNumers == 3)
		{
			if (NeedBot == 1)
			{
				ActivePlayers[0].GetComponent<TankScript>().IsSMove = true;
				ActivePlayers[1].GetComponent<TankScript>().IsSMove = true;
				ActivePlayers[2].GetComponent<TankScript>().IsSMove = true;
				ActivePlayers[3].GetComponent<TankAI>().IsSMove = true;
			}
			else
			{
				GameObject[] activePlayers = ActivePlayers;
				for (int i = 0; i < activePlayers.Length; i++)
				{
					activePlayers[i].GetComponent<TankScript>().IsSMove = true;
				}
			}
		}
		else if (PlayerNumers == 4)
		{
			GameObject[] activePlayers = ActivePlayers;
			for (int i = 0; i < activePlayers.Length; i++)
			{
				activePlayers[i].GetComponent<TankScript>().IsSMove = true;
			}
		}
		StartCoundownTimer();
	}

	private void StartCoundownTimer()
	{
		time = 120f;
		Text[] timerText = TimerText;
		for (int i = 0; i < timerText.Length; i++)
		{
			timerText[i].text = "02:00";
		}
		InvokeRepeating("UpdateTimer", 0f, 0.01667f);
	}

	private void UpdateTimer()
	{
		if (!IsGameOver)
		{
			time -= Time.deltaTime;
		}
		string str = Mathf.Floor(time / 60f).ToString("00");
		string str2 = (time % 60f).ToString("00");
		Text[] timerText = TimerText;
		for (int i = 0; i < timerText.Length; i++)
		{
			timerText[i].text = str + ":" + str2;
		}
	}

	private void FixedUpdate()
	{
		ColorText[0].text = string.Concat(ColorCount[0]);
		ColorText[1].text = string.Concat(ColorCount[1]);
		ColorText[2].text = string.Concat(ColorCount[2]);
		ColorText[3].text = string.Concat(ColorCount[3]);
	}

	private void Update()
	{
		AdsManager.Instance.HideBanner();
		if (time <= 2f && time > 0f && !IsGameOver && CountDownSoundTimer >= 2f)
		{
			Source.PlayOneShot(TimerSound);
			CountDownSoundTimer = 0f;
		}
		if (time <= 0f && !IsGameOver)
		{
			time = 0f;
			GameOver();
			IsGameOver = true;
		}
		if (!IsStart)
		{
			return;
		}
		if (!ActivePlayers[0].activeSelf && !IsActive1)
		{
			ActivePlayers[0].transform.position = SpawnTransform[0].position;
			Invoke("Active1", 2f);
			IsActive1 = true;
		}
		else if (!ActivePlayers[1].activeSelf && !IsActive2)
		{
			ActivePlayers[1].transform.position = SpawnTransform[1].position;
			Invoke("Active2", 2f);
			IsActive2 = true;
		}
		if (ActivePlayers.Length >= 3)
		{
			if (!ActivePlayers[2].activeSelf && !IsActive3)
			{
				ActivePlayers[2].transform.position = SpawnTransform[2].position;
				Invoke("Active3", 2f);
				IsActive3 = true;
			}
			if (ActivePlayers.Length >= 4 && !ActivePlayers[3].activeSelf && !IsActive4)
			{
				ActivePlayers[3].transform.position = SpawnTransform[3].position;
				Invoke("Active4", 2f);
				IsActive4 = true;
			}
		}
	}

	private void Active1()
	{
		LightAnimation[3].SetActive(value: true);
		ActivePlayers[0].SetActive(value: true);
		IsActive1 = false;
		Invoke("AnimOff1", 1f);
	}

	private void AnimOff1()
	{
		LightAnimation[3].SetActive(value: false);
	}

	private void Active2()
	{
		LightAnimation[1].SetActive(value: true);
		ActivePlayers[1].SetActive(value: true);
		IsActive2 = false;
		Invoke("AnimOff2", 1f);
	}

	private void AnimOff2()
	{
		LightAnimation[1].SetActive(value: false);
	}

	private void Active3()
	{
		LightAnimation[2].SetActive(value: true);
		ActivePlayers[2].SetActive(value: true);
		IsActive3 = false;
		Invoke("AnimOff3", 1f);
	}

	private void AnimOff3()
	{
		LightAnimation[2].SetActive(value: false);
	}

	private void Active4()
	{
		LightAnimation[0].SetActive(value: true);
		ActivePlayers[3].SetActive(value: true);
		IsActive4 = false;
		Invoke("AnimOff4", 1f);
	}

	private void AnimOff4()
	{
		LightAnimation[0].SetActive(value: false);
	}

	public void GameOver()
	{
		IsGameOver = true;
		IsStart = false;
		GameAnalytic.AddProgression(new LevelProgression()
		{

			state = ProgressionStatus.Completed,
			v_LevelName = "Level Tank Death match Game"

		});
		//GameOverPanel.SetActive(value: true);
		BGMusic.SetActive(value: false);
		Invoke("GetButtons", 2f);
		int num = Mathf.Max(ColorCount);
		for (int i = 0; i < ColorCount.Length; i++)
		{
			if (num != 0)
			{
				if (ColorCount[i] == num)
				{
					switch (i)
					{
					case 0:
						WinObject[0].SetActive(value: true);
						break;
					case 1:
						WinObject[1].SetActive(value: true);
						break;
					case 2:
						WinObject[2].SetActive(value: true);
						break;
					case 3:
						WinObject[3].SetActive(value: true);
						break;
					}
				}
			}
			else
			{
				GameOverTie.SetActive(value: true);
			}
		}
		if (PlayerNumers == 1)
		{
			ActivePlayers[0].GetComponent<TankScript>().IsSMove = false;
			ActivePlayers[1].GetComponent<TankAI>().IsSMove = false;
			ActivePlayers[2].GetComponent<TankAI>().IsSMove = false;
			ActivePlayers[3].GetComponent<TankAI>().IsSMove = false;
		}
		else if (PlayerNumers == 2)
		{
			if (NeedBot == 1)
			{
				ActivePlayers[0].GetComponent<TankScript>().IsSMove = false;
				ActivePlayers[1].GetComponent<TankScript>().IsSMove = false;
				ActivePlayers[2].GetComponent<TankAI>().IsSMove = false;
				ActivePlayers[3].GetComponent<TankAI>().IsSMove = false;
			}
			else
			{
				GameObject[] activePlayers = ActivePlayers;
				for (int j = 0; j < activePlayers.Length; j++)
				{
					activePlayers[j].GetComponent<TankScript>().IsSMove = false;
				}
			}
		}
		else if (PlayerNumers == 3)
		{
			if (NeedBot == 1)
			{
				ActivePlayers[0].GetComponent<TankScript>().IsSMove = false;
				ActivePlayers[1].GetComponent<TankScript>().IsSMove = false;
				ActivePlayers[2].GetComponent<TankScript>().IsSMove = false;
				ActivePlayers[3].GetComponent<TankAI>().IsSMove = false;
			}
			else
			{
				GameObject[] activePlayers = ActivePlayers;
				for (int j = 0; j < activePlayers.Length; j++)
				{
					activePlayers[j].GetComponent<TankScript>().IsSMove = false;
				}
			}
		}
		else if (PlayerNumers == 4)
		{
			GameObject[] activePlayers = ActivePlayers;
			for (int j = 0; j < activePlayers.Length; j++)
			{
				activePlayers[j].GetComponent<TankScript>().IsSMove = false;
			}
		}
		//SA.ShowInter();
	}

	private void GetButtons()
	{
		GameOverButtons.SetActive(value: true);
	}

	public void MainMenuButton()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene(1);
	}

	public void RestartButton()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
	}

	public void AddRed()
	{
		ColorCount[0]++;
	}

	public void AddBlue()
	{
		ColorCount[1]++;
	}

	public void AddGreen()
	{
		ColorCount[2]++;
	}

	public void AddYellow()
	{
		ColorCount[3]++;
	}
}
