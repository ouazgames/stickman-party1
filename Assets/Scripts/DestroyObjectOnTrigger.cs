using UnityEngine;

public class DestroyObjectOnTrigger : MonoBehaviour
{
	private void OnTriggerEnter(Collider _collider)
	{
		UnityEngine.Object.Destroy(_collider.gameObject);
	}
}
