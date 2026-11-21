using UnityEngine;
using UnityEngine.SceneManagement;
using EasyMobile;
public class MenuController : MonoBehaviour
{
	private bool IsSoccer;

	public GameObject[] Cam;

	public GameObject BotsCam;

	private int GameNum;

	private bool needMap;

	public AudioClip ButtonSound;

	public AudioClip ButtonBack;

	private AudioSource Source;

	private string LevelName = "";

	public GameObject[] GameModeRaceNo;

	public GameObject[] GameModeRaceYes;

	public GameObject[] GameModeTankNo;

	public GameObject[] GameModeTankYes;

	public GameObject[] TankMaps;

	private int Tournament;

	public GameObject[] VSButton;

	public GameObject VSblackButton;

	public GameObject RandomCamera;

	public GameObject RandomTanksCamera;

	public GameObject BigTournamentCamera;

	public GameObject VSTournamentCamera;

	private void Awake()
	{
		PlayerPrefs.DeleteKey("NeedBot");
		PlayerPrefs.DeleteKey("PlayerNumers");
		PlayerPrefs.DeleteKey("GameMode");
		PlayerPrefs.DeleteKey("RedPlayerCount");
		PlayerPrefs.DeleteKey("BluePlayerCount");
		PlayerPrefs.DeleteKey("GreenPlayerCount");
		PlayerPrefs.DeleteKey("YellowPlayerCount");
		PlayerPrefs.DeleteKey("RedNewCount");
		PlayerPrefs.DeleteKey("BlueNewCount");
		PlayerPrefs.DeleteKey("GreenNewCount");
		PlayerPrefs.DeleteKey("YellowNewCount");
		PlayerPrefs.DeleteKey("IsBigTournament");
		PlayerPrefs.DeleteKey("TournamentLevelCount");
		PlayerPrefs.DeleteKey("IsCups");
		Source = GetComponent<AudioSource>();
	}

	private void Start()
	{
        bool isReady = AdManager.IsInterstitialAdReady();
        if (isReady)
        {
           AdManager.ShowInterstitialAd();
        }
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(true);
		}
	}

	public void StickmanRun()
	{
		needMap = true;
		GameNum = 2;
		Source.PlayOneShot(ButtonSound);
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(false);
			Cam[1].SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		ApplovineAdsManager.Instance.showinter();
	}

	public void TankGameButton()
	{
		needMap = true;
		GameNum = 3;
		Source.PlayOneShot(ButtonSound);
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(false);
			Cam[1].SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		ApplovineAdsManager.Instance.showinter();
	}

	public void RaceGameButton()
	{
		needMap = true;
		GameNum = 4;
		Source.PlayOneShot(ButtonSound);
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(false);
			Cam[1].SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		ApplovineAdsManager.Instance.showinter();
	}

	public void SoccerGameButton()
	{
		IsSoccer = true;
		needMap = false;
		Source.PlayOneShot(ButtonSound);
		LevelName = "Soccer";
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(false);
			Cam[1].SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		ApplovineAdsManager.Instance.showinter();
	}

	public void SumoGameButton()
	{
		needMap = false;
		Source.PlayOneShot(ButtonSound);
		LevelName = "Sumo";
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(false);
			Cam[1].SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		ApplovineAdsManager.Instance.showinter();
	}

	public void SeaBattleGameButton()
	{
		needMap = false;
		Source.PlayOneShot(ButtonSound);
		LevelName = "SeaBattle";
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(false);
			Cam[1].SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		ApplovineAdsManager.Instance.showinter();
	}

	public void GhostGameButton()
	{
		needMap = false;
		Source.PlayOneShot(ButtonSound);
		LevelName = "Ghost";
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(false);
			Cam[1].SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		ApplovineAdsManager.Instance.showinter();
	}

	public void BumperGameButton()
	{
		needMap = false;
		Source.PlayOneShot(ButtonSound);
		LevelName = "Bumpercar";
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(false);
			Cam[1].SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		ApplovineAdsManager.Instance.showinter();
	}

	public void ColorGameButton()
	{
		needMap = false;
		Source.PlayOneShot(ButtonSound);
		LevelName = "ColorDash";
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(false);
			Cam[1].SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		ApplovineAdsManager.Instance.showinter();
	}

	public void BoxGameButton()
	{
		needMap = false;
		Source.PlayOneShot(ButtonSound);
		LevelName = "BoxGame";
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(false);
			Cam[1].SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		ApplovineAdsManager.Instance.showinter();
	}

	public void BackToMainMenu()
	{
		Source.PlayOneShot(ButtonBack);
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(true);
			Cam[1].SetActive(false);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		PlayerPrefs.SetInt("Tournament", 0);
		PlayerPrefs.SetInt("NeedBot", 0);
		IsSoccer = false;
	}

	public void BackToPlayers()
	{
		Source.PlayOneShot(ButtonSound);
		GameModeRaceNo[0].SetActive(false);
		GameModeRaceYes[0].SetActive(true);
		GameModeRaceNo[1].SetActive(true);
		GameModeRaceYes[1].SetActive(false);
		PlayerPrefs.SetInt("GameMode", 0);
		IsSoccer = false;
		Source.PlayOneShot(ButtonBack);
		Cam[1].SetActive(true);
		Cam[GameNum].SetActive(false);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		PlayerPrefs.SetInt("NeedBot", 0);
	}

	public void GameMode1Race()
	{
		Source.PlayOneShot(ButtonSound);
		GameModeRaceNo[0].SetActive(false);
		GameModeRaceYes[0].SetActive(true);
		GameModeRaceNo[1].SetActive(true);
		GameModeRaceYes[1].SetActive(false);
		PlayerPrefs.SetInt("GameMode", 0);
	}

	public void GameMode2Race()
	{
		Source.PlayOneShot(ButtonSound);
		GameModeRaceNo[0].SetActive(true);
		GameModeRaceYes[0].SetActive(false);
		GameModeRaceNo[1].SetActive(false);
		GameModeRaceYes[1].SetActive(true);
		PlayerPrefs.SetInt("GameMode", 1);
	}

	public void GameMode1Tank()
	{
		Source.PlayOneShot(ButtonSound);
		GameModeTankNo[0].SetActive(false);
		GameModeTankYes[0].SetActive(true);
		GameModeTankNo[1].SetActive(true);
		GameModeTankYes[1].SetActive(false);
		GameModeTankNo[2].SetActive(true);
		GameModeTankYes[2].SetActive(false);
		TankMaps[0].SetActive(true);
		TankMaps[1].SetActive(false);
		TankMaps[2].SetActive(false);
	}

	public void GameMode2Tank()
	{
		Source.PlayOneShot(ButtonSound);
		GameModeTankNo[0].SetActive(true);
		GameModeTankYes[0].SetActive(false);
		GameModeTankNo[1].SetActive(false);
		GameModeTankYes[1].SetActive(true);
		GameModeTankNo[2].SetActive(true);
		GameModeTankYes[2].SetActive(false);
		TankMaps[2].SetActive(true);
		TankMaps[0].SetActive(false);
		TankMaps[1].SetActive(false);
	}

	public void GameMode3Tank()
	{
		Source.PlayOneShot(ButtonSound);
		GameModeTankNo[0].SetActive(true);
		GameModeTankYes[0].SetActive(false);
		GameModeTankNo[1].SetActive(true);
		GameModeTankYes[1].SetActive(false);
		GameModeTankNo[2].SetActive(false);
		GameModeTankYes[2].SetActive(true);
		TankMaps[1].SetActive(true);
		TankMaps[0].SetActive(false);
		TankMaps[2].SetActive(false);
	}

	public void Player1()
	{
		Source.PlayOneShot(ButtonSound);
		PlayerPrefs.SetInt("PlayerNumers", 1);
		if (needMap)
		{
			Cam[1].SetActive(false);
			Cam[GameNum].SetActive(true);
		}
		else if (!needMap)
		{
			SceneManager.LoadScene(LevelName);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		VSblackButton.SetActive(true);
		GameObject[] vSButton = VSButton;
		for (int i = 0; i < vSButton.Length; i++)
		{
			vSButton[i].SetActive(false);
		}
	}

	public void Player2()
	{
		Source.PlayOneShot(ButtonSound);
		PlayerPrefs.SetInt("PlayerNumers", 2);
		if (!IsSoccer)
		{
			Cam[1].SetActive(false);
			BotsCam.SetActive(true);
		}
		else
		{
			SceneManager.LoadScene(LevelName);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		VSblackButton.SetActive(true);
		GameObject[] vSButton = VSButton;
		for (int i = 0; i < vSButton.Length; i++)
		{
			vSButton[i].SetActive(false);
		}
	}

	public void Player3()
	{
		Source.PlayOneShot(ButtonSound);
		PlayerPrefs.SetInt("PlayerNumers", 3);
		if (!IsSoccer)
		{
			Cam[1].SetActive(false);
			BotsCam.SetActive(true);
		}
		else
		{
			SceneManager.LoadScene(LevelName);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		VSblackButton.SetActive(true);
		GameObject[] vSButton = VSButton;
		for (int i = 0; i < vSButton.Length; i++)
		{
			vSButton[i].SetActive(false);
		}
	}

	public void Player4()
	{
		Source.PlayOneShot(ButtonSound);
		PlayerPrefs.SetInt("PlayerNumers", 4);
		if (needMap)
		{
			Cam[1].SetActive(false);
			Cam[GameNum].SetActive(true);
		}
		else if (!needMap)
		{
			SceneManager.LoadScene(LevelName);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		VSblackButton.SetActive(false);
		GameObject[] vSButton = VSButton;
		for (int i = 0; i < vSButton.Length; i++)
		{
			vSButton[i].SetActive(true);
		}
	}

	public void NeedBotYes()
	{
		Source.PlayOneShot(ButtonSound);
		PlayerPrefs.SetInt("NeedBot", 1);
		if (needMap)
		{
			BotsCam.SetActive(false);
			Cam[GameNum].SetActive(true);
		}
		else if (!needMap)
		{
			SceneManager.LoadScene(LevelName);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void NeedBotNo()
	{
		Source.PlayOneShot(ButtonSound);
		PlayerPrefs.SetInt("NeedBot", 0);
		if (needMap)
		{
			BotsCam.SetActive(false);
			Cam[GameNum].SetActive(true);
		}
		else if (!needMap)
		{
			SceneManager.LoadScene(LevelName);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void RunMap1()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("SampleScene");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void RunMap2()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("RunMap2");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void RunMap3()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("RunMap3");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void RunMap4()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("RunMap4");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButtonDeath1()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("TankDeathmatch1");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButtonDeath2()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("TankDeathmatch2");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButtonFlag1()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("TankFlag1");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButtonFlag2()
	{
		Source.PlayOneShot(ButtonSound);

		SceneManager.LoadScene("TankFlag2");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButtonFlag3()
	{
		Source.PlayOneShot(ButtonSound);

		SceneManager.LoadScene("TankFlag3");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButton1()
	{
		Source.PlayOneShot(ButtonSound);

		SceneManager.LoadScene("TankMap1");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButton2()
	{
		Source.PlayOneShot(ButtonSound);

		SceneManager.LoadScene("TankMap2");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButton3()
	{
		Source.PlayOneShot(ButtonSound);

		SceneManager.LoadScene("TankMap3");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButton4()
	{
		Source.PlayOneShot(ButtonSound);

		SceneManager.LoadScene("TankMap4");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButton5()
	{
		Source.PlayOneShot(ButtonSound);

		SceneManager.LoadScene("TankMap5");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButton6()
	{
		Source.PlayOneShot(ButtonSound);

		SceneManager.LoadScene("TankMap6");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButton7()
	{
		Source.PlayOneShot(ButtonSound);

		SceneManager.LoadScene("TankMap7");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TankButton8()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("TankMap8");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void RaceButton1()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("RaceMap1");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void RaceButton2()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("RaceMap2");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void RaceButton3()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("RaceMap3");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void RaceButton4()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("RaceMap4");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void RaceButton5()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("RaceMap5");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void RaceButton6()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene("RaceMap6");
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TournamentButton()
	{
		needMap = true;
		GameNum = 5;
		Source.PlayOneShot(ButtonSound);
		if (Cam.Length != 0)
		{
			Cam[0].SetActive(false);
			Cam[1].SetActive(true);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
		PlayerPrefs.SetInt("Tournament", 1);
	}

	public void TournamentRandom()
	{
		Source.PlayOneShot(ButtonSound);
		Cam[5].SetActive(false);
		RandomCamera.SetActive(true);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TournamentTanksRandom()
	{
		Source.PlayOneShot(ButtonSound);
		Cam[5].SetActive(false);
		RandomTanksCamera.SetActive(true);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TournamentBigButton()
	{
		Source.PlayOneShot(ButtonSound);
		Cam[5].SetActive(false);
		BigTournamentCamera.SetActive(true);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void BackToTournaments()
	{
		Source.PlayOneShot(ButtonBack);
		if (Cam.Length != 0)
		{
			Cam[5].SetActive(true);
			BigTournamentCamera.SetActive(false);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void TournamentVSButton()
	{
		Source.PlayOneShot(ButtonSound);
		Cam[5].SetActive(false);
		VSTournamentCamera.SetActive(true);
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}

	public void BackToTournamentsVS()
	{
		Source.PlayOneShot(ButtonBack);
		if (Cam.Length != 0)
		{
			Cam[5].SetActive(true);
			VSTournamentCamera.SetActive(false);
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerSelection();
		}
	}
}
