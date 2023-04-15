using UnityEngine;
using UnityEngine.UI;

public class RandomLevel : MonoBehaviour
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
		else
		{
			if (!IsLevel1)
			{
				return;
			}
			if (LevelNum == 0)
			{
				LevelName = "Bumpercar";
			}
			else if (LevelNum == 1)
			{
				LevelName = "BoxGame";
			}
			else if (LevelNum == 2)
			{
				LevelName = "ColorDash";
			}
			else if (LevelNum == 3)
			{
				RandomlevelName = UnityEngine.Random.Range(1, 5);
				if (RandomlevelName == 1)
				{
					LevelName = "SampleScene";
				}
				else if (RandomlevelName == 2)
				{
					LevelName = "RunMap2";
				}
				else if (RandomlevelName == 3)
				{
					LevelName = "RunMap3";
				}
				else if (RandomlevelName == 4)
				{
					LevelName = "RunMap4";
				}
			}
			else if (LevelNum == 4)
			{
				RandomlevelName = UnityEngine.Random.Range(1, 7);
				if (RandomlevelName == 1)
				{
					LevelName = "TankMap1";
				}
				else if (RandomlevelName == 2)
				{
					LevelName = "TankMap2";
				}
				else if (RandomlevelName == 3)
				{
					LevelName = "TankMap3";
				}
				else if (RandomlevelName == 4)
				{
					LevelName = "TankMap4";
				}
				else if (RandomlevelName == 5)
				{
					LevelName = "TankMap5";
				}
				else if (RandomlevelName == 6)
				{
					LevelName = "TankMap6";
				}
			}
			else if (LevelNum == 5)
			{
				RandomlevelName = UnityEngine.Random.Range(1, 7);
				if (RandomlevelName == 1)
				{
					LevelName = "RaceMap1";
				}
				else if (RandomlevelName == 2)
				{
					LevelName = "RaceMap2";
				}
				else if (RandomlevelName == 3)
				{
					LevelName = "RaceMap3";
				}
				else if (RandomlevelName == 4)
				{
					LevelName = "RaceMap4";
				}
				else if (RandomlevelName == 5)
				{
					LevelName = "RaceMap5";
				}
				else if (RandomlevelName == 6)
				{
					LevelName = "RaceMap6";
				}
			}
			else if (LevelNum == 6)
			{
				LevelName = "Sumo";
			}
			else if (LevelNum == 7)
			{
				LevelName = "SeaBattle";
			}
			else if (LevelNum == 8)
			{
				LevelName = "Ghost";
			}
		}
	}

	private void GetNewLevel()
	{
		LevelNum = UnityEngine.Random.Range(0, LevelSprite.Length);
		GetComponent<Image>().sprite = LevelSprite[LevelNum];
		if (LevelNum == 0)
		{
			LevelName = "Bumpercar";
		}
		else if (LevelNum == 1)
		{
			LevelName = "BoxGame";
		}
		else if (LevelNum == 2)
		{
			LevelName = "ColorDash";
		}
		else if (LevelNum == 3)
		{
			RandomlevelName = UnityEngine.Random.Range(1, 5);
			if (RandomlevelName == 1)
			{
				LevelName = "SampleScene";
			}
			else if (RandomlevelName == 2)
			{
				LevelName = "RunMap2";
			}
			else if (RandomlevelName == 3)
			{
				LevelName = "RunMap3";
			}
			else if (RandomlevelName == 4)
			{
				LevelName = "RunMap4";
			}
		}
		else if (LevelNum == 4)
		{
			RandomlevelName = UnityEngine.Random.Range(1, 7);
			if (RandomlevelName == 1)
			{
				LevelName = "TankMap1";
			}
			else if (RandomlevelName == 2)
			{
				LevelName = "TankMap2";
			}
			else if (RandomlevelName == 3)
			{
				LevelName = "TankMap3";
			}
			else if (RandomlevelName == 4)
			{
				LevelName = "TankMap4";
			}
			else if (RandomlevelName == 5)
			{
				LevelName = "TankMap5";
			}
			else if (RandomlevelName == 6)
			{
				LevelName = "TankMap6";
			}
		}
		else if (LevelNum == 5)
		{
			RandomlevelName = UnityEngine.Random.Range(1, 7);
			if (RandomlevelName == 1)
			{
				LevelName = "RaceMap1";
			}
			else if (RandomlevelName == 2)
			{
				LevelName = "RaceMap2";
			}
			else if (RandomlevelName == 3)
			{
				LevelName = "RaceMap3";
			}
			else if (RandomlevelName == 4)
			{
				LevelName = "RaceMap4";
			}
			else if (RandomlevelName == 5)
			{
				LevelName = "RaceMap5";
			}
			else if (RandomlevelName == 6)
			{
				LevelName = "RaceMap6";
			}
		}
		else if (LevelNum == 6)
		{
			LevelName = "Sumo";
		}
		else if (LevelNum == 7)
		{
			LevelName = "SeaBattle";
		}
		else if (LevelNum == 8)
		{
			LevelName = "Ghost";
		}
		if (IsLevel2)
		{
			if (LevelName == Level1.GetComponent<RandomLevel>().LevelName)
			{
				GetNewLevel();
			}
		}
		else if (IsLevel3 && (LevelName == Level1.GetComponent<RandomLevel>().LevelName || LevelName == Level2.GetComponent<RandomLevel>().LevelName))
		{
			GetNewLevel();
		}
	}
}
