using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class RaceGameController : MonoBehaviour
{
    private bool IsRedWin;

    private bool IsBlueWin;

    private bool IsGreenWin;

    private bool IsYellowWin;

    public ShowAds SA;

    public string PlayerName = "";

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

    private AudioSource Source;

    public GameObject[] Player;

    public GameObject[] AIPlayer;

    public GameObject[] PlayerJoystick;

    public List<GameObject> Players;

    private int PlayerNumers;

    public int ListNumber;

    public List<GameObject> ActivePlayers = new List<GameObject>();

    private bool IsGameOver;

    public List<string> Names = new List<string>();

    private int NeedBot;

    public int LastPlayer;

    public GameObject ExplosionPrefab;

    private int NeedPlayersCount;

    private int Counter;

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
            PlayerJoystick[0].SetActive(value: true);
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
                PlayerJoystick[0].SetActive(value: true);
                PlayerJoystick[1].SetActive(value: true);
                AIPlayer[1].SetActive(value: true);
                AIPlayer[2].SetActive(value: true);
            }
            else
            {
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
                PlayerJoystick[0].SetActive(value: true);
                PlayerJoystick[1].SetActive(value: true);
            }
        }
        else if (PlayerNumers == 3)
        {
            if (NeedBot == 1)
            {
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
                Player[2].SetActive(value: true);
                PlayerJoystick[0].SetActive(value: true);
                PlayerJoystick[1].SetActive(value: true);
                PlayerJoystick[2].SetActive(value: true);
                AIPlayer[2].SetActive(value: true);
            }
            else
            {
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
                Player[2].SetActive(value: true);
                PlayerJoystick[0].SetActive(value: true);
                PlayerJoystick[1].SetActive(value: true);
                PlayerJoystick[2].SetActive(value: true);
            }
        }
        else if (PlayerNumers == 4)
        {
            GameObject[] aIPlayer = Player;
            for (int i = 0; i < aIPlayer.Length; i++)
            {
                aIPlayer[i].SetActive(value: true);
            }
            aIPlayer = PlayerJoystick;
            for (int i = 0; i < aIPlayer.Length; i++)
            {
                aIPlayer[i].SetActive(value: true);
            }
        }
        Source = GetComponent<AudioSource>();
        Invoke("StartAnimation", 0.5f);
        Invoke("StartGame", 1.2f);
        GameObject[] collection = GameObject.FindGameObjectsWithTag("Player");
        ActivePlayers = new List<GameObject>(collection);
        if (PlayerPrefs.GetInt("GameMode") == 1)
        {
            Players = new List<GameObject>(ActivePlayers);
            NeedPlayersCount = Players.Count;
        }
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
            ActivePlayers[0].GetComponent<RaceCar>().IsSMove = true;
            ActivePlayers[1].GetComponent<AIcarScript>().IsSMove = true;
            ActivePlayers[2].GetComponent<AIcarScript>().IsSMove = true;
            ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = true;
        }
        else if (PlayerNumers == 2)
        {
            if (NeedBot == 1)
            {
                ActivePlayers[0].GetComponent<RaceCar>().IsSMove = true;
                ActivePlayers[1].GetComponent<RaceCar>().IsSMove = true;
                ActivePlayers[2].GetComponent<AIcarScript>().IsSMove = true;
                ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = true;
            }
            else
            {
                foreach (GameObject activePlayer in ActivePlayers)
                {
                    activePlayer.GetComponent<RaceCar>().IsSMove = true;
                }
            }
        }
        else if (PlayerNumers == 3)
        {
            if (NeedBot == 1)
            {
                ActivePlayers[0].GetComponent<RaceCar>().IsSMove = true;
                ActivePlayers[1].GetComponent<RaceCar>().IsSMove = true;
                ActivePlayers[2].GetComponent<RaceCar>().IsSMove = true;
                ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = true;
            }
            else
            {
                foreach (GameObject activePlayer2 in ActivePlayers)
                {
                    activePlayer2.GetComponent<RaceCar>().IsSMove = true;
                }
            }
        }
        else if (PlayerNumers == 4)
        {
            foreach (GameObject activePlayer3 in ActivePlayers)
            {
                activePlayer3.GetComponent<RaceCar>().IsSMove = true;
            }
        }
    }

    public void CheckPlayer()
    {
        LastPlayer++;
        if (NeedPlayersCount == 4)
        {
            if (LastPlayer + 1 < ActivePlayers.Count)
            {
                for (int i = 0; i < Players.Count; i++)
                {
                    if (Players[i].name == PlayerName)
                    {
                        Players.Remove(Players[i]);
                        Players.RemoveAll((GameObject item) => item == null);
                    }
                }
            }
            else
            {
                if (LastPlayer + 1 < ActivePlayers.Count)
                {
                    return;
                }
                for (int j = 0; j < Players.Count; j++)
                {
                    if (Players[j].name == PlayerName)
                    {
                        Players.Remove(Players[j]);
                    }
                }
                RemovePlayer();
                LastPlayer = 0;
            }
        }
        else if (NeedPlayersCount == 3)
        {
            Counter++;
            if (Counter % 2 == 0)
            {
                NeedPlayersCount--;
            }
            if (LastPlayer + 1 < ActivePlayers.Count)
            {
                for (int k = 0; k < Players.Count; k++)
                {
                    if (Players[k].name == PlayerName)
                    {
                        Players.Remove(Players[k]);
                        Players.RemoveAll((GameObject item) => item == null);
                    }
                }
            }
            else
            {
                if (LastPlayer + 1 < ActivePlayers.Count)
                {
                    return;
                }
                for (int l = 0; l < Players.Count; l++)
                {
                    if (Players[l].name == PlayerName)
                    {
                        Players.Remove(Players[l]);
                    }
                }
                RemovePlayer();
                LastPlayer = 0;
            }
        }
        else if (NeedPlayersCount == 2)
        {
            IGameOver();
        }
    }

    public void RemovePlayer()
    {
        for (int i = 0; i < ActivePlayers.Count; i++)
        {
            if (ActivePlayers[i].name == Players[0].name)
            {
                Object.Instantiate(ExplosionPrefab, ActivePlayers[i].transform.position, ActivePlayers[i].transform.rotation);
                UnityEngine.Object.Destroy(ActivePlayers[i]);
            }
        }
        Players = new List<GameObject>();
        Invoke("ResetList", 0.2f);
    }

    private void ResetList()
    {
        Players = new List<GameObject>(ActivePlayers);
    }

    private void Update()
    {
        AdsManager.Instance.HideBanner();
        ActivePlayers.RemoveAll((GameObject item) => item == null);
        Players.RemoveAll((GameObject item) => item == null);
    }

    public void AddName(string name)
    {
        Names.Add(name);
    }

    public void IGameOver()
    {
        GameAnalytic.AddProgression(new LevelProgression()
        {

            state = ProgressionStatus.Completed,
            v_LevelName = "Level Race Game"

        });
        if (OptionsIntro.Instance.VibrationCheck == 0)
        {
            OptionsIntro.Instance.TriggerVibrate();
        }
        if (PlayerPrefs.GetInt("GameMode") == 1)
        {
            for (int i = 0; i < Players.Count; i++)
            {
                if (Players[i].name == PlayerName)
                {
                    Players.Remove(Players[i]);
                }
            }
            for (int j = 0; j < ActivePlayers.Count; j++)
            {
                if (ActivePlayers[j].name == Players[0].name)
                {
                    Object.Instantiate(ExplosionPrefab, ActivePlayers[j].transform.position, ActivePlayers[j].transform.rotation);
                    UnityEngine.Object.Destroy(ActivePlayers[j]);
                }
            }
            Players = new List<GameObject>();
        }
        if (PlayerPrefs.GetInt("IsCups") == 1)
        {
            if (Names.Count == ActivePlayers.Count)
            {
                if (Names[0] == "PlayerRed")
                {
                    WinObject[0].SetActive(value: true);
                    PlayerPrefs.SetInt("RedNewCount", 3);
                    IsRedWin = true;
                }
                else if (Names[0] == "PlayerBlue")
                {
                    WinObject[1].SetActive(value: true);
                    PlayerPrefs.SetInt("BlueNewCount", 3);
                    IsBlueWin = true;
                }
                else if (Names[0] == "PlayerGreen")
                {
                    WinObject[2].SetActive(value: true);
                    PlayerPrefs.SetInt("GreenNewCount", 3);
                    IsGreenWin = true;
                }
                else if (Names[0] == "PlayerYellow")
                {
                    WinObject[3].SetActive(value: true);
                    PlayerPrefs.SetInt("YellowNewCount", 3);
                    IsYellowWin = true;
                }
                if (PlayerNumers == 1)
                {
                    ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                    ActivePlayers[1].GetComponent<AIcarScript>().IsSMove = false;
                    ActivePlayers[2].GetComponent<AIcarScript>().IsSMove = false;
                    ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                }
                else if (PlayerNumers == 2)
                {
                    if (NeedBot == 1)
                    {
                        ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[1].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[2].GetComponent<AIcarScript>().IsSMove = false;
                        ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                    }
                    else
                    {
                        ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[1].GetComponent<RaceCar>().IsSMove = false;
                    }
                }
                else if (PlayerNumers == 3)
                {
                    if (NeedBot == 1)
                    {
                        ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[1].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[2].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                    }
                    else
                    {
                        ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[1].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[2].GetComponent<RaceCar>().IsSMove = false;
                    }
                }
                else if (PlayerNumers == 4)
                {
                    foreach (GameObject activePlayer in ActivePlayers)
                    {
                        activePlayer.GetComponent<RaceCar>().IsSMove = false;
                    }
                }
                if (PlayerNumers == 1 || PlayerNumers == 4 || (PlayerNumers == 2 && NeedBot == 1) || (PlayerNumers == 3 && NeedBot == 1))
                {
                    if (Names[0] == "PlayerRed")
                    {
                        if (!IsRedWin)
                        {
                            PlayerPrefs.SetInt("RedNewCount", 3);
                        }
                    }
                    else if (Names[0] == "PlayerBlue")
                    {
                        if (!IsBlueWin)
                        {
                            PlayerPrefs.SetInt("BlueNewCount", 3);
                        }
                    }
                    else if (Names[0] == "PlayerGreen")
                    {
                        if (!IsGreenWin)
                        {
                            PlayerPrefs.SetInt("GreenNewCount", 3);
                        }
                    }
                    else if (Names[0] == "PlayerYellow" && !IsYellowWin)
                    {
                        PlayerPrefs.SetInt("YellowNewCount", 3);
                    }
                    if (Names[1] == "PlayerRed")
                    {
                        if (!IsRedWin)
                        {
                            PlayerPrefs.SetInt("RedNewCount", 2);
                        }
                    }
                    else if (Names[1] == "PlayerBlue")
                    {
                        if (!IsBlueWin)
                        {
                            PlayerPrefs.SetInt("BlueNewCount", 2);
                        }
                    }
                    else if (Names[1] == "PlayerGreen")
                    {
                        if (!IsGreenWin)
                        {
                            PlayerPrefs.SetInt("GreenNewCount", 2);
                        }
                    }
                    else if (Names[1] == "PlayerYellow" && !IsYellowWin)
                    {
                        PlayerPrefs.SetInt("YellowNewCount", 2);
                    }
                    if (Names[2] == "PlayerRed")
                    {
                        if (!IsRedWin)
                        {
                            PlayerPrefs.SetInt("RedNewCount", 1);
                        }
                    }
                    else if (Names[2] == "PlayerBlue")
                    {
                        if (!IsBlueWin)
                        {
                            PlayerPrefs.SetInt("BlueNewCount", 1);
                        }
                    }
                    else if (Names[2] == "PlayerGreen")
                    {
                        if (!IsGreenWin)
                        {
                            PlayerPrefs.SetInt("GreenNewCount", 1);
                        }
                    }
                    else if (Names[2] == "PlayerYellow" && !IsYellowWin)
                    {
                        PlayerPrefs.SetInt("YellowNewCount", 1);
                    }
                    if (Names[3] == "PlayerRed")
                    {
                        if (!IsRedWin)
                        {
                            PlayerPrefs.SetInt("RedNewCount", 0);
                        }
                    }
                    else if (Names[3] == "PlayerBlue")
                    {
                        if (!IsBlueWin)
                        {
                            PlayerPrefs.SetInt("BlueNewCount", 0);
                        }
                    }
                    else if (Names[3] == "PlayerGreen")
                    {
                        if (!IsGreenWin)
                        {
                            PlayerPrefs.SetInt("GreenNewCount", 0);
                        }
                    }
                    else if (Names[3] == "PlayerYellow" && !IsYellowWin)
                    {
                        PlayerPrefs.SetInt("YellowNewCount", 0);
                    }
                }
                else if (PlayerNumers == 2)
                {
                    foreach (GameObject activePlayer2 in ActivePlayers)
                    {
                        activePlayer2.GetComponent<RaceCar>().IsSMove = false;
                    }
                    if (Names[0] == "PlayerRed")
                    {
                        if (!IsRedWin)
                        {
                            PlayerPrefs.SetInt("RedNewCount", 3);
                        }
                    }
                    else if (Names[0] == "PlayerBlue" && !IsBlueWin)
                    {
                        PlayerPrefs.SetInt("BlueNewCount", 3);
                    }
                    if (Names[1] == "PlayerRed")
                    {
                        if (!IsRedWin)
                        {
                            PlayerPrefs.SetInt("RedNewCount", 0);
                        }
                    }
                    else if (Names[1] == "PlayerBlue" && !IsBlueWin)
                    {
                        PlayerPrefs.SetInt("BlueNewCount", 0);
                    }
                }
                else if (PlayerNumers == 3)
                {
                    foreach (GameObject activePlayer3 in ActivePlayers)
                    {
                        activePlayer3.GetComponent<RaceCar>().IsSMove = false;
                    }
                    if (Names[0] == "PlayerRed")
                    {
                        if (!IsRedWin)
                        {
                            PlayerPrefs.SetInt("RedNewCount", 3);
                        }
                    }
                    else if (Names[0] == "PlayerBlue")
                    {
                        if (!IsBlueWin)
                        {
                            PlayerPrefs.SetInt("BlueNewCount", 3);
                        }
                    }
                    else if (Names[0] == "PlayerGreen" && !IsGreenWin)
                    {
                        PlayerPrefs.SetInt("GreenNewCount", 3);
                    }
                    if (Names[1] == "PlayerRed")
                    {
                        if (!IsRedWin)
                        {
                            PlayerPrefs.SetInt("RedNewCount", 2);
                        }
                    }
                    else if (Names[1] == "PlayerBlue")
                    {
                        if (!IsBlueWin)
                        {
                            PlayerPrefs.SetInt("BlueNewCount", 2);
                        }
                    }
                    else if (Names[1] == "PlayerGreen" && !IsGreenWin)
                    {
                        PlayerPrefs.SetInt("GreenNewCount", 2);
                    }
                    if (Names[2] == "PlayerRed")
                    {
                        if (!IsRedWin)
                        {
                            PlayerPrefs.SetInt("RedNewCount", 0);
                        }
                    }
                    else if (Names[2] == "PlayerBlue")
                    {
                        if (!IsBlueWin)
                        {
                            PlayerPrefs.SetInt("BlueNewCount", 0);
                        }
                    }
                    else if (Names[2] == "PlayerGreen" && !IsGreenWin)
                    {
                        PlayerPrefs.SetInt("GreenNewCount", 0);
                    }
                }
                //GameOverPanel.SetActive(value: true);
                BGMusic.SetActive(value: false);
                Invoke("GetCount", 3f);
            }
        }
        else if (PlayerPrefs.GetInt("IsCups") == 0)
        {
            ActivateGameOver();
        }
        //SA.ShowInter();
    }

    private void GetCount()
    {
        SceneManager.LoadScene("TournamentScene");
    }

    private void ActivateGameOver()
    {
        if (PlayerName != null)
        {
            for (int i = 0; i < ActivePlayers.Count; i++)
            {
                if (ActivePlayers[i].name == PlayerName)
                {
                    Players.Add(ActivePlayers[i]);
                    ListNumber = Players.Count;
                }
            }
        }
        GameOverPanel.SetActive(value: true);
        BGMusic.SetActive(value: false);
        Invoke("GetButtons", 2f);
        if (ListNumber == 1)
        {
            if (PlayerName == "PlayerRed")
            {
                WinObject[0].SetActive(value: true);
            }
            else if (PlayerName == "PlayerBlue")
            {
                WinObject[1].SetActive(value: true);
            }
            else if (PlayerName == "PlayerGreen")
            {
                WinObject[2].SetActive(value: true);
            }
            else if (PlayerName == "PlayerYellow")
            {
                WinObject[3].SetActive(value: true);
            }
            if (Players.Count == 1)
            {
                if (PlayerPrefs.GetInt("GameMode") == 1)
                {
                    RaceCar component = Players[0].GetComponent<RaceCar>();
                    if (component != null)
                    {
                        component.IsSMove = false;
                    }
                    else
                    {
                        Players[0].GetComponent<AIcarScript>().IsSMove = false;
                    }
                }
                else if (PlayerNumers == 1)
                {
                    ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                    ActivePlayers[1].GetComponent<AIcarScript>().IsSMove = false;
                    ActivePlayers[2].GetComponent<AIcarScript>().IsSMove = false;
                    ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                }
                else if (PlayerNumers == 2)
                {
                    if (NeedBot == 1)
                    {
                        ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[1].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[2].GetComponent<AIcarScript>().IsSMove = false;
                        ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                    }
                    else
                    {
                        foreach (GameObject activePlayer in ActivePlayers)
                        {
                            activePlayer.GetComponent<RaceCar>().IsSMove = false;
                        }
                    }
                }
                else if (PlayerNumers == 3)
                {
                    if (NeedBot == 1)
                    {
                        ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[1].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[2].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                    }
                    else
                    {
                        foreach (GameObject activePlayer2 in ActivePlayers)
                        {
                            activePlayer2.GetComponent<RaceCar>().IsSMove = false;
                        }
                    }
                }
                else if (PlayerNumers == 4)
                {
                    foreach (GameObject activePlayer3 in ActivePlayers)
                    {
                        activePlayer3.GetComponent<RaceCar>().IsSMove = false;
                    }
                }
            }
            else
            {
                if (Players.Count <= 1)
                {
                    return;
                }
                if (PlayerNumers == 1)
                {
                    ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                    ActivePlayers[1].GetComponent<AIcarScript>().IsSMove = false;
                    ActivePlayers[2].GetComponent<AIcarScript>().IsSMove = false;
                    ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                }
                else if (PlayerNumers == 2)
                {
                    if (NeedBot == 1)
                    {
                        ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[1].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[2].GetComponent<AIcarScript>().IsSMove = false;
                        ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                    }
                    else
                    {
                        foreach (GameObject activePlayer4 in ActivePlayers)
                        {
                            activePlayer4.GetComponent<RaceCar>().IsSMove = false;
                        }
                    }
                }
                else if (PlayerNumers == 3)
                {
                    if (NeedBot == 1)
                    {
                        ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[1].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[2].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                    }
                    else
                    {
                        foreach (GameObject activePlayer5 in ActivePlayers)
                        {
                            activePlayer5.GetComponent<RaceCar>().IsSMove = false;
                        }
                    }
                }
                else if (PlayerNumers == 4)
                {
                    foreach (GameObject activePlayer6 in ActivePlayers)
                    {
                        activePlayer6.GetComponent<RaceCar>().IsSMove = false;
                    }
                }
            }
        }
        else
        {
            if (ListNumber <= 1)
            {
                return;
            }
            GameOverTie.SetActive(value: true);
            if (Players.Count == 1)
            {
                RaceCar component2 = Players[0].GetComponent<RaceCar>();
                if (component2 != null)
                {
                    component2.IsSMove = false;
                }
                else
                {
                    Players[0].GetComponent<AIcarScript>().IsSMove = false;
                }
            }
            else
            {
                if (Players.Count <= 1)
                {
                    return;
                }
                if (PlayerNumers == 1)
                {
                    ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                    ActivePlayers[1].GetComponent<AIcarScript>().IsSMove = false;
                    ActivePlayers[2].GetComponent<AIcarScript>().IsSMove = false;
                    ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                }
                else if (PlayerNumers == 2)
                {
                    if (NeedBot == 1)
                    {
                        ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[1].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[2].GetComponent<AIcarScript>().IsSMove = false;
                        ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                    }
                    else
                    {
                        foreach (GameObject activePlayer7 in ActivePlayers)
                        {
                            activePlayer7.GetComponent<RaceCar>().IsSMove = false;
                        }
                    }
                }
                else if (PlayerNumers == 3)
                {
                    if (NeedBot == 1)
                    {
                        ActivePlayers[0].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[1].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[2].GetComponent<RaceCar>().IsSMove = false;
                        ActivePlayers[3].GetComponent<AIcarScript>().IsSMove = false;
                    }
                    else
                    {
                        foreach (GameObject activePlayer8 in ActivePlayers)
                        {
                            activePlayer8.GetComponent<RaceCar>().IsSMove = false;
                        }
                    }
                }
                else if (PlayerNumers == 4)
                {
                    foreach (GameObject activePlayer9 in ActivePlayers)
                    {
                        activePlayer9.GetComponent<RaceCar>().IsSMove = false;
                    }
                }
            }
        }
    }

    private void GetButtons()
    {
        GameOverButtons.SetActive(value: true);
    }

    public void MainMenuButton()
    {
        AdsManager.Instance.ShowIntersitial(() =>
        {
            Source.PlayOneShot(ButtonSound);
            SceneManager.LoadScene(1);
        });
    }

    public void RestartButton()
    {
        AdsManager.Instance.ShowInterstitialTimer(() =>
        {

            Source.PlayOneShot(ButtonSound);
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
        });
    }
}
