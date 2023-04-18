using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class FlagGameController : MonoBehaviour
{
    public int RedGoals;

    public int BlueGoals;

    public GameObject[] Flag;

    public Animation[] Anim;

    public Transform[] SpawnTransform;

    public GameObject[] LightAnimation;

    private bool IsActive1;

    private bool IsActive2;

    private bool IsActive3;

    private bool IsActive4;

    private bool IsActive5;

    private bool IsActive6;

    public ShowAds SA;

    public GameObject PlanePrefab;

    public Transform[] PlaneStartPos;

    private float BonusTimer;

    private float RandomTimer;

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

    public List<GameObject> Players;

    private int PlayerNumers;

    public int ListNumber;

    public GameObject[] ActivePlayers;

    public bool IsGameOver;

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
            Animation[] anim = Anim;
            for (int i = 0; i < anim.Length; i++)
            {
                anim[i].Play("DoorsSpawnAnimation");
            }
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
                Animation[] anim = Anim;
                for (int i = 0; i < anim.Length; i++)
                {
                    anim[i].Play("DoorsSpawnAnimation");
                }
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
                AIPlayer[0].SetActive(value: true);
                AIPlayer[1].SetActive(value: true);
                AIPlayer[3].SetActive(value: true);
                AIPlayer[4].SetActive(value: true);
            }
            else
            {
                Anim[0].Play("DoorsSpawnAnimation");
                Anim[3].Play("DoorsSpawnAnimation");
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
            }
        }
        else if (PlayerNumers == 3)
        {
            if (NeedBot == 1)
            {
                Animation[] anim = Anim;
                for (int i = 0; i < anim.Length; i++)
                {
                    anim[i].Play("DoorsSpawnAnimation");
                }
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
                Player[2].SetActive(value: true);
                AIPlayer[0].SetActive(value: true);
                AIPlayer[1].SetActive(value: true);
                AIPlayer[3].SetActive(value: true);
            }
            else
            {
                Anim[0].Play("DoorsSpawnAnimation");
                Anim[3].Play("DoorsSpawnAnimation");
                Anim[5].Play("DoorsSpawnAnimation");
                Player[0].SetActive(value: true);
                Player[1].SetActive(value: true);
                Player[2].SetActive(value: true);
            }
        }
        else if (PlayerNumers == 4)
        {
            if (NeedBot == 1)
            {
                Animation[] anim = Anim;
                for (int i = 0; i < anim.Length; i++)
                {
                    anim[i].Play("DoorsSpawnAnimation");
                }
                GameObject[] aIPlayer = Player;
                for (int i = 0; i < aIPlayer.Length; i++)
                {
                    aIPlayer[i].SetActive(value: true);
                }
                AIPlayer[0].SetActive(value: true);
                AIPlayer[3].SetActive(value: true);
            }
            else
            {
                Anim[0].Play("DoorsSpawnAnimation");
                Anim[2].Play("DoorsSpawnAnimation");
                Anim[3].Play("DoorsSpawnAnimation");
                Anim[5].Play("DoorsSpawnAnimation");
                GameObject[] aIPlayer = Player;
                for (int i = 0; i < aIPlayer.Length; i++)
                {
                    aIPlayer[i].SetActive(value: true);
                }
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
        if (PlayerNumers == 1)
        {
            ActivePlayers[0].GetComponent<TankScript>().IsSMove = true;
            ActivePlayers[1].GetComponent<TankAI>().IsSMove = true;
            ActivePlayers[2].GetComponent<TankAI>().IsSMove = true;
            ActivePlayers[3].GetComponent<TankAI>().IsSMove = true;
            ActivePlayers[4].GetComponent<TankAI>().IsSMove = true;
            ActivePlayers[5].GetComponent<TankAI>().IsSMove = true;
            ActivePlayers[0].tag = "PlayerRed";
            ActivePlayers[1].tag = "PlayerRed";
            ActivePlayers[2].tag = "PlayerRed";
            ActivePlayers[3].tag = "PlayerBlue";
            ActivePlayers[4].tag = "PlayerBlue";
            ActivePlayers[5].tag = "PlayerBlue";
        }
        else if (PlayerNumers == 2)
        {
            if (NeedBot == 1)
            {
                ActivePlayers[0].GetComponent<TankScript>().IsSMove = true;
                ActivePlayers[1].GetComponent<TankScript>().IsSMove = true;
                ActivePlayers[2].GetComponent<TankAI>().IsSMove = true;
                ActivePlayers[3].GetComponent<TankAI>().IsSMove = true;
                ActivePlayers[4].GetComponent<TankAI>().IsSMove = true;
                ActivePlayers[5].GetComponent<TankAI>().IsSMove = true;
                ActivePlayers[0].tag = "PlayerRed";
                ActivePlayers[1].tag = "PlayerBlue";
                ActivePlayers[2].tag = "PlayerRed";
                ActivePlayers[3].tag = "PlayerRed";
                ActivePlayers[4].tag = "PlayerBlue";
                ActivePlayers[5].tag = "PlayerBlue";
            }
            else
            {
                GameObject[] activePlayers = ActivePlayers;
                for (int i = 0; i < activePlayers.Length; i++)
                {
                    activePlayers[i].GetComponent<TankScript>().IsSMove = true;
                }
                ActivePlayers[0].tag = "PlayerRed";
                ActivePlayers[1].tag = "PlayerBlue";
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
                ActivePlayers[4].GetComponent<TankAI>().IsSMove = true;
                ActivePlayers[5].GetComponent<TankAI>().IsSMove = true;
                ActivePlayers[0].tag = "PlayerRed";
                ActivePlayers[1].tag = "PlayerBlue";
                ActivePlayers[2].tag = "PlayerBlue";
                ActivePlayers[3].tag = "PlayerRed";
                ActivePlayers[4].tag = "PlayerRed";
                ActivePlayers[5].tag = "PlayerBlue";
            }
            else
            {
                GameObject[] activePlayers = ActivePlayers;
                for (int i = 0; i < activePlayers.Length; i++)
                {
                    activePlayers[i].GetComponent<TankScript>().IsSMove = true;
                }
                ActivePlayers[0].tag = "PlayerRed";
                ActivePlayers[1].tag = "PlayerBlue";
                ActivePlayers[2].tag = "PlayerBlue";
            }
        }
        else if (PlayerNumers == 4)
        {
            if (NeedBot == 1)
            {
                ActivePlayers[0].GetComponent<TankScript>().IsSMove = true;
                ActivePlayers[1].GetComponent<TankScript>().IsSMove = true;
                ActivePlayers[2].GetComponent<TankScript>().IsSMove = true;
                ActivePlayers[3].GetComponent<TankScript>().IsSMove = true;
                ActivePlayers[4].GetComponent<TankAI>().IsSMove = true;
                ActivePlayers[5].GetComponent<TankAI>().IsSMove = true;
                ActivePlayers[0].tag = "PlayerRed";
                ActivePlayers[1].tag = "PlayerBlue";
                ActivePlayers[2].tag = "PlayerBlue";
                ActivePlayers[3].tag = "PlayerRed";
                ActivePlayers[4].tag = "PlayerRed";
                ActivePlayers[5].tag = "PlayerBlue";
            }
            else
            {
                GameObject[] activePlayers = ActivePlayers;
                for (int i = 0; i < activePlayers.Length; i++)
                {
                    activePlayers[i].GetComponent<TankScript>().IsSMove = true;
                }
                ActivePlayers[0].tag = "PlayerRed";
                ActivePlayers[1].tag = "PlayerBlue";
                ActivePlayers[2].tag = "PlayerBlue";
                ActivePlayers[3].tag = "PlayerRed";
            }
        }
        IsStart = true;
    }

    private void Update()
    {
        if (!IsStart)
        {
            return;
        }
        if (!ActivePlayers[0].activeSelf && !IsActive1)
        {
            LightAnimation[0].SetActive(value: true);
            ActivePlayers[0].transform.position = SpawnTransform[0].position;
            Invoke("Active1", 8f);
            IsActive1 = true;
        }
        else if (!ActivePlayers[1].activeSelf && !IsActive2)
        {
            if (ActivePlayers[1].name == "PlayerBlue")
            {
                LightAnimation[3].SetActive(value: true);
                ActivePlayers[1].transform.position = SpawnTransform[3].position;
                Invoke("Active2", 8f);
                IsActive2 = true;
            }
            else if (ActivePlayers[1].name == "PlayerOrange")
            {
                LightAnimation[1].SetActive(value: true);
                ActivePlayers[1].transform.position = SpawnTransform[1].position;
                Invoke("Active2", 8f);
                IsActive2 = true;
            }
        }
        if (ActivePlayers.Length < 3)
        {
            return;
        }
        if (!ActivePlayers[2].activeSelf && !IsActive3)
        {
            if (ActivePlayers[2].name == "PlayerGreen")
            {
                LightAnimation[5].SetActive(value: true);
                ActivePlayers[2].transform.position = SpawnTransform[5].position;
                Invoke("Active3", 8f);
                IsActive3 = true;
            }
            else if (ActivePlayers[2].name == "PlayerYellow")
            {
                LightAnimation[2].SetActive(value: true);
                ActivePlayers[2].transform.position = SpawnTransform[2].position;
                Invoke("Active3", 8f);
                IsActive3 = true;
            }
            else if (ActivePlayers[2].name == "PlayerOrange")
            {
                LightAnimation[1].SetActive(value: true);
                ActivePlayers[2].transform.position = SpawnTransform[1].position;
                Invoke("Active3", 8f);
                IsActive3 = true;
            }
        }
        if (ActivePlayers.Length < 4)
        {
            return;
        }
        if (!ActivePlayers[3].activeSelf && !IsActive4)
        {
            if (ActivePlayers[3].name == "PlayerYellow")
            {
                LightAnimation[2].SetActive(value: true);
                ActivePlayers[3].transform.position = SpawnTransform[2].position;
                Invoke("Active4", 8f);
                IsActive4 = true;
            }
            else if (ActivePlayers[3].name == "PlayerViolet")
            {
                LightAnimation[4].SetActive(value: true);
                ActivePlayers[3].transform.position = SpawnTransform[4].position;
                Invoke("Active4", 8f);
                IsActive4 = true;
            }
            else if (ActivePlayers[3].name == "PlayerOrange")
            {
                LightAnimation[1].SetActive(value: true);
                ActivePlayers[3].transform.position = SpawnTransform[1].position;
                Invoke("Active4", 8f);
                IsActive4 = true;
            }
            else if (ActivePlayers[3].name == "PlayerBlue")
            {
                LightAnimation[3].SetActive(value: true);
                ActivePlayers[3].transform.position = SpawnTransform[3].position;
                Invoke("Active4", 8f);
                IsActive4 = true;
            }
        }
        if (ActivePlayers.Length < 5)
        {
            return;
        }
        if (!ActivePlayers[4].activeSelf && !IsActive5)
        {
            if (ActivePlayers[4].name == "PlayerViolet")
            {
                LightAnimation[4].SetActive(value: true);
                ActivePlayers[4].transform.position = SpawnTransform[4].position;
                Invoke("Active5", 8f);
                IsActive5 = true;
            }
            else if (ActivePlayers[4].name == "PlayerOrange")
            {
                LightAnimation[1].SetActive(value: true);
                ActivePlayers[4].transform.position = SpawnTransform[1].position;
                Invoke("Active5", 8f);
                IsActive5 = true;
            }
            if (ActivePlayers[4].name == "PlayerYellow")
            {
                LightAnimation[2].SetActive(value: true);
                ActivePlayers[4].transform.position = SpawnTransform[2].position;
                Invoke("Active5", 8f);
                IsActive5 = true;
            }
        }
        if (ActivePlayers.Length == 6 && !ActivePlayers[5].activeSelf && !IsActive6)
        {
            if (ActivePlayers[5].name == "PlayerViolet")
            {
                LightAnimation[4].SetActive(value: true);
                ActivePlayers[5].transform.position = SpawnTransform[4].position;
                Invoke("Active6", 8f);
                IsActive6 = true;
            }
            else if (ActivePlayers[5].name == "PlayerGreen")
            {
                LightAnimation[5].SetActive(value: true);
                ActivePlayers[5].transform.position = SpawnTransform[5].position;
                Invoke("Active6", 8f);
                IsActive6 = true;
            }
        }
    }

    private void Active1()
    {
        Anim[0].Play("DoorsSpawnAnimation");
        LightAnimation[0].SetActive(value: false);
        ActivePlayers[0].SetActive(value: true);
        IsActive1 = false;
    }

    private void Active2()
    {
        if (ActivePlayers[1].name == "PlayerBlue")
        {
            Anim[3].Play("DoorsSpawnAnimation");
            LightAnimation[3].SetActive(value: false);
            ActivePlayers[1].SetActive(value: true);
            IsActive2 = false;
        }
        else if (ActivePlayers[1].name == "PlayerOrange")
        {
            Anim[1].Play("DoorsSpawnAnimation");
            LightAnimation[1].SetActive(value: false);
            ActivePlayers[1].SetActive(value: true);
            IsActive2 = false;
        }
    }

    private void Active3()
    {
        if (ActivePlayers[2].name == "PlayerGreen")
        {
            Anim[5].Play("DoorsSpawnAnimation");
            LightAnimation[5].SetActive(value: false);
            ActivePlayers[2].SetActive(value: true);
            IsActive3 = false;
        }
        else if (ActivePlayers[2].name == "PlayerYellow")
        {
            Anim[2].Play("DoorsSpawnAnimation");
            LightAnimation[2].SetActive(value: false);
            ActivePlayers[2].SetActive(value: true);
            IsActive3 = false;
        }
        else if (ActivePlayers[2].name == "PlayerOrange")
        {
            Anim[1].Play("DoorsSpawnAnimation");
            LightAnimation[1].SetActive(value: false);
            ActivePlayers[2].SetActive(value: true);
            IsActive3 = false;
        }
    }

    private void Active4()
    {
        if (ActivePlayers[3].name == "PlayerYellow")
        {
            Anim[2].Play("DoorsSpawnAnimation");
            LightAnimation[2].SetActive(value: false);
            ActivePlayers[3].SetActive(value: true);
            IsActive4 = false;
        }
        else if (ActivePlayers[3].name == "PlayerViolet")
        {
            Anim[4].Play("DoorsSpawnAnimation");
            LightAnimation[4].SetActive(value: false);
            ActivePlayers[3].SetActive(value: true);
            IsActive4 = false;
        }
        else if (ActivePlayers[3].name == "PlayerOrange")
        {
            Anim[1].Play("DoorsSpawnAnimation");
            LightAnimation[1].SetActive(value: false);
            ActivePlayers[3].SetActive(value: true);
            IsActive4 = false;
        }
        else if (ActivePlayers[3].name == "PlayerBlue")
        {
            Anim[3].Play("DoorsSpawnAnimation");
            LightAnimation[3].SetActive(value: false);
            ActivePlayers[3].SetActive(value: true);
            IsActive4 = false;
        }
    }

    private void Active5()
    {
        if (ActivePlayers[4].name == "PlayerViolet")
        {
            Anim[4].Play("DoorsSpawnAnimation");
            LightAnimation[4].SetActive(value: false);
            ActivePlayers[4].SetActive(value: true);
            IsActive5 = false;
        }
        else if (ActivePlayers[4].name == "PlayerOrange")
        {
            Anim[1].Play("DoorsSpawnAnimation");
            LightAnimation[1].SetActive(value: false);
            ActivePlayers[4].SetActive(value: true);
            IsActive5 = false;
        }
        else if (ActivePlayers[4].name == "PlayerYellow")
        {
            Anim[2].Play("DoorsSpawnAnimation");
            LightAnimation[2].SetActive(value: false);
            ActivePlayers[4].SetActive(value: true);
            IsActive5 = false;
        }
    }

    private void Active6()
    {
        if (ActivePlayers[5].name == "PlayerViolet")
        {
            Anim[4].Play("DoorsSpawnAnimation");
            LightAnimation[4].SetActive(value: false);
            ActivePlayers[5].SetActive(value: true);
            IsActive6 = false;
        }
        else if (ActivePlayers[5].name == "PlayerGreen")
        {
            Anim[5].Play("DoorsSpawnAnimation");
            LightAnimation[5].SetActive(value: false);
            ActivePlayers[5].SetActive(value: true);
            IsActive6 = false;
        }
    }

    public void ActiveRedFlag()
    {
        Flag[0].SetActive(value: true);
    }

    public void ActiveBlueFlag()
    {
        Flag[1].SetActive(value: true);
    }

    public void GameOver()
    {
        IsGameOver = true;
        GameOverPanel.SetActive(value: true);
        BGMusic.SetActive(value: false);
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
            if (ActivePlayers.Length >= 4)
            {
                WinObject[3].SetActive(value: true);
                if (PlayerPrefs.GetInt("IsCups") == 1)
                {
                    PlayerPrefs.SetInt("RedNewCount", 3);
                    PlayerPrefs.SetInt("BlueNewCount", 0);
                }
            }
        }
        else if (RedGoals < BlueGoals)
        {
            WinObject[1].SetActive(value: true);
            if (ActivePlayers.Length >= 3)
            {
                WinObject[2].SetActive(value: true);
                if (PlayerPrefs.GetInt("IsCups") == 1)
                {
                    PlayerPrefs.SetInt("BlueNewCount", 3);
                    PlayerPrefs.SetInt("RedNewCount", 0);
                }
            }
        }
        if (PlayerNumers == 1)
        {
            ActivePlayers[0].GetComponent<TankScript>().IsSMove = false;
            ActivePlayers[1].GetComponent<TankAI>().IsSMove = false;
            ActivePlayers[2].GetComponent<TankAI>().IsSMove = false;
            ActivePlayers[3].GetComponent<TankAI>().IsSMove = false;
            ActivePlayers[4].GetComponent<TankAI>().IsSMove = false;
            ActivePlayers[5].GetComponent<TankAI>().IsSMove = false;
        }
        else if (PlayerNumers == 2)
        {
            if (NeedBot == 1)
            {
                ActivePlayers[0].GetComponent<TankScript>().IsSMove = false;
                ActivePlayers[1].GetComponent<TankScript>().IsSMove = false;
                ActivePlayers[2].GetComponent<TankAI>().IsSMove = false;
                ActivePlayers[3].GetComponent<TankAI>().IsSMove = false;
                ActivePlayers[4].GetComponent<TankAI>().IsSMove = false;
                ActivePlayers[5].GetComponent<TankAI>().IsSMove = false;
            }
            else
            {
                GameObject[] activePlayers = ActivePlayers;
                for (int i = 0; i < activePlayers.Length; i++)
                {
                    activePlayers[i].GetComponent<TankScript>().IsSMove = false;
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
                ActivePlayers[4].GetComponent<TankAI>().IsSMove = false;
                ActivePlayers[5].GetComponent<TankAI>().IsSMove = false;
            }
            else
            {
                GameObject[] activePlayers = ActivePlayers;
                for (int i = 0; i < activePlayers.Length; i++)
                {
                    activePlayers[i].GetComponent<TankScript>().IsSMove = false;
                }
            }
        }
        else if (PlayerNumers == 4)
        {
            if (NeedBot == 1)
            {
                ActivePlayers[0].GetComponent<TankScript>().IsSMove = false;
                ActivePlayers[1].GetComponent<TankScript>().IsSMove = false;
                ActivePlayers[2].GetComponent<TankScript>().IsSMove = false;
                ActivePlayers[3].GetComponent<TankScript>().IsSMove = false;
                ActivePlayers[4].GetComponent<TankAI>().IsSMove = false;
                ActivePlayers[5].GetComponent<TankAI>().IsSMove = false;
            }
            else
            {
                GameObject[] activePlayers = ActivePlayers;
                for (int i = 0; i < activePlayers.Length; i++)
                {
                    activePlayers[i].GetComponent<TankScript>().IsSMove = false;
                }
            }
        }
        SA.ShowInter();
    }

    private void GetButtons()
    {
        GameOverButtons.SetActive(value: true);
    }

    private void GetCount()
    {
        SceneManager.LoadScene("TournamentSceneVS");
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
