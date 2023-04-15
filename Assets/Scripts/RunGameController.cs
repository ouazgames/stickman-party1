using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class RunGameController : MonoBehaviour
{
	private bool IsRedWin;

	private bool IsBlueWin;

	private bool IsGreenWin;

	private bool IsYellowWin;

	public int TournamentPlayerNumers;

	public int TournamentPlayerCount;

	public ShowAds SA;

	public GameObject BGMusic;

	public GameObject GameOverPanel;

	public GameObject[] WinObject;

	public GameObject GameOverButtons;

	public GameObject GameOverTie;

	public GameObject TimerAnimation;

	public FreeParallax[] FP;

	private bool IsStart;

	private bool IsSMove;

	public float Movespeed;

	public AudioClip ButtonSound;

	public AudioClip Sound3;

	public AudioClip Sound2;

	public AudioClip Sound1;

	public AudioClip SoundGo;

	private AudioSource Source;

	public GameObject StartLaval;

	public GameObject[] Player;

	public Animation[] Anim;

	private List<Animation> AnimList;

	public Vector3 StartPos;

	public Vector3 EndPos;

	private int PlayerNumers;

	public List<GameObject> Players;

	public int ListNumber;

	private GameObject[] ActivePlayers;

	private bool IsGameOver;

	public string FinishName;

	private List<string> names = new List<string>();

	public List<string> NamesLuser = new List<string>();

	public List<string> NamesWinner = new List<string>();

	private int NeedBot;

	private void Awake()
	{
		PlayerNumers = PlayerPrefs.GetInt("PlayerNumers");
		AnimList = new List<Animation>(Anim);
		NeedBot = PlayerPrefs.GetInt("NeedBot");
	}

	private void Start()
	{
		SA = Camera.main.GetComponent<ShowAds>();
		if (PlayerNumers == 1)
		{
			Player[0].SetActive(value: true);
			Player[1].SetActive(value: true);
			Player[1].GetComponent<PlayerScript>().IsAIPlayer = true;
			Player[2].SetActive(value: true);
			Player[2].GetComponent<PlayerScript>().IsAIPlayer = true;
			Player[3].SetActive(value: true);
			Player[3].GetComponent<PlayerScript>().IsAIPlayer = true;
		}
		else if (PlayerNumers == 2)
		{
			if (NeedBot == 1)
			{
				Player[0].SetActive(value: true);
				Player[1].SetActive(value: true);
				Player[2].SetActive(value: true);
				Player[2].GetComponent<PlayerScript>().IsAIPlayer = true;
				Player[3].SetActive(value: true);
				Player[3].GetComponent<PlayerScript>().IsAIPlayer = true;
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
				Player[3].GetComponent<PlayerScript>().IsAIPlayer = true;
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
		base.transform.position = StartPos;
		Source = GetComponent<AudioSource>();
		Invoke("StartAnimation", 0.5f);
		Invoke("StartGame", 1.2f);
		Invoke("MoveCamera", 1.7f);
		foreach (Animation anim in AnimList)
		{
			anim.Play("StayAnim");
		}
		ActivePlayers = GameObject.FindGameObjectsWithTag("Player");
		TournamentPlayerNumers = ActivePlayers.Length;
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
		IsSMove = true;
		StartLaval.SetActive(value: false);
		Animation[] anim = Anim;
		for (int i = 0; i < anim.Length; i++)
		{
			anim[i].Play("RunAnimation");
		}
		GameObject[] player = Player;
		for (int i = 0; i < player.Length; i++)
		{
			player[i].GetComponent<PlayerScript>().IsSMove = true;
		}
	}

	private void MoveCamera()
	{
		IsStart = true;
		FP[0].Speed = 3.5f;
		FP[1].Speed = 3f;
	}

	private void Update()
	{
		if (IsStart)
		{
			Players.RemoveAll((GameObject item) => item == null);
			ListNumber = Players.Count;
			if (base.transform.position.x < EndPos.x)
			{
				base.transform.position += base.transform.right * Movespeed * Time.deltaTime;
			}
			else if (base.transform.position.x >= EndPos.x)
			{
				base.transform.position = EndPos;
				FP[0].Speed = -0.5f;
				FP[1].Speed = -0f;
			}
		}
		if (IsStart && ListNumber <= 1 && !IsGameOver)
		{
			FP[0].Speed = -0.5f;
			FP[1].Speed = -0f;
			TournamentPlayerCount++;
			IGameOver();
			IsStart = false;
			IsGameOver = true;
		}
		if (names.Count > 0 && !IsGameOver)
		{
			GetFinish();
			IsGameOver = true;
		}
	}

	private void FixedUpdate()
	{
		TournamentCount();
	}

	public void IGameOver()
	{
		if (PlayerPrefs.GetInt("IsCups") != 0)
		{
			return;
		}
		GameOverPanel.SetActive(value: true);
		BGMusic.SetActive(value: false);
		Invoke("GetButtons", 2f);
		if (ListNumber == 1)
		{
			string name = Players[0].name;
			if (name == "PlayerRed")
			{
				WinObject[0].SetActive(value: true);
			}
			else if (name == "PlayerBlue")
			{
				WinObject[1].SetActive(value: true);
			}
			else if (name == "PlayerGreen")
			{
				WinObject[2].SetActive(value: true);
			}
			else if (name == "PlayerYellow")
			{
				WinObject[3].SetActive(value: true);
			}
			AnimList.RemoveAll((Animation item) => item == null);
			AnimList[0].Play("StayAnim");
			Players[0].GetComponent<PlayerScript>().IsSMove = false;
		}
		else if (ListNumber == 0)
		{
			GameOverTie.SetActive(value: true);
		}
		SA.ShowInter();
	}

	private void TournamentCount()
	{
		if (TournamentPlayerCount != TournamentPlayerNumers)
		{
			return;
		}
		SA.ShowInter();
		GameOverPanel.SetActive(value: true);
		BGMusic.SetActive(value: false);
		Invoke("GetCount", 3f);
		string text = "";
		text = ((NamesWinner.Count <= 0) ? Players[0].name : NamesWinner[0]);
		if (text == "PlayerRed")
		{
			WinObject[0].SetActive(value: true);
			PlayerPrefs.SetInt("RedNewCount", 3);
			IsRedWin = true;
		}
		else if (text == "PlayerBlue")
		{
			WinObject[1].SetActive(value: true);
			PlayerPrefs.SetInt("BlueNewCount", 3);
			IsBlueWin = true;
		}
		else if (text == "PlayerGreen")
		{
			WinObject[2].SetActive(value: true);
			PlayerPrefs.SetInt("GreenNewCount", 3);
			IsGreenWin = true;
		}
		else if (text == "PlayerYellow")
		{
			WinObject[3].SetActive(value: true);
			PlayerPrefs.SetInt("YellowNewCount", 3);
			IsYellowWin = true;
		}
		AnimList.RemoveAll((Animation item) => item == null);
		if (Players[0] != null)
		{
			AnimList[0].Play("StayAnim");
			Players[0].GetComponent<PlayerScript>().IsSMove = false;
		}
		if (NamesLuser.Count == 1)
		{
			if (NamesLuser[0] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 0);
			}
		}
		else if (NamesLuser.Count == 2)
		{
			if (NamesLuser[0] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 0);
			}
			if (NamesLuser[1] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 1);
				}
			}
			else if (NamesLuser[1] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 1);
				}
			}
			else if (NamesLuser[1] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 1);
				}
			}
			else if (NamesLuser[1] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 1);
			}
		}
		else if (NamesLuser.Count == 3)
		{
			if (NamesLuser[0] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 0);
			}
			if (NamesLuser[1] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 1);
				}
			}
			else if (NamesLuser[1] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 1);
				}
			}
			else if (NamesLuser[1] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 1);
				}
			}
			else if (NamesLuser[1] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 1);
			}
			if (NamesLuser[2] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 2);
				}
			}
			else if (NamesLuser[2] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 2);
				}
			}
			else if (NamesLuser[2] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 2);
				}
			}
			else if (NamesLuser[2] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 2);
			}
		}
		else if (NamesLuser.Count == 4)
		{
			if (NamesLuser[0] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 0);
				}
			}
			else if (NamesLuser[0] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 0);
			}
			if (NamesLuser[1] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 1);
				}
			}
			else if (NamesLuser[1] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 1);
				}
			}
			else if (NamesLuser[1] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 1);
				}
			}
			else if (NamesLuser[1] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 1);
			}
			if (NamesLuser[2] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 2);
				}
			}
			else if (NamesLuser[2] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 2);
				}
			}
			else if (NamesLuser[2] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 2);
				}
			}
			else if (NamesLuser[2] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 2);
			}
			if (NamesLuser[3] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 3);
				}
			}
			else if (NamesLuser[3] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 3);
				}
			}
			else if (NamesLuser[3] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 3);
				}
			}
			else if (NamesLuser[3] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 3);
			}
		}
		if (NamesWinner.Count == 1)
		{
			if (NamesWinner[0] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 3);
			}
		}
		else if (NamesWinner.Count == 2)
		{
			if (NamesWinner[0] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 3);
			}
			if (NamesWinner[1] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 2);
				}
			}
			else if (NamesWinner[1] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 2);
				}
			}
			else if (NamesWinner[1] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 2);
				}
			}
			else if (NamesWinner[1] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 2);
			}
		}
		else if (NamesWinner.Count == 3)
		{
			if (NamesWinner[0] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 3);
			}
			if (NamesWinner[1] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 2);
				}
			}
			else if (NamesWinner[1] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 2);
				}
			}
			else if (NamesWinner[1] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 2);
				}
			}
			else if (NamesWinner[1] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 2);
			}
			if (NamesWinner[2] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 1);
				}
			}
			else if (NamesWinner[2] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 1);
				}
			}
			else if (NamesWinner[2] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 1);
				}
			}
			else if (NamesWinner[2] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 1);
			}
		}
		else
		{
			if (NamesWinner.Count != 4)
			{
				return;
			}
			if (NamesWinner[0] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 3);
				}
			}
			else if (NamesWinner[0] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 3);
			}
			if (NamesWinner[1] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 2);
				}
			}
			else if (NamesWinner[1] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 2);
				}
			}
			else if (NamesWinner[1] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 2);
				}
			}
			else if (NamesWinner[1] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 2);
			}
			if (NamesWinner[2] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 1);
				}
			}
			else if (NamesWinner[2] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 1);
				}
			}
			else if (NamesWinner[2] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 1);
				}
			}
			else if (NamesWinner[2] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 1);
			}
			if (NamesWinner[3] == "PlayerRed")
			{
				if (!IsRedWin)
				{
					PlayerPrefs.SetInt("RedNewCount", 0);
				}
			}
			else if (NamesWinner[3] == "PlayerBlue")
			{
				if (!IsBlueWin)
				{
					PlayerPrefs.SetInt("BlueNewCount", 0);
				}
			}
			else if (NamesWinner[3] == "PlayerGreen")
			{
				if (!IsGreenWin)
				{
					PlayerPrefs.SetInt("GreenNewCount", 0);
				}
			}
			else if (NamesWinner[3] == "PlayerYellow" && !IsYellowWin)
			{
				PlayerPrefs.SetInt("YellowNewCount", 0);
			}
		}
	}

	private void GetFinish()
	{
		if (PlayerPrefs.GetInt("IsCups") != 0)
		{
			return;
		}
		GameOverPanel.SetActive(value: true);
		BGMusic.SetActive(value: false);
		Invoke("GetButtons", 2f);
		Players.RemoveAll((GameObject item) => item == null);
		AnimList.RemoveAll((Animation item) => item == null);
		if (names.Count == 1)
		{
			if (FinishName == "PlayerRed")
			{
				WinObject[0].SetActive(value: true);
			}
			else if (FinishName == "PlayerBlue")
			{
				WinObject[1].SetActive(value: true);
			}
			else if (FinishName == "PlayerGreen")
			{
				WinObject[2].SetActive(value: true);
			}
			else if (FinishName == "PlayerYellow")
			{
				WinObject[3].SetActive(value: true);
			}
			foreach (Animation anim in AnimList)
			{
				anim.Play("StayAnim");
			}
			foreach (GameObject player in Players)
			{
				player.GetComponent<PlayerScript>().IsSMove = false;
			}
		}
		else if (names.Count > 1)
		{
			GameOverTie.SetActive(value: true);
			if (AnimList.Count > 0)
			{
				foreach (Animation anim2 in AnimList)
				{
					anim2.Play("StayAnim");
				}
			}
			if (Players.Count > 0)
			{
				foreach (GameObject player2 in Players)
				{
					player2.GetComponent<PlayerScript>().IsSMove = false;
				}
			}
		}
		SA.ShowInter();
	}

	public void FinishGame()
	{
		IsStart = false;
		names.Add(FinishName);
	}

	public void AddNameLuser(string name)
	{
		NamesLuser.Add(name);
		TournamentPlayerCount++;
	}

	public void AddNameWinner(string name)
	{
		NamesWinner.Add(name);
		TournamentPlayerCount++;
	}

	private void GetCount()
	{
		SceneManager.LoadScene("TournamentScene");
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
}
