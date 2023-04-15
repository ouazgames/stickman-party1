using UnityEngine;
using UnityEngine.UI;

public class ChoseButtonScript : MonoBehaviour
{
	public string MyLevelName = "";

	public Text Mytext;

	public BigTournament BT;

	public VsTournamentScript VSScript;

	public bool IsRace;

	public bool IsTanks;

	public bool IsRun;

	public bool IsVS;

	public void MyButton()
	{
		if (!IsVS)
		{
			if (BT.GameCount >= 5)
			{
				return;
			}
			if (IsRace)
			{
				switch (UnityEngine.Random.Range(1, 7))
				{
				case 1:
					MyLevelName = "RaceMap1";
					break;
				case 2:
					MyLevelName = "RaceMap2";
					break;
				case 3:
					MyLevelName = "RaceMap3";
					break;
				case 4:
					MyLevelName = "RaceMap4";
					break;
				case 5:
					MyLevelName = "RaceMap5";
					break;
				case 6:
					MyLevelName = "RaceMap6";
					break;
				}
			}
			else if (IsRun)
			{
				switch (UnityEngine.Random.Range(1, 5))
				{
				case 1:
					MyLevelName = "SampleScene";
					break;
				case 2:
					MyLevelName = "RunMap2";
					break;
				case 3:
					MyLevelName = "RunMap3";
					break;
				case 4:
					MyLevelName = "RunMap4";
					break;
				}
			}
			else if (IsTanks)
			{
				switch (UnityEngine.Random.Range(1, 9))
				{
				case 1:
					MyLevelName = "TankMap1";
					break;
				case 2:
					MyLevelName = "TankMap2";
					break;
				case 3:
					MyLevelName = "TankMap3";
					break;
				case 4:
					MyLevelName = "TankMap4";
					break;
				case 5:
					MyLevelName = "TankMap5";
					break;
				case 6:
					MyLevelName = "TankMap6";
					break;
				case 7:
					MyLevelName = "TankMap7";
					break;
				case 8:
					MyLevelName = "TankMap8";
					break;
				}
			}
			BT.GameCount++;
			BT.PlaySound();
			BT.Levelname[BT.GameCount - 1] = MyLevelName;
			Mytext.text = string.Concat(BT.GameCount);
		}
		else if (VSScript.GameCount < 3)
		{
			VSScript.GameCount++;
			VSScript.PlaySound();
			VSScript.Levelname[VSScript.GameCount - 1] = MyLevelName;
			Mytext.text = string.Concat(VSScript.GameCount);
		}
	}

	private void FixedUpdate()
	{
		if (!IsVS)
		{
			if (BT.GameCount == 0)
			{
				Mytext.text = "";
			}
		}
		else if (VSScript.GameCount == 0)
		{
			Mytext.text = "";
		}
	}
}
