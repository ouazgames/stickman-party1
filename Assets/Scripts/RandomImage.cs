using UnityEngine;

public class RandomImage : MonoBehaviour
{
	public GameObject[] Image;

	private void Start()
	{
		switch (UnityEngine.Random.Range(1, 3))
		{
		case 1:
			Image[0].SetActive(value: true);
			break;
		case 2:
			Image[1].SetActive(value: true);
			break;
		}
	}

	private void Update()
	{
	}
}
