using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class BoxGameController : MonoBehaviour
{
	public int[] TournamentArray;

	private bool IsRedWin;

	private bool IsBlueWin;

	private bool IsGreenWin;

	private bool IsYellowWin;

	private float PressTimer;

	public GameObject[] BoxLight;

	public bool PressButton;

	public int PressCount;

	public AudioClip CoinSound;

	public AudioClip BombSound;

	public GameObject[] Img;

	public GameObject TextPrefab;

	private int BlockCount;

	private bool IsBomb;

	public Animation Anim;

	private int WinValue;

	public ShowAds SA;

	public int[] ColorCount = new int[4];

	private float time = 40f;

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

	private int PlayerNumers;

	private GameObject[] ActivePlayers;

	private int RedValue;

	private int BlueValue;

	private int GreenValue;

	private int YellowValue;

	private string PlayerName;

	private bool IsGameOver;

	private int NeedBot;

	private void Awake()
	{
		PlayerNumers = PlayerPrefs.GetInt("PlayerNumers");
		NeedBot = PlayerPrefs.GetInt("NeedBot");
	}

	private void Start()
	{
		SA = Camera.main.GetComponent<ShowAds>();
		PressButton = true;
		if (PlayerNumers == 1)
		{
			Player[0].SetActive(value: true);
			Player[1].SetActive(value: true);
			Player[2].SetActive(value: true);
			Player[3].SetActive(value: true);
			Player[1].GetComponent<Boxplayer>().IsAIPlayer = true;
			Player[2].GetComponent<Boxplayer>().IsAIPlayer = true;
			Player[3].GetComponent<Boxplayer>().IsAIPlayer = true;
		}
		if (PlayerNumers == 2)
		{
			if (NeedBot == 1)
			{
				Player[0].SetActive(value: true);
				Player[1].SetActive(value: true);
				Player[2].SetActive(value: true);
				Player[3].SetActive(value: true);
				Player[2].GetComponent<Boxplayer>().IsAIPlayer = true;
				Player[3].GetComponent<Boxplayer>().IsAIPlayer = true;
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
				Player[3].SetActive(value: true);
				Player[3].GetComponent<Boxplayer>().IsAIPlayer = true;
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
			GameObject[] player = Player;
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
			activePlayers[i].GetComponent<Boxplayer>().IsMove = true;
		}
		StartCoundownTimer();
		PressButton = false;
	}

	private void StartCoundownTimer()
	{
		time = 40f;
		Text[] timerText = TimerText;
		for (int i = 0; i < timerText.Length; i++)
		{
			timerText[i].text = "00:40";
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

	private void Update()
	{
		//AdsManager.Instance.HideBanner();
		AdsManager.Instance.HideBanner();
		PressTimer += Time.deltaTime;
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
		if (IsStart && !PressButton && PressTimer >= 0.2f)
		{
			switch (UnityEngine.Random.Range(1, 6))
			{
			case 1:
				Img[0].SetActive(value: true);
				Img[1].SetActive(value: false);
				Img[2].SetActive(value: false);
				Img[3].SetActive(value: false);
				Img[4].SetActive(value: false);
				BlockCount = 1;
				IsBomb = false;
				break;
			case 2:
				Img[0].SetActive(value: false);
				Img[1].SetActive(value: true);
				Img[2].SetActive(value: false);
				Img[3].SetActive(value: false);
				Img[4].SetActive(value: false);
				BlockCount = 2;
				IsBomb = false;
				break;
			case 3:
				Img[0].SetActive(value: false);
				Img[1].SetActive(value: false);
				Img[2].SetActive(value: true);
				Img[3].SetActive(value: false);
				Img[4].SetActive(value: false);
				BlockCount = 3;
				IsBomb = false;
				break;
			case 4:
				Img[0].SetActive(value: false);
				Img[1].SetActive(value: false);
				Img[2].SetActive(value: false);
				Img[3].SetActive(value: true);
				Img[4].SetActive(value: false);
				BlockCount = 5;
				IsBomb = false;
				break;
			case 5:
				Img[0].SetActive(value: false);
				Img[1].SetActive(value: false);
				Img[2].SetActive(value: false);
				Img[3].SetActive(value: false);
				Img[4].SetActive(value: true);
				BlockCount = -5;
				IsBomb = true;
				break;
			}
			PressTimer = 0f;
		}
		RedValue = ColorCount[0];
		BlueValue = ColorCount[1];
		GreenValue = ColorCount[2];
		YellowValue = ColorCount[3];
	}

	public void GameOver()
	{
		IsGameOver = true;
		IsStart = false;
		GameOverPanel.SetActive(value: true);
		BGMusic.SetActive(value: false);
		GameAnalytic.AddProgression(new LevelProgression()
		{

			state = ProgressionStatus.Completed,
			v_LevelName = "Level Box Game"

		});
		AdsManager.Instance.ShowIntersitial(() => { Debug.Log("intersitial worked"); });
		//GameOverPanel.SetActive(value: true);
		BGMusic.SetActive(value: false);
		int num = Mathf.Max(ColorCount);
		for (int i = 0; i < ColorCount.Length; i++)
		{
			if (num != 0)
			{
				if (ColorCount[i] != num)
				{
					continue;
				}
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
				if (PlayerPrefs.GetInt("IsCups") == 1)
				{
					PlayerPrefs.SetInt("RedNewCount", 0);
					PlayerPrefs.SetInt("BlueNewCount", 0);
					PlayerPrefs.SetInt("GreenNewCount", 0);
					PlayerPrefs.SetInt("YellowNewCount", 0);
				}
			}
		}
		if (PlayerPrefs.GetInt("IsCups") == 0)
		{
			Invoke("GetButtons", 2f);
		}
		else if (PlayerPrefs.GetInt("IsCups") == 1)
		{
			Invoke("GetCount", 3f);
		}
		GameObject[] activePlayers = ActivePlayers;
		for (int j = 0; j < activePlayers.Length; j++)
		{
			activePlayers[j].GetComponent<Boxplayer>().IsMove = false;
		}
		//SA.ShowInter();
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

	public void BoxButton()
	{
		if (!PressButton)
		{
			Anim.Play("MisteryBoxAnimation");
			if (!IsBomb)
			{
				Source.PlayOneShot(CoinSound);
			}
			else
			{
				Source.PlayOneShot(BombSound);
			}
			Text component = UnityEngine.Object.Instantiate(TextPrefab, base.transform.position, base.transform.rotation).transform.Find("Text").GetComponent<Text>();
			if (!IsBomb)
			{
				component.text = "+" + BlockCount;
			}
			else
			{
				component.text = string.Concat(BlockCount);
			}
			if (PressCount == 0)
			{
				BoxLight[0].SetActive(value: true);
				ColorCount[0] += BlockCount;
			}
			else if (PressCount == 1)
			{
				BoxLight[1].SetActive(value: true);
				ColorCount[1] += BlockCount;
			}
			else if (PressCount == 2)
			{
				BoxLight[2].SetActive(value: true);
				ColorCount[2] += BlockCount;
			}
			else if (PressCount == 3)
			{
				BoxLight[3].SetActive(value: true);
				ColorCount[3] += BlockCount;
			}
			Invoke("BoxPlay", 0.8f);
			PressButton = true;
		}
	}

	private void BoxPlay()
	{
		GameObject[] boxLight = BoxLight;
		for (int i = 0; i < boxLight.Length; i++)
		{
			boxLight[i].SetActive(value: false);
		}
		PressButton = false;
		PressTimer = 0.2f;
	}

	private void FixedUpdate()
	{
		ColorText[0].text = string.Concat(ColorCount[0]);
		ColorText[1].text = string.Concat(ColorCount[1]);
		ColorText[2].text = string.Concat(ColorCount[2]);
		ColorText[3].text = string.Concat(ColorCount[3]);
	}
}
