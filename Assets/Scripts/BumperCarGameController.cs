using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class BumperCarGameController : MonoBehaviour
{
    private bool IsRedTrue;

    private bool IsBlueTrue;

    private bool IsGreenTrue;

    private bool IsYellowTrue;

    public ShowAds SA;

    public GameObject[] Colliders;

    public GameObject ExplosionPrefab;

    public GameObject BallPrefab;

    public GameObject[] WallLines;

    public GameObject[] PlayerLines;

    private int RedCount = 5;

    private int BlueCount = 5;

    private int GreenCount = 5;

    private int YellowCount = 5;

    public Text[] CountText;

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

    private string[] PlayerNames = new string[4]
    {
        "PlayerRed",
        "PlayerBlue",
        "PlayerGreen",
        "PlayerYellow"
    };

    private int PlayerNumers;

    public GameObject[] ActivePlayers;

    private string PlayerName;

    private bool IsGameOver;

    private float timer;

    private int BallCount;

    public Transform[] BallTransform;

    public List<GameObject> Players;

    public int ListNumber;

    public List<string> Names = new List<string>();

    private bool IsRed;

    private bool IsBlue;

    private bool IsGreen;

    private bool IsYellow;

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
            Player[1].GetComponent<BallPlayerscript>().IsAIPlayer = true;
            Player[2].GetComponent<BallPlayerscript>().IsAIPlayer = true;
            Player[3].GetComponent<BallPlayerscript>().IsAIPlayer = true;
            GameObject[] player = Player;
            for (int i = 0; i < player.Length; i++)
            {
                player[i].SetActive(value: true);
            }
            player = PlayerLines;
            for (int i = 0; i < player.Length; i++)
            {
                player[i].SetActive(value: true);
            }
            CountText[0].enabled = true;
            CountText[1].enabled = true;
            CountText[2].enabled = true;
            CountText[3].enabled = true;
        }
        else if (PlayerNumers == 2)
        {
            if (NeedBot == 0)
            {
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
                CountText[0].enabled = true;
                CountText[1].enabled = true;
                PlayerLines[0].SetActive(value: true);
                PlayerLines[1].SetActive(value: true);
                WallLines[2].SetActive(value: true);
                WallLines[3].SetActive(value: true);
            }
            else
            {
                Player[2].GetComponent<BallPlayerscript>().IsAIPlayer = true;
                Player[3].GetComponent<BallPlayerscript>().IsAIPlayer = true;
                GameObject[] player = Player;
                for (int i = 0; i < player.Length; i++)
                {
                    player[i].SetActive(value: true);
                }
                CountText[0].enabled = true;
                CountText[1].enabled = true;
                CountText[2].enabled = true;
                CountText[3].enabled = true;
                player = PlayerLines;
                for (int i = 0; i < player.Length; i++)
                {
                    player[i].SetActive(value: true);
                }
            }
        }
        else if (PlayerNumers == 3)
        {
            if (NeedBot == 0)
            {
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
                Player[2].SetActive(value: true);
                CountText[0].enabled = true;
                CountText[1].enabled = true;
                CountText[2].enabled = true;
                PlayerLines[0].SetActive(value: true);
                PlayerLines[1].SetActive(value: true);
                PlayerLines[3].SetActive(value: true);
                WallLines[3].SetActive(value: true);
            }
            else
            {
                Player[3].GetComponent<BallPlayerscript>().IsAIPlayer = true;
                GameObject[] player = Player;
                for (int i = 0; i < player.Length; i++)
                {
                    player[i].SetActive(value: true);
                }
                CountText[0].enabled = true;
                CountText[1].enabled = true;
                CountText[2].enabled = true;
                CountText[3].enabled = true;
                player = PlayerLines;
                for (int i = 0; i < player.Length; i++)
                {
                    player[i].SetActive(value: true);
                }
            }
        }
        else if (PlayerNumers == 4)
        {
            GameObject[] player = Player;
            for (int i = 0; i < player.Length; i++)
            {
                player[i].SetActive(value: true);
            }
            player = PlayerLines;
            for (int i = 0; i < player.Length; i++)
            {
                player[i].SetActive(value: true);
            }
            CountText[0].enabled = true;
            CountText[1].enabled = true;
            CountText[2].enabled = true;
            CountText[3].enabled = true;
        }
        Source = GetComponent<AudioSource>();
        Source.volume = 0.8f;
        Invoke("StartAnimation", 0.5f);
        Invoke("StartGame", 1.2f);
        ActivePlayers = GameObject.FindGameObjectsWithTag("Player");
        timer = 1.5f;
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
        GameObject[] activePlayers = ActivePlayers;
        for (int i = 0; i < activePlayers.Length; i++)
        {
            activePlayers[i].GetComponent<BallPlayerscript>().IsMove = true;
        }
    }

    private void Update()
    {
        AdsManager.Instance.HideBanner();
        CountText[0].text = string.Concat(RedCount);
        CountText[1].text = string.Concat(BlueCount);
        CountText[2].text = string.Concat(GreenCount);
        CountText[3].text = string.Concat(YellowCount);
        if (IsStart)
        {
            timer += Time.deltaTime;
            if (timer >= 2.3f && BallCount < 4)
            {
                int num = UnityEngine.Random.Range(0, BallTransform.Length);
                Object.Instantiate(BallPrefab, BallTransform[num].transform.position, BallTransform[num].transform.rotation);
                timer = 0f;
                BallCount++;
            }
            Players.RemoveAll((GameObject item) => item == null);
            ListNumber = Players.Count;
        }
        if (IsStart && ListNumber <= 1 && !IsGameOver)
        {
            IGameOver();
            IsStart = false;
            IsGameOver = true;
        }
        if (RedCount <= 0 && !IsRed)
        {
            int i;
            for (i = 0; i < Players.Count; i++)
            {
                if (!PlayerNames.Any((string MyObject) => MyObject == Players[i].name))
                {
                    continue;
                }
                for (int m = 0; m < PlayerNames.Length; m++)
                {
                    if (PlayerNames[0] == Players[i].name)
                    {
                        if (PlayerPrefs.GetInt("IsCups") == 1 && !IsRedTrue)
                        {
                            Names.Add(Players[i].name);
                            IsRedTrue = true;
                        }
                        Object.Instantiate(ExplosionPrefab, Players[i].transform.position, Quaternion.identity);
                        UnityEngine.Object.Destroy(Players[i].gameObject);
                        if (OptionsIntro.Instance.VibrationCheck == 0)
                        {
                            OptionsIntro.Instance.TriggerVibrate();
                        }
                    }
                }
            }
            PlayerLines[0].SetActive(value: false);
            WallLines[0].SetActive(value: true);
            IsRed = true;
        }
        else if (BlueCount <= 0 && !IsBlue)
        {
            int j;
            for (j = 0; j < Players.Count; j++)
            {
                if (!PlayerNames.Any((string MyObject) => MyObject == Players[j].name))
                {
                    continue;
                }
                for (int n = 0; n < PlayerNames.Length; n++)
                {
                    if (PlayerNames[1] == Players[j].name)
                    {
                        if (PlayerPrefs.GetInt("IsCups") == 1 && !IsBlueTrue)
                        {
                            Names.Add(Players[j].name);
                            IsBlueTrue = true;
                        }
                        Object.Instantiate(ExplosionPrefab, Players[j].transform.position, Quaternion.identity);
                        UnityEngine.Object.Destroy(Players[j].gameObject);
                        if (OptionsIntro.Instance.VibrationCheck == 0)
                        {
                            OptionsIntro.Instance.TriggerVibrate();
                        }
                    }
                }
            }
            PlayerLines[1].SetActive(value: false);
            WallLines[1].SetActive(value: true);
            IsBlue = true;
        }
        else if (GreenCount <= 0 && !IsGreen)
        {
            int k;
            for (k = 0; k < Players.Count; k++)
            {
                if (!PlayerNames.Any((string MyObject) => MyObject == Players[k].name))
                {
                    continue;
                }
                for (int num2 = 0; num2 < PlayerNames.Length; num2++)
                {
                    if (PlayerNames[2] == Players[k].name)
                    {
                        if (PlayerPrefs.GetInt("IsCups") == 1 && !IsGreenTrue)
                        {
                            Names.Add(Players[k].name);
                            IsGreenTrue = true;
                        }
                        Object.Instantiate(ExplosionPrefab, Players[k].transform.position, Quaternion.identity);
                        UnityEngine.Object.Destroy(Players[k].gameObject);
                        if (OptionsIntro.Instance.VibrationCheck == 0)
                        {
                            OptionsIntro.Instance.TriggerVibrate();
                        }
                    }
                }
            }
            PlayerLines[3].SetActive(value: false);
            WallLines[2].SetActive(value: true);
            IsGreen = true;
        }
        else
        {
            if (YellowCount > 0 || IsYellow)
            {
                return;
            }
            int l;
            for (l = 0; l < Players.Count; l++)
            {
                if (!PlayerNames.Any((string MyObject) => MyObject == Players[l].name))
                {
                    continue;
                }
                for (int num3 = 0; num3 < PlayerNames.Length; num3++)
                {
                    if (PlayerNames[3] == Players[l].name)
                    {
                        if (PlayerPrefs.GetInt("IsCups") == 1 && !IsYellowTrue)
                        {
                            Names.Add(Players[l].name);
                            IsYellowTrue = true;
                        }
                        Object.Instantiate(ExplosionPrefab, Players[l].transform.position, Quaternion.identity);
                        UnityEngine.Object.Destroy(Players[l].gameObject);
                        if (OptionsIntro.Instance.VibrationCheck == 0)
                        {
                            OptionsIntro.Instance.TriggerVibrate();
                        }
                    }
                }
            }
            PlayerLines[2].SetActive(value: false);
            WallLines[3].SetActive(value: true);
            IsYellow = true;
        }
    }

    public void RedTeam()
    {
        if (BallCount > 0)
        {
            BallCount--;
        }
        if (RedCount > 0)
        {
            RedCount--;
        }
    }

    public void BlueTeam()
    {
        if (BlueCount > 0)
        {
            BlueCount--;
        }
        if (BallCount > 0)
        {
            BallCount--;
        }
    }

    public void GreenTeam()
    {
        if (GreenCount > 0)
        {
            GreenCount--;
        }
        if (BallCount > 0)
        {
            BallCount--;
        }
    }

    public void YellowTeam()
    {
        if (YellowCount > 0)
        {
            YellowCount--;
        }
        if (BallCount > 0)
        {
            BallCount--;
        }
    }

    public void IGameOver()
    {
       
        GameOverPanel.SetActive(value: true);
        BGMusic.SetActive(value: false);
        GameAnalytic.AddProgression(new LevelProgression()
        {

            state = ProgressionStatus.Completed,
            v_LevelName = "Level Bumper Car Game"

        });
        BGMusic.SetActive(value: false);
       // AdsManager.Instance.ShowIntersitial(() => { Debug.Log("intersitial worked"); });
        GameObject[] colliders = Colliders;
        for (int i = 0; i < colliders.Length; i++)
        {
            colliders[i].SetActive(value: false);
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
                }
            }
            else if (name == "PlayerBlue")
            {
                WinObject[1].SetActive(value: true);
                if (PlayerPrefs.GetInt("IsCups") == 1)
                {
                    PlayerPrefs.SetInt("BlueNewCount", 3);
                }
            }
            else if (name == "PlayerGreen")
            {
                WinObject[2].SetActive(value: true);
                if (PlayerPrefs.GetInt("IsCups") == 1)
                {
                    PlayerPrefs.SetInt("GreenNewCount", 3);
                }
            }
            else if (name == "PlayerYellow")
            {
                WinObject[3].SetActive(value: true);
                if (PlayerPrefs.GetInt("IsCups") == 1)
                {
                    PlayerPrefs.SetInt("YellowNewCount", 3);
                }
            }
            Players[0].GetComponent<BallPlayerscript>().IsMove = false;
            if (PlayerPrefs.GetInt("IsCups") == 1)
            {
                if (PlayerNumers == 1 || PlayerNumers == 4 || (PlayerNumers == 2 && NeedBot == 1) || (PlayerNumers == 3 && NeedBot == 1))
                {
                    if (Names[0] == "PlayerRed")
                    {
                        PlayerPrefs.SetInt("RedNewCount", 0);
                    }
                    else if (Names[0] == "PlayerBlue")
                    {
                        PlayerPrefs.SetInt("BlueNewCount", 0);
                    }
                    else if (Names[0] == "PlayerGreen")
                    {
                        PlayerPrefs.SetInt("GreenNewCount", 0);
                    }
                    else if (Names[0] == "PlayerYellow")
                    {
                        PlayerPrefs.SetInt("YellowNewCount", 0);
                    }
                    if (Names[1] == "PlayerRed")
                    {
                        PlayerPrefs.SetInt("RedNewCount", 1);
                    }
                    else if (Names[1] == "PlayerBlue")
                    {
                        PlayerPrefs.SetInt("BlueNewCount", 1);
                    }
                    else if (Names[1] == "PlayerGreen")
                    {
                        PlayerPrefs.SetInt("GreenNewCount", 1);
                    }
                    else if (Names[1] == "PlayerYellow")
                    {
                        PlayerPrefs.SetInt("YellowNewCount", 1);
                    }
                    if (Names[2] == "PlayerRed")
                    {
                        PlayerPrefs.SetInt("RedNewCount", 2);
                    }
                    else if (Names[2] == "PlayerBlue")
                    {
                        PlayerPrefs.SetInt("BlueNewCount", 2);
                    }
                    else if (Names[2] == "PlayerGreen")
                    {
                        PlayerPrefs.SetInt("GreenNewCount", 2);
                    }
                    else if (Names[2] == "PlayerYellow")
                    {
                        PlayerPrefs.SetInt("YellowNewCount", 2);
                    }
                }
                if (PlayerNumers == 2)
                {
                    if (Names[0] == "PlayerRed")
                    {
                        PlayerPrefs.SetInt("RedNewCount", 0);
                    }
                    else if (Names[0] == "PlayerBlue")
                    {
                        PlayerPrefs.SetInt("BlueNewCount", 0);
                    }
                }
                if (PlayerNumers == 3)
                {
                    if (Names[0] == "PlayerRed")
                    {
                        PlayerPrefs.SetInt("RedNewCount", 0);
                    }
                    else if (Names[0] == "PlayerBlue")
                    {
                        PlayerPrefs.SetInt("BlueNewCount", 0);
                    }
                    else if (Names[0] == "PlayerGreen")
                    {
                        PlayerPrefs.SetInt("GreenNewCount", 0);
                    }
                    if (Names[1] == "PlayerRed")
                    {
                        PlayerPrefs.SetInt("RedNewCount", 1);
                    }
                    else if (Names[1] == "PlayerBlue")
                    {
                        PlayerPrefs.SetInt("BlueNewCount", 1);
                    }
                    else if (Names[1] == "PlayerGreen")
                    {
                        PlayerPrefs.SetInt("GreenNewCount", 1);
                    }
                }
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
