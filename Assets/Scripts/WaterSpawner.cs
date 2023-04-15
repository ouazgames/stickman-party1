using System.Collections;
using UnityEngine;

public class WaterSpawner : MonoBehaviour
{
	public GameObject hazard;

	public Vector3 spawnValues;

	public int hazardCount;

	public float spawnWait;

	public float startWait;

	public float waveWait;

	private void Start()
	{
		StartCoroutine(SpawnWaves());
	}

	private IEnumerator SpawnWaves()
	{
		yield return new WaitForSeconds(startWait);
		while (true)
		{
			for (int i = 0; i < hazardCount; i++)
			{
				Vector3 position = base.gameObject.transform.position;
				Object.Instantiate(hazard, position, base.transform.rotation);
				yield return new WaitForSeconds(spawnWait);
			}
			yield return new WaitForSeconds(waveWait);
		}
	}
}
