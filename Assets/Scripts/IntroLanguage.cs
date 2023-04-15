using UnityEngine;

public class IntroLanguage : MonoBehaviour
{
	[Header("Other")]
	private int langIndex = 1;

	private string[] langArray = new string[4]
	{
		"Russian",
		"English",
		"Spanish",
		"Portuguese"
	};

	private void Awake()
	{
		if (!PlayerPrefs.HasKey("Language"))
		{
			if (Application.systemLanguage == SystemLanguage.Russian || Application.systemLanguage == SystemLanguage.Ukrainian || Application.systemLanguage == SystemLanguage.Belarusian)
			{
				PlayerPrefs.SetString("Language", "Russian");
			}
			else if (Application.systemLanguage == SystemLanguage.Spanish)
			{
				PlayerPrefs.SetString("Language", "Spanish");
			}
			else if (Application.systemLanguage == SystemLanguage.Portuguese)
			{
				PlayerPrefs.SetString("Language", "Portuguese");
			}
			else
			{
				PlayerPrefs.SetString("Language", "English");
			}
		}
	}
}
