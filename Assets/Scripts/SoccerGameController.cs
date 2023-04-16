using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SoccerGameController : MonoBehaviour
{
	public ShowAds SA;

	public GameObject[] GoalAnimation;

	public int RedGoals;

	public int BlueGoals;

	private float time = 120f;

	public Text[] TimerText;

	public Text[] RedGoalsText;

	public Text[] BlueGoalsText;

	public Transform[] Gametransform;

	public GameObject BallObject;

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

	public AudioClip GoalSound;

	public AudioClip ReferiSound;

	public AudioClip TimerSound;

	private float CountDownSoundTimer = 2f;

	private AudioSource Source;

	public GameObject[] Player;

	public GameObject[] JoystickObject;

	private int PlayerNumers;

	private GameObject[] ActivePlayers;

	private string PlayerName;

	private bool IsGameOver;

	public int ActiveP;

	private int NeedBot;

	public GameObject AiPlayer;

	private void Awake()
	{
		PlayerNumers = PlayerPrefs.GetInt("PlayerNumers");
		NeedBot = PlayerPrefs.GetInt("NeedBot");
	}

	private void Start()
	{
		//SA = Camera.main.GetComponent<ShowAds>();
		RedGoals = 0;
		BlueGoals = 0;
		if (PlayerNumers == 1)
		{
			Player[0].SetActive(value: true);
			AiPlayer.GetComponent<SoccerPlayer>().IsAIPlayer = true;
			AiPlayer.SetActive(value: true);
			JoystickObject[0].SetActive(value: true);
		}
		else if (PlayerNumers == 2)
		{
			Player[0].SetActive(value: true);
			Player[1].SetActive(value: true);
			JoystickObject[0].SetActive(value: true);
			JoystickObject[1].SetActive(value: true);
		}
		else if (PlayerNumers == 3)
		{
			Player[0].SetActive(value: true);
			Player[1].SetActive(value: true);
			Player[2].SetActive(value: true);
			JoystickObject[0].SetActive(value: true);
			JoystickObject[1].SetActive(value: true);
			JoystickObject[2].SetActive(value: true);
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
		ActiveP = ActivePlayers.Length;
		SetTransform();
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
			activePlayers[i].GetComponent<SoccerPlayer>().IsSMove = true;
		}
		Invoke("Referi", 0.5f);
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

	private void Update()
	{
		ApplovineAdsManager.Instance.hideBanner();
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

	private void Referi()
	{
		Source.volume = 0.8f;
		Source.PlayOneShot(ReferiSound);
	}

	public void RedGoal()
	{
		Source.volume = 0.45f;
		Source.PlayOneShot(GoalSound);
		GoalAnimation[0].SetActive(value: true);
		RedGoals++;
		Text[] redGoalsText = RedGoalsText;
		for (int i = 0; i < redGoalsText.Length; i++)
		{
			redGoalsText[i].text = string.Concat(RedGoals);
		}
		BallObject.SetActive(value: false);
		if (RedGoals < 3)
		{
			Invoke("SetTransform", 2.5f);
			Invoke("Referi", 2.7f);
		}
		else
		{
			GameOver();
		}
	}

	public void BlueGoal()
	{
		Source.volume = 0.45f;
		Source.PlayOneShot(GoalSound);
		GoalAnimation[1].SetActive(value: true);
		BlueGoals++;
		Text[] blueGoalsText = BlueGoalsText;
		for (int i = 0; i < blueGoalsText.Length; i++)
		{
			blueGoalsText[i].text = string.Concat(BlueGoals);
		}
		BallObject.SetActive(value: false);
		if (BlueGoals < 3)
		{
			Invoke("SetTransform", 2.5f);
			Invoke("Referi", 2.7f);
		}
		else
		{
			GameOver();
		}
	}

	public void GameOver()
	{
		IsGameOver = true;
		GameAnalytic.AddProgression(new LevelProgression()
		{

			state = ProgressionStatus.Completed,
			v_LevelName = "Level Soccer Game"

		});
		//GameOverPanel.SetActive(value: true);
		BGMusic.SetActive(value: false);
		ApplovineAdsManager.Instance.showinter();
		if (PlayerPrefs.GetInt("IsCups") == 0)
		{
			Invoke("GetButtons", 2f);
		}
		else if (PlayerPrefs.GetInt("IsCups") == 1)
		{
			Invoke("GetCount", 3f);
		}
		if (RedGoals > BlueGoals)
		{
			WinObject[0].SetActive(value: true);
			if (ActivePlayers.Length != 4)
			{
				return;
			}
			WinObject[3].SetActive(value: true);
			if (PlayerPrefs.GetInt("IsCups") == 1)
			{
				PlayerPrefs.SetInt("RedNewCount", 3);
				PlayerPrefs.SetInt("BlueNewCount", 0);
			}
		}
		else if (RedGoals < BlueGoals)
		{
			WinObject[1].SetActive(value: true);
			if (ActivePlayers.Length < 3)
			{
				return;
			}
			WinObject[2].SetActive(value: true);
			if (PlayerPrefs.GetInt("IsCups") == 1)
			{
				PlayerPrefs.SetInt("BlueNewCount", 3);
				PlayerPrefs.SetInt("RedNewCount", 0);
			}
		}
		else if (RedGoals == BlueGoals)
		{
			GameOverTie.SetActive(value: true);
		}
		GameObject[] activePlayers = ActivePlayers;
		for (int i = 0; i < activePlayers.Length; i++)
		{
			activePlayers[i].GetComponent<SoccerPlayer>().IsSMove = false;
		}
		//SA.ShowInter();
	}

	private void GetCount()
	{
		SceneManager.LoadScene("TournamentSceneVS");
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

	private void SetTransform()
	{
		Player[0].transform.position = Gametransform[0].transform.position;
		Player[1].transform.position = Gametransform[1].transform.position;
		AiPlayer.transform.position = Gametransform[1].transform.position;
		Player[2].transform.position = Gametransform[2].transform.position;
		Player[3].transform.position = Gametransform[3].transform.position;
		BallObject.transform.position = Gametransform[4].transform.position;
		GoalAnimation[0].SetActive(value: false);
		GoalAnimation[1].SetActive(value: false);
		BallObject.SetActive(value: true);
	}
}
