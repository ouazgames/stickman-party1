using UnityEngine;

public class WaterMover : MonoBehaviour
{
	public float Speed;

	public float LifeTime = 35f;

	private void Start()
	{
		UnityEngine.Object.Destroy(base.gameObject, LifeTime);
	}

	public void Update()
	{
		base.transform.position += base.transform.up * Speed * Time.deltaTime;
	}
}
