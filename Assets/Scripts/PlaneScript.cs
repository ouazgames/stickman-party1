using UnityEngine;

public class PlaneScript : MonoBehaviour
{
	public float ForcePower;

	public GameObject BoxPrefab;

	public Transform SpawnTransform;

	private float WaitTime;

	private bool IsPosition;

	private float RandomCount;

	private void Start()
	{
		GetComponent<Rigidbody2D>().AddForce(base.transform.right * ForcePower, ForceMode2D.Impulse);
		RandomCount = UnityEngine.Random.Range(0.1f, 0.5f);
	}

	private void OnTriggerEnter2D(Collider2D collision)
	{
		if (collision.tag == "SpawnPos")
		{
			IsPosition = true;
		}
		else if (collision.tag == "Finish")
		{
			UnityEngine.Object.Destroy(base.gameObject);
		}
	}

	private void Update()
	{
		if (IsPosition)
		{
			WaitTime += Time.deltaTime;
		}
		if (WaitTime >= RandomCount)
		{
			Object.Instantiate(BoxPrefab, SpawnTransform.position, Quaternion.identity);
			WaitTime = 0f;
			IsPosition = false;
		}
	}
}
