using UnityEngine;

public class DestroyByTime : MonoBehaviour
{
	public float LifeTime;

	private void Start()
	{
		UnityEngine.Object.Destroy(base.gameObject, LifeTime);
	}
}
