using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SeaBattleController : MonoBehaviour
{
	public int[] TournamentArray;

	private bool IsRedWin;

	private bool IsBlueWin;

	private bool IsGreenWin;

	private bool IsYellowWin;

	public ShowAds SA;

	public int[] ColorCount = new int[4];

	private float time = 60f;

	public Text[] TimerText;

	public Text[] ColorText;

	public GameObject BGMusic;

	public GameObject GameOverPanel;

	public GameObject[] WinObject;

	public GameObject GameOverButtons;

	public GameObject GameOverTie;

	public GameObject TimerAnimation;

	private bool IsStart;

	public AudioClip ButtonSound;

	public AudioClip Sound3;

	public AudioClip Sound2;

	public AudioClip Sound1;

	public AudioClip SoundGo;

	public AudioClip TimerSound;

	private float CountDownSoundTimer = 2f;

	private AudioSource Source;

	public GameObject[] Player;

	public GameObject[] AiPlayer;

	public GameObject[] JoystickObject;

	private int PlayerNumers;

	private GameObject[] ActivePlayers;

	private string PlayerName;

	private bool IsGameOver;

	private int RedValue;

	private int BlueValue;

	private int GreenValue;

	private int YellowValue;

	private int NeedBot;

	private void Awake()
	{
		PlayerNumers = PlayerPrefs.GetInt("PlayerNumers");
		NeedBot = PlayerPrefs.GetInt("NeedBot");
	}

	private void Start()
	{
		SA = Camera.main.GetComponent<ShowAds>();
		if (PlayerNumers == 1)
		{
			Player[0].SetActive(value: true);
			AiPlayer[0].SetActive(value: true);
			AiPlayer[1].SetActive(value: true);
			AiPlayer[2].SetActive(value: true);
			JoystickObject[0].SetActive(value: true);
		}
		if (PlayerNumers == 2)
		{
			if (NeedBot == 1)
			{
				Player[0].SetActive(value: true);
				Player[1].SetActive(value: true);
				JoystickObject[0].SetActive(value: true);
				JoystickObject[1].SetActive(value: true);
				AiPlayer[1].SetActive(value: true);
				AiPlayer[2].SetActive(value: true);
			}
			else
			{
				Player[0].SetActive(value: true);
				Player[1].SetActive(value: true);
				JoystickObject[0].SetActive(value: true);
				JoystickObject[1].SetActive(value: true);
			}
		}
		else if (PlayerNumers == 3)
		{
			if (NeedBot == 1)
			{
				Player[0].SetActive(value: true);
				Player[1].SetActive(value: true);
				Player[2].SetActive(value: true);
				JoystickObject[0].SetActive(value: true);
				JoystickObject[1].SetActive(value: true);
				JoystickObject[2].SetActive(value: true);
				AiPlayer[2].SetActive(value: true);
			}
			else
			{
				Player[0].SetActive(value: true);
				Player[1].SetActive(value: true);
				Player[2].SetActive(value: true);
				JoystickObject[0].SetActive(value: true);
				JoystickObject[1].SetActive(value: true);
				JoystickObject[2].SetActive(value: true);
			}
		}
		else if (PlayerNumers == 4)
		{
			GameObject[] player = Player;
			for (int i = 0; i < player.Length; i++)
			{
				player[i].SetActive(value: true);
			}
			player = JoystickObject;
			for (int i = 0; i < player.Length; i++)
			{
				player[i].SetActive(value: true);
			}
		}
		Source = GetComponent<AudioSource>();
		Source.volume = 0.8f;
		Invoke("StartAnimation", 0.5f);
		Invoke("StartGame", 1.2f);
		ActivePlayers = GameObject.FindGameObjectsWithTag("Player");
	}

	private void StartAnimation()
	{
		TimerAnimation.SetActive(value: true);
		Source.PlayOneShot(SoundGo);
	}

	private void StartGame()
	{
		IsStart = true;
		GameObject[] activePlayers = ActivePlayers;
		for (int i = 0; i < activePlayers.Length; i++)
		{
			activePlayers[i].GetComponent<SeaBattlePlayer>().IsSMove = true;
		}
		StartCoundownTimer();
		Invoke("FirstSpawn", 2f);
	}

	private void StartCoundownTimer()
	{
		time = 60f;
		Text[] timerText = TimerText;
		for (int i = 0; i < timerText.Length; i++)
		{
			timerText[i].text = "01:00";
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
		RedValue = ColorCount[0];
		BlueValue = ColorCount[1];
		GreenValue = ColorCount[2];
		YellowValue = ColorCount[3];
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
	}

	public void GameOver()
	{
		IsGameOver = true;
		IsStart = false;
		GameAnalytic.AddProgression(new LevelProgression()
		{

			state = ProgressionStatus.Completed,
			v_LevelName = "Level SeaBattle Game"

		});
		AdsManager.Instance.ShowIntersitial(() => { Debug.Log("intersitial worked"); });
		//GameOverPanel.SetActive(value: true);
		BGMusic.SetActive(value: false);
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
						if (PlayerPrefs.GetInt("IsCups") == 1)
						{
							PlayerPrefs.SetInt("RedNewCount", 3);
							IsRedWin = true;
						}
						break;
					case 1:
						WinObject[1].SetActive(value: true);
						if (PlayerPrefs.GetInt("IsCups") == 1)
						{
							PlayerPrefs.SetInt("BlueNewCount", 3);
							IsBlueWin = true;
						}
						break;
					case 2:
						WinObject[2].SetActive(value: true);
						if (PlayerPrefs.GetInt("IsCups") == 1)
						{
							PlayerPrefs.SetInt("GreenNewCount", 3);
							IsGreenWin = true;
						}
						break;
					case 3:
						WinObject[3].SetActive(value: true);
						if (PlayerPrefs.GetInt("IsCups") == 1)
						{
							PlayerPrefs.SetInt("YellowNewCount", 3);
							IsYellowWin = true;
						}
						break;
					}
				}
				TournamentArray = ColorCount;
				TournamentArray = (from a in TournamentArray
					orderby a descending
					select a).ToArray();
				if (PlayerPrefs.GetInt("IsCups") != 1)
				{
					continue;
				}
				if (ActivePlayers.Length == 2)
				{
					if (TournamentArray[0] == RedValue)
					{
						if (!IsRedWin)
						{
							PlayerPrefs.SetInt("RedNewCount", 3);
						}
						else if (!IsBlueWin)
						{
							PlayerPrefs.SetInt("BlueNewCount", 0);
						}
					}
					else if (TournamentArray[0] == BlueValue)
					{
						if (!IsRedWin)
						{
							PlayerPrefs.SetInt("RedNewCount", 0);
						}
						else if (!IsBlueWin)
						{
							PlayerPrefs.SetInt("BlueNewCount", 3);
						}
					}
				}
				else if (ActivePlayers.Length == 3)
				{
					if (TournamentArray[0] == RedValue)
					{
						if (!IsRedWin)
						{
							PlayerPrefs.SetInt("RedNewCount", 3);
						}
					}
					else if (TournamentArray[0] == BlueValue)
					{
						if (!IsBlueWin)
						{
							PlayerPrefs.SetInt("BlueNewCount", 3);
						}
					}
					else if (TournamentArray[0] == GreenValue && !IsGreenWin)
					{
						PlayerPrefs.SetInt("GreenNewCount", 3);
					}
					if (TournamentArray[1] == RedValue)
					{
						if (!IsRedWin)
						{
							PlayerPrefs.SetInt("RedNewCount", 2);
						}
					}
					else if (TournamentArray[1] == BlueValue)
					{
						if (!IsBlueWin)
						{
							PlayerPrefs.SetInt("BlueNewCount", 2);
						}
					}
					else if (TournamentArray[1] == GreenValue && !IsGreenWin)
					{
						PlayerPrefs.SetInt("GreenNewCount", 2);
					}
					if (TournamentArray[2] == RedValue)
					{
						if (!IsRedWin)
						{
							PlayerPrefs.SetInt("RedNewCount", 0);
						}
					}
					else if (TournamentArray[2] == BlueValue)
					{
						if (!IsBlueWin)
						{
							PlayerPrefs.SetInt("BlueNewCount", 0);
						}
					}
					else if (TournamentArray[2] == GreenValue && !IsGreenWin)
					{
						PlayerPrefs.SetInt("GreenNewCount", 0);
					}
				}
				else
				{
					if (ActivePlayers.Length != 4)
					{
						continue;
					}
					if (TournamentArray[0] == RedValue)
					{
						if (!IsRedWin)
						{
							PlayerPrefs.SetInt("RedNewCount", 3);
						}
					}
					else if (TournamentArray[0] == BlueValue)
					{
						if (!IsBlueWin)
						{
							PlayerPrefs.SetInt("BlueNewCount", 3);
						}
					}
					else if (TournamentArray[0] == GreenValue)
					{
						if (!IsGreenWin)
						{
							PlayerPrefs.SetInt("GreenNewCount", 3);
						}
					}
					else if (TournamentArray[0] == YellowValue && !IsYellowWin)
					{
						PlayerPrefs.SetInt("YellowNewCount", 3);
					}
					if (TournamentArray[1] == RedValue)
					{
						if (!IsRedWin)
						{
							PlayerPrefs.SetInt("RedNewCount", 2);
						}
					}
					else if (TournamentArray[1] == BlueValue)
					{
						if (!IsBlueWin)
						{
							PlayerPrefs.SetInt("BlueNewCount", 2);
						}
					}
					else if (TournamentArray[1] == GreenValue)
					{
						if (!IsGreenWin)
						{
							PlayerPrefs.SetInt("GreenNewCount", 2);
						}
					}
					else if (TournamentArray[1] == YellowValue && !IsYellowWin)
					{
						PlayerPrefs.SetInt("YellowNewCount", 2);
					}
					if (TournamentArray[2] == RedValue)
					{
						if (!IsRedWin)
						{
							PlayerPrefs.SetInt("RedNewCount", 1);
						}
					}
					else if (TournamentArray[2] == BlueValue)
					{
						if (!IsBlueWin)
						{
							PlayerPrefs.SetInt("BlueNewCount", 1);
						}
					}
					else if (TournamentArray[2] == GreenValue)
					{
						if (!IsGreenWin)
						{
							PlayerPrefs.SetInt("GreenNewCount", 1);
						}
					}
					else if (TournamentArray[2] == YellowValue && !IsYellowWin)
					{
						PlayerPrefs.SetInt("YellowNewCount", 1);
					}
					if (TournamentArray[3] == RedValue)
					{
						if (!IsRedWin)
						{
							PlayerPrefs.SetInt("RedNewCount", 0);
						}
					}
					else if (TournamentArray[3] == BlueValue)
					{
						if (!IsBlueWin)
						{
							PlayerPrefs.SetInt("BlueNewCount", 0);
						}
					}
					else if (TournamentArray[3] == GreenValue)
					{
						if (!IsGreenWin)
						{
							PlayerPrefs.SetInt("GreenNewCount", 0);
						}
					}
					else if (TournamentArray[3] == YellowValue && !IsYellowWin)
					{
						PlayerPrefs.SetInt("YellowNewCount", 0);
					}
				}
			}
			else
			{
				GameOverTie.SetActive(value: true);
				PlayerPrefs.SetInt("RedNewCount", 0);
				PlayerPrefs.SetInt("BlueNewCount", 0);
				PlayerPrefs.SetInt("GreenNewCount", 0);
				PlayerPrefs.SetInt("YellowNewCount", 0);
			}
		}
		GameObject[] activePlayers = ActivePlayers;
		for (int j = 0; j < activePlayers.Length; j++)
		{
			activePlayers[j].GetComponent<SeaBattlePlayer>().IsSMove = false;
		}
		if (PlayerPrefs.GetInt("IsCups") == 0)
		{
			Invoke("GetButtons", 2f);
		}
		else if (PlayerPrefs.GetInt("IsCups") == 1)
		{
			Invoke("GetCount", 3f);
		}
		SA.ShowInter();
	}

	private void GetButtons()
	{
		GameOverButtons.SetActive(value: true);
	}

	private void GetCount()
	{
		SceneManager.LoadScene("TournamentScene");
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

	public void AddRedPoint()
	{
		ColorCount[0]++;
	}

	public void AddBluePoint()
	{
		ColorCount[1]++;
	}

	public void AddGreenPoint()
	{
		ColorCount[2]++;
	}

	public void AddYellowPoint()
	{
		ColorCount[3]++;
	}

	public void DeleteRedPoint()
	{
		ColorCount[0]--;
	}

	public void DeleteBluePoint()
	{
		ColorCount[1]--;
	}

	public void DeleteGreenPoint()
	{
		ColorCount[2]--;
	}

	public void DeleteYellowPoint()
	{
		ColorCount[3]--;
	}
}
