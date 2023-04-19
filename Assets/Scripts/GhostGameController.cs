using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GhostGameController : MonoBehaviour
{
    public GameObject[] GhostObject;

    private bool IsRedTrue;

    private bool IsBlueTrue;

    private bool IsGreenTrue;

    private bool IsYellowTrue;

    public ShowAds SA;

    public GameObject BGMusic;

    public GameObject GameOverPanel;

    public GameObject[] WinObject;

    public GameObject GameOverButtons;

    public GameObject GameOverTie;

    public GameObject TimerAnimation;

    private bool IsStart;

    public AudioClip ButtonSound;

    public AudioClip SoundGo;

    private AudioSource Source;

    public GameObject[] Player;

    public GameObject[] Joystick;

    public GameObject[] AIPlayer;

    public List<GameObject> Players;

    private int PlayerNumers;

    public int ListNumber;

    private GameObject[] ActivePlayers;

    private GameObject[] SteeringBasics;

    private bool IsGameOver;

    private float Ghosttimer;

    public List<string> Names = new List<string>();

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
            Joystick[0].SetActive(value: true);
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
                Joystick[0].SetActive(value: true);
                Joystick[1].SetActive(value: true);
            }
            else
            {
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
                Joystick[0].SetActive(value: true);
                Joystick[1].SetActive(value: true);
            }
        }
        else if (PlayerNumers == 3)
        {
            if (NeedBot == 1)
            {
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
                Player[2].SetActive(value: true);
                Joystick[0].SetActive(value: true);
                Joystick[1].SetActive(value: true);
                Joystick[2].SetActive(value: true);
                AIPlayer[2].SetActive(value: true);
            }
            else
            {
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
                Player[2].SetActive(value: true);
                Joystick[0].SetActive(value: true);
                Joystick[1].SetActive(value: true);
                Joystick[2].SetActive(value: true);
            }
        }
        else if (PlayerNumers == 4)
        {
            GameObject[] aIPlayer = Player;
            for (int i = 0; i < aIPlayer.Length; i++)
            {
                aIPlayer[i].SetActive(value: true);
            }
            aIPlayer = Joystick;
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
        GhostObject[0].SetActive(value: true);
        IsStart = true;
        if (PlayerNumers == 1)
        {
            ActivePlayers[0].GetComponent<ColorPlayer>().IsSMove = true;
            ActivePlayers[1].GetComponent<SteeringBasics>().IsSMove = true;
            ActivePlayers[2].GetComponent<SteeringBasics>().IsSMove = true;
            ActivePlayers[3].GetComponent<SteeringBasics>().IsSMove = true;
        }
        else if (PlayerNumers == 2)
        {
            if (NeedBot == 1)
            {
                ActivePlayers[0].GetComponent<ColorPlayer>().IsSMove = true;
                ActivePlayers[1].GetComponent<ColorPlayer>().IsSMove = true;
                ActivePlayers[2].GetComponent<SteeringBasics>().IsSMove = true;
                ActivePlayers[3].GetComponent<SteeringBasics>().IsSMove = true;
                return;
            }
            GameObject[] activePlayers = ActivePlayers;
            for (int i = 0; i < activePlayers.Length; i++)
            {
                activePlayers[i].GetComponent<ColorPlayer>().IsSMove = true;
            }
        }
        else if (PlayerNumers == 3)
        {
            if (NeedBot == 1)
            {
                ActivePlayers[0].GetComponent<ColorPlayer>().IsSMove = true;
                ActivePlayers[1].GetComponent<ColorPlayer>().IsSMove = true;
                ActivePlayers[2].GetComponent<ColorPlayer>().IsSMove = true;
                ActivePlayers[3].GetComponent<SteeringBasics>().IsSMove = true;
                return;
            }
            GameObject[] activePlayers = ActivePlayers;
            for (int i = 0; i < activePlayers.Length; i++)
            {
                activePlayers[i].GetComponent<ColorPlayer>().IsSMove = true;
            }
        }
        else
        {
            GameObject[] activePlayers = ActivePlayers;
            for (int i = 0; i < activePlayers.Length; i++)
            {
                activePlayers[i].GetComponent<ColorPlayer>().IsSMove = true;
            }
        }
    }

    public void AddName(string name)
    {
        Names.Add(name);
    }

    private void Update()
    {
        //AdsManager.Instance.HideBanner();
        AdsManager.Instance.HideBanner();
        if (IsStart)
        {
            Players.RemoveAll((GameObject item) => item == null);
            ListNumber = Players.Count;
        }
        if (IsStart && ListNumber <= 1 && !IsGameOver)
        {
            IGameOver();

            IsStart = false;
            IsGameOver = true;
        }
    }

    public void IGameOver()
    {
       // AdsManager.Instance.ShowIntersitial(() => { Debug.Log("intersitial worked"); });
        GameOverPanel.SetActive(value: true);
        BGMusic.SetActive(value: false);
        GameAnalytic.AddProgression(new LevelProgression()
        {

            state = ProgressionStatus.Completed,
            v_LevelName = "Level Ghost"

        });
        if (PlayerPrefs.GetInt("IsCups") == 0)
        {
            Invoke("GetButtons", 2f);
        }
        else if (PlayerPrefs.GetInt("IsCups") == 1)
        {
            Invoke("GetCount", 3f);
        }
        if (ListNumber == 1)
        {
            string name = Players[0].name;
            if (name == "PlayerRed")
            {
                WinObject[0].SetActive(value: true);
                if (PlayerPrefs.GetInt("IsCups") == 1)
                {
                    PlayerPrefs.SetInt("RedNewCount", 3);
                    IsRedTrue = true;
                }
            }
            else if (name == "PlayerBlue")
            {
                WinObject[1].SetActive(value: true);
                if (PlayerPrefs.GetInt("IsCups") == 1)
                {
                    PlayerPrefs.SetInt("BlueNewCount", 3);
                    IsBlueTrue = true;
                }
            }
            else if (name == "PlayerGreen")
            {
                WinObject[2].SetActive(value: true);
                if (PlayerPrefs.GetInt("IsCups") == 1)
                {
                    PlayerPrefs.SetInt("GreenNewCount", 3);
                    IsGreenTrue = true;
                }
            }
            else if (name == "PlayerYellow")
            {
                WinObject[3].SetActive(value: true);
                if (PlayerPrefs.GetInt("IsCups") == 1)
                {
                    PlayerPrefs.SetInt("YellowNewCount", 3);
                    IsYellowTrue = true;
                }
            }
            if (Players[0].GetComponent<ColorPlayer>() != null)
            {
                Players[0].GetComponent<ColorPlayer>().IsSMove = false;
            }
            else
            {
                Players[0].GetComponent<SteeringBasics>().IsSMove = false;
            }
        }
        else if (ListNumber == 0)
        {
            GameOverTie.SetActive(value: true);
            PlayerPrefs.SetInt("RedNewCount", 0);
            PlayerPrefs.SetInt("BlueNewCount", 0);
            PlayerPrefs.SetInt("GreenNewCount", 0);
            PlayerPrefs.SetInt("YellowNewCount", 0);
        }
        //SA.ShowInter();

        if (PlayerNumers == 1 || PlayerNumers == 4 || (PlayerNumers == 2 && NeedBot == 1) || (PlayerNumers == 3 && NeedBot == 1))
        {
            if (Names[0] == "PlayerRed")
            {
                if (!IsRedTrue)
                {
                    PlayerPrefs.SetInt("RedNewCount", 0);
                }
            }
            else if (Names[0] == "PlayerBlue")
            {
                if (!IsBlueTrue)
                {
                    PlayerPrefs.SetInt("BlueNewCount", 0);
                }
            }
            else if (Names[0] == "PlayerGreen")
            {
                if (!IsGreenTrue)
                {
                    PlayerPrefs.SetInt("GreenNewCount", 0);
                }
            }
            else if (Names[0] == "PlayerYellow" && !IsYellowTrue)
            {
                PlayerPrefs.SetInt("YellowNewCount", 0);
            }
            if (Names[1] == "PlayerRed")
            {
                if (!IsRedTrue)
                {
                    PlayerPrefs.SetInt("RedNewCount", 1);
                }
            }
            else if (Names[1] == "PlayerBlue")
            {
                if (!IsBlueTrue)
                {
                    PlayerPrefs.SetInt("BlueNewCount", 1);
                }
            }
            else if (Names[1] == "PlayerGreen")
            {
                if (!IsGreenTrue)
                {
                    PlayerPrefs.SetInt("GreenNewCount", 1);
                }
            }
            else if (Names[1] == "PlayerYellow" && !IsYellowTrue)
            {
                PlayerPrefs.SetInt("YellowNewCount", 1);
            }
            if (Names[2] == "PlayerRed")
            {
                if (!IsRedTrue)
                {
                    PlayerPrefs.SetInt("RedNewCount", 2);
                }
            }
            else if (Names[2] == "PlayerBlue")
            {
                if (!IsBlueTrue)
                {
                    PlayerPrefs.SetInt("BlueNewCount", 2);
                }
            }
            else if (Names[2] == "PlayerGreen")
            {
                if (!IsGreenTrue)
                {
                    PlayerPrefs.SetInt("GreenNewCount", 2);
                }
            }
            else if (Names[2] == "PlayerYellow" && !IsYellowTrue)
            {
                PlayerPrefs.SetInt("YellowNewCount", 2);
            }
        }
        if (PlayerNumers == 2)
        {
            if (Names[0] == "PlayerRed")
            {
                if (!IsRedTrue)
                {
                    PlayerPrefs.SetInt("RedNewCount", 0);
                }
            }
            else if (Names[0] == "PlayerBlue" && !IsBlueTrue)
            {
                PlayerPrefs.SetInt("BlueNewCount", 0);
            }
        }
        if (PlayerNumers != 3)
        {
            return;
        }
        if (Names[0] == "PlayerRed")
        {
            if (!IsRedTrue)
            {
                PlayerPrefs.SetInt("RedNewCount", 0);
            }
        }
        else if (Names[0] == "PlayerBlue")
        {
            if (!IsBlueTrue)
            {
                PlayerPrefs.SetInt("BlueNewCount", 0);
            }
        }
        else if (Names[0] == "PlayerGreen" && !IsGreenTrue)
        {
            PlayerPrefs.SetInt("GreenNewCount", 0);
        }
        if (Names[1] == "PlayerRed")
        {
            if (!IsRedTrue)
            {
                PlayerPrefs.SetInt("RedNewCount", 2);
            }
        }
        else if (Names[1] == "PlayerBlue")
        {
            if (!IsBlueTrue)
            {
                PlayerPrefs.SetInt("BlueNewCount", 2);
            }
        }
        else if (Names[1] == "PlayerGreen" && !IsGreenTrue)
        {
            PlayerPrefs.SetInt("GreenNewCount", 2);
        }
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
