using UnityEngine;

public class SawScript : MonoBehaviour
{
	public float RotationSpeed;

	private void Update()
	{
		base.transform.Rotate(Vector3.forward * RotationSpeed * Time.deltaTime);
	}
}
