using UnityEngine;
using UnityEngine.UI;

public class GameLanguage : MonoBehaviour
{
	[Header("Text")]
	public Text[] LoadingText;

	[Header("Other")]
	private int langIndex = 1;

	private string[] langArray = new string[3]
	{
		"ru_RU",
		"en_US",
		"cn_CN"
	};

	private void Start()
	{
		for (int i = 0; i < langArray.Length; i++)
		{
			if (PlayerPrefs.GetString("Language") == langArray[0])
			{
				LoadingText[0].enabled = true;
			}
			else if (PlayerPrefs.GetString("Language") == langArray[1])
			{
				LoadingText[1].enabled = true;
			}
			else if (PlayerPrefs.GetString("Language") == langArray[2])
			{
				LoadingText[2].enabled = true;
			}
		}
	}
}
