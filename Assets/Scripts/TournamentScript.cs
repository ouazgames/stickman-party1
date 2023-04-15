using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class TournamentScript : MonoBehaviour
{
	public GameObject TextPrefab;

	public Animation[] Anim;

	public GameObject[] BlackLight;

	public GameObject[] PlusObj;

	public GameObject[] Confetti;

	public GameObject[] Stars;

	public Text[] CountText;

	public int[] ColorCount = new int[4];

	private AudioSource Source;

	public AudioClip CountPlusSound;

	public AudioClip LuserSound;

	public AudioClip WinnerSound;

	public AudioClip ButtonSound;

	public GameObject ButtonMenu;

	private int PlayerNumers;

	private string Level2name;

	private string Level3name;

	private string Level4name;

	private string Level5name;

	private int TournamentLevelCount;

	private int NeedBot;

	private void Awake()
	{
		NeedBot = PlayerPrefs.GetInt("NeedBot");
		ColorCount[0] = PlayerPrefs.GetInt("RedPlayerCount");
		ColorCount[1] = PlayerPrefs.GetInt("BluePlayerCount");
		ColorCount[2] = PlayerPrefs.GetInt("GreenPlayerCount");
		ColorCount[3] = PlayerPrefs.GetInt("YellowPlayerCount");
		CountText[0].text = string.Concat(ColorCount[0]);
		CountText[1].text = string.Concat(ColorCount[1]);
		CountText[2].text = string.Concat(ColorCount[2]);
		CountText[3].text = string.Concat(ColorCount[3]);
		TournamentLevelCount = PlayerPrefs.GetInt("TournamentLevelCount");
		TournamentLevelCount++;
		Level2name = PlayerPrefs.GetString("Level2name");
		Level3name = PlayerPrefs.GetString("Level3name");
		Level4name = PlayerPrefs.GetString("Level4name");
		Level5name = PlayerPrefs.GetString("Level5name");
		PlayerNumers = PlayerPrefs.GetInt("PlayerNumers");
	}

	private void Start()
	{
		Source = GetComponent<AudioSource>();
		Invoke("RedOn", 0.2f);
	}

	private void RedOn()
	{
		BlackLight[0].SetActive(value: false);
		if (PlayerPrefs.GetInt("RedNewCount") > 0)
		{
			Source.PlayOneShot(CountPlusSound);
			Stars[0].SetActive(value: true);
			PlusObj[0].SetActive(value: true);
			ColorCount[0] += PlayerPrefs.GetInt("RedNewCount");
			Object.Instantiate(TextPrefab, CountText[0].transform.position, CountText[0].transform.rotation).GetComponentInChildren<Text>().text = "+" + PlayerPrefs.GetInt("RedNewCount");
			CountText[0].text = string.Concat(ColorCount[0]);
			switch (UnityEngine.Random.Range(1, 6))
			{
			case 1:
				Anim[0].Play("WinDance1");
				break;
			case 2:
				Anim[0].Play("WinDance2");
				break;
			case 3:
				Anim[0].Play("WinDance3");
				break;
			case 4:
				Anim[0].Play("WinDance4");
				break;
			case 5:
				Anim[0].Play("WinDance5");
				break;
			}
		}
		else if (PlayerPrefs.GetInt("RedNewCount") == 0)
		{
			Source.PlayOneShot(LuserSound);
			switch (UnityEngine.Random.Range(1, 4))
			{
			case 1:
				Anim[0].Play("SadAnimation1");
				break;
			case 2:
				Anim[0].Play("SadAnimation2");
				break;
			case 3:
				Anim[0].Play("SadAnimation3");
				break;
			}
		}
		Invoke("BlueOn", 2f);
	}

	private void BlueOn()
	{
		BlackLight[1].SetActive(value: false);
		if (PlayerPrefs.GetInt("BlueNewCount") > 0)
		{
			Source.PlayOneShot(CountPlusSound);
			Stars[1].SetActive(value: true);
			PlusObj[1].SetActive(value: true);
			ColorCount[1] += PlayerPrefs.GetInt("BlueNewCount");
			CountText[1].text = string.Concat(ColorCount[1]);
			Object.Instantiate(TextPrefab, CountText[1].transform.position, CountText[1].transform.rotation).GetComponentInChildren<Text>().text = "+" + PlayerPrefs.GetInt("BlueNewCount");
			switch (UnityEngine.Random.Range(1, 6))
			{
			case 1:
				Anim[1].Play("WinDance1");
				break;
			case 2:
				Anim[1].Play("WinDance2");
				break;
			case 3:
				Anim[1].Play("WinDance3");
				break;
			case 4:
				Anim[1].Play("WinDance4");
				break;
			case 5:
				Anim[1].Play("WinDance5");
				break;
			}
		}
		else if (PlayerPrefs.GetInt("BlueNewCount") == 0)
		{
			Source.PlayOneShot(LuserSound);
			switch (UnityEngine.Random.Range(1, 4))
			{
			case 1:
				Anim[1].Play("SadAnimation1");
				break;
			case 2:
				Anim[1].Play("SadAnimation2");
				break;
			case 3:
				Anim[1].Play("SadAnimation3");
				break;
			}
		}
		if (PlayerNumers == 1 || PlayerNumers == 3 || PlayerNumers == 4)
		{
			Invoke("GreenOn", 2f);
		}
		else if (PlayerNumers == 2)
		{
			if (NeedBot == 1)
			{
				Invoke("GreenOn", 2f);
			}
			else
			{
				Invoke("EndTournament", 2.5f);
			}
		}
	}

	private void GreenOn()
	{
		BlackLight[2].SetActive(value: false);
		if (PlayerPrefs.GetInt("GreenNewCount") > 0)
		{
			Source.PlayOneShot(CountPlusSound);
			Stars[2].SetActive(value: true);
			PlusObj[2].SetActive(value: true);
			ColorCount[2] += PlayerPrefs.GetInt("GreenNewCount");
			CountText[2].text = string.Concat(ColorCount[2]);
			Object.Instantiate(TextPrefab, CountText[2].transform.position, CountText[2].transform.rotation).GetComponentInChildren<Text>().text = "+" + PlayerPrefs.GetInt("GreenNewCount");
			switch (UnityEngine.Random.Range(1, 6))
			{
			case 1:
				Anim[2].Play("WinDance1");
				break;
			case 2:
				Anim[2].Play("WinDance2");
				break;
			case 3:
				Anim[2].Play("WinDance3");
				break;
			case 4:
				Anim[2].Play("WinDance4");
				break;
			case 5:
				Anim[2].Play("WinDance5");
				break;
			}
		}
		else if (PlayerPrefs.GetInt("GreenNewCount") == 0)
		{
			Source.PlayOneShot(LuserSound);
			switch (UnityEngine.Random.Range(1, 4))
			{
			case 1:
				Anim[2].Play("SadAnimation1");
				break;
			case 2:
				Anim[2].Play("SadAnimation2");
				break;
			case 3:
				Anim[2].Play("SadAnimation3");
				break;
			}
		}
		if (PlayerNumers == 1 || PlayerNumers == 4)
		{
			Invoke("YellowOn", 2f);
		}
		else if (PlayerNumers == 2 && NeedBot == 1)
		{
			Invoke("YellowOn", 2f);
		}
		else if (PlayerNumers == 3)
		{
			if (NeedBot == 1)
			{
				Invoke("YellowOn", 2f);
			}
			else
			{
				Invoke("EndTournament", 2.5f);
			}
		}
	}

	private void YellowOn()
	{
		BlackLight[3].SetActive(value: false);
		if (PlayerPrefs.GetInt("YellowNewCount") > 0)
		{
			Source.PlayOneShot(CountPlusSound);
			Stars[3].SetActive(value: true);
			PlusObj[3].SetActive(value: true);
			ColorCount[3] += PlayerPrefs.GetInt("YellowNewCount");
			CountText[3].text = string.Concat(ColorCount[3]);
			Object.Instantiate(TextPrefab, CountText[3].transform.position, CountText[3].transform.rotation).GetComponentInChildren<Text>().text = "+" + PlayerPrefs.GetInt("YellowNewCount");
			switch (UnityEngine.Random.Range(1, 6))
			{
			case 1:
				Anim[3].Play("WinDance1");
				break;
			case 2:
				Anim[3].Play("WinDance2");
				break;
			case 3:
				Anim[3].Play("WinDance3");
				break;
			case 4:
				Anim[3].Play("WinDance4");
				break;
			case 5:
				Anim[3].Play("WinDance5");
				break;
			}
		}
		else if (PlayerPrefs.GetInt("YellowNewCount") == 0)
		{
			Source.PlayOneShot(LuserSound);
			switch (UnityEngine.Random.Range(1, 4))
			{
			case 1:
				Anim[3].Play("SadAnimation1");
				break;
			case 2:
				Anim[3].Play("SadAnimation2");
				break;
			case 3:
				Anim[3].Play("SadAnimation3");
				break;
			}
		}
		Invoke("EndTournament", 2.5f);
	}

	private void EndTournament()
	{
		PlayerPrefs.SetInt("RedPlayerCount", ColorCount[0]);
		PlayerPrefs.SetInt("BluePlayerCount", ColorCount[1]);
		PlayerPrefs.SetInt("GreenPlayerCount", ColorCount[2]);
		PlayerPrefs.SetInt("YellowPlayerCount", ColorCount[3]);
		if (TournamentLevelCount == 1)
		{
			PlayerPrefs.SetInt("TournamentLevelCount", TournamentLevelCount);
			SceneManager.LoadScene(Level2name);
		}
		else if (TournamentLevelCount == 2)
		{
			PlayerPrefs.SetInt("TournamentLevelCount", TournamentLevelCount);
			SceneManager.LoadScene(Level3name);
		}
		else if (TournamentLevelCount == 3 && PlayerPrefs.GetInt("IsBigTournament") == 0)
		{
			int num = Mathf.Max(ColorCount);
			Source.PlayOneShot(WinnerSound);
			for (int i = 0; i < ColorCount.Length; i++)
			{
				if (ColorCount[i] == num)
				{
					switch (i)
					{
					case 0:
						Anim[0].Play("Winner");
						Confetti[0].SetActive(value: true);
						break;
					case 1:
						Anim[1].Play("Winner");
						Confetti[1].SetActive(value: true);
						break;
					case 2:
						Anim[2].Play("Winner");
						Confetti[2].SetActive(value: true);
						break;
					case 3:
						Anim[3].Play("Winner");
						Confetti[3].SetActive(value: true);
						break;
					}
					Invoke("GetButtons", 2f);
				}
			}
		}
		else if (TournamentLevelCount == 3 && PlayerPrefs.GetInt("IsBigTournament") == 1)
		{
			PlayerPrefs.SetInt("TournamentLevelCount", TournamentLevelCount);
			SceneManager.LoadScene(Level4name);
		}
		else if (TournamentLevelCount == 4 && PlayerPrefs.GetInt("IsBigTournament") == 1)
		{
			PlayerPrefs.SetInt("TournamentLevelCount", TournamentLevelCount);
			SceneManager.LoadScene(Level5name);
		}
		else
		{
			if (TournamentLevelCount != 5 || PlayerPrefs.GetInt("IsBigTournament") != 1)
			{
				return;
			}
			int num2 = Mathf.Max(ColorCount);
			Source.PlayOneShot(WinnerSound);
			for (int j = 0; j < ColorCount.Length; j++)
			{
				if (ColorCount[j] == num2)
				{
					switch (j)
					{
					case 0:
						Anim[0].Play("Winner");
						Confetti[0].SetActive(value: true);
						break;
					case 1:
						Anim[1].Play("Winner");
						Confetti[1].SetActive(value: true);
						break;
					case 2:
						Anim[2].Play("Winner");
						Confetti[2].SetActive(value: true);
						break;
					case 3:
						Anim[3].Play("Winner");
						Confetti[3].SetActive(value: true);
						break;
					}
				}
				Invoke("GetButtons", 2f);
			}
		}
	}

	private void GetButtons()
	{
		ButtonMenu.SetActive(value: true);
	}

	public void MainMenuButton()
	{
		Source.PlayOneShot(ButtonSound);
		SceneManager.LoadScene(1);
	}
}
