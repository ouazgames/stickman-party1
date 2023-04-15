using UnityEngine;
using UnityEngine.UI;

public class RandomLevelTanks : MonoBehaviour
{
	public Sprite[] LevelSprite;

	private int LevelNum;

	public string LevelName;

	private int RandomlevelName;

	public bool IsLevel1;

	public bool IsLevel2;

	public bool IsLevel3;

	public GameObject Level1;

	public GameObject Level2;

	private void Start()
	{
		LevelNum = UnityEngine.Random.Range(0, LevelSprite.Length);
		GetComponent<Image>().sprite = LevelSprite[LevelNum];
		if (IsLevel2)
		{
			Invoke("GetNewLevel", 1f);
		}
		else if (IsLevel3)
		{
			Invoke("GetNewLevel", 2f);
		}
		else if (IsLevel1)
		{
			if (LevelNum == 0)
			{
				LevelName = "TankMap1";
			}
			else if (LevelNum == 1)
			{
				LevelName = "TankMap2";
			}
			else if (LevelNum == 2)
			{
				LevelName = "TankMap3";
			}
			else if (LevelNum == 3)
			{
				LevelName = "TankMap4";
			}
			else if (LevelNum == 4)
			{
				LevelName = "TankMap5";
			}
			else if (LevelNum == 5)
			{
				LevelName = "TankMap6";
			}
			else if (LevelNum == 6)
			{
				LevelName = "TankMap7";
			}
			else if (LevelNum == 7)
			{
				LevelName = "TankMap8";
			}
		}
	}

	private void GetNewLevel()
	{
		LevelNum = UnityEngine.Random.Range(0, LevelSprite.Length);
		GetComponent<Image>().sprite = LevelSprite[LevelNum];
		if (LevelNum == 0)
		{
			LevelName = "TankMap1";
		}
		else if (LevelNum == 1)
		{
			LevelName = "TankMap2";
		}
		else if (LevelNum == 2)
		{
			LevelName = "TankMap3";
		}
		else if (LevelNum == 3)
		{
			LevelName = "TankMap4";
		}
		else if (LevelNum == 4)
		{
			LevelName = "TankMap5";
		}
		else if (LevelNum == 5)
		{
			LevelName = "TankMap6";
		}
		else if (LevelNum == 6)
		{
			LevelName = "TankMap7";
		}
		else if (LevelNum == 7)
		{
			LevelName = "TankMap8";
		}
		if (IsLevel2)
		{
			if (LevelName == Level1.GetComponent<RandomLevelTanks>().LevelName)
			{
				GetNewLevel();
			}
		}
		else if (IsLevel3 && (LevelName == Level1.GetComponent<RandomLevelTanks>().LevelName || LevelName == Level2.GetComponent<RandomLevelTanks>().LevelName))
		{
			GetNewLevel();
		}
	}
}
