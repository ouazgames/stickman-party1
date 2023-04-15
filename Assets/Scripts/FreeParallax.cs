using UnityEngine;

public class FreeParallax : MonoBehaviour
{
	public float Speed;

	private void Update()
	{
		base.transform.position += base.transform.right * Speed * Time.deltaTime;
	}
}
