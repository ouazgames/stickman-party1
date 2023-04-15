using UnityEngine;

public class CheckRate : MonoBehaviour
{
	public int RateCount;

	private void Awake()
	{
		RateCount = PlayerPrefs.GetInt("RateCount");
	}

	private void Start()
	{
		if (RateCount < 2)
		{
			RateCount++;
			PlayerPrefs.SetInt("RateCount", RateCount);
		}
		else if (RateCount == 2)
		{
			PlayerPrefs.SetInt("RateCount", 2);
		}
	}
}
