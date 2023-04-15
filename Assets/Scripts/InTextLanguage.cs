using UnityEngine;
using UnityEngine.UI;

public class InTextLanguage : MonoBehaviour
{
	[Header("Text")]
	public string Russian = "";

	public string English = "";

	public string Spanish = "";

	public string Portuguese = "";

	private Text LangText;

	[Header("Other")]
	private int langIndex = 1;

	private string[] langArray = new string[4]
	{
		"Russian",
		"English",
		"Spanish",
		"Portuguese"
	};

	private void Start()
	{
		LangText = GetComponent<Text>();
		for (int i = 0; i < langArray.Length; i++)
		{
			if (PlayerPrefs.GetString("Language") == langArray[0])
			{
				LangText.text = (Russian ?? "");
			}
			else if (PlayerPrefs.GetString("Language") == langArray[1])
			{
				LangText.text = (English ?? "");
			}
			else if (PlayerPrefs.GetString("Language") == langArray[2])
			{
				LangText.text = (Spanish ?? "");
			}
			else if (PlayerPrefs.GetString("Language") == langArray[3])
			{
				LangText.text = (Portuguese ?? "");
			}
		}
	}
}
