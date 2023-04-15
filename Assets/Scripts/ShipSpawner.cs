using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShipSpawner : MonoBehaviour
{
	public Transform Path;

	public GameObject ShipRed;

	public GameObject ShipBlue;

	public GameObject ShipGreen;

	public GameObject ShipYellow;

	public List<GameObject> Ships;

	public float spawnWait;

	public float startWait;

	public float waveWait;

	private int PlayerNumers;

	public float MinValue;

	public float MaxValue;

	private void Awake()
	{
		PlayerNumers = PlayerPrefs.GetInt("PlayerNumers");
	}

	private void Start()
	{
		spawnWait = UnityEngine.Random.Range(MinValue, MaxValue);
		waveWait = UnityEngine.Random.Range(MinValue, MaxValue);
		Ships.Add(ShipRed);
		Ships.Add(ShipBlue);
		Ships.Add(ShipGreen);
		Ships.Add(ShipYellow);
		StartCoroutine(SpawnWaves());
	}

	private IEnumerator SpawnWaves()
	{
		yield return new WaitForSeconds(startWait);
		while (true)
		{
			int index = UnityEngine.Random.Range(0, Ships.Count);
			Vector3 position = base.gameObject.transform.position;
			Quaternion rotation = base.gameObject.transform.rotation;
			GameObject gameObject = UnityEngine.Object.Instantiate(Ships[index], position, rotation);
			gameObject.name = Ships[index].name;
			gameObject.GetComponent<SharkScript>().Path = Path;
			yield return new WaitForSeconds(spawnWait);
			yield return new WaitForSeconds(waveWait);
		}
	}
}
