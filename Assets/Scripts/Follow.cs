using UnityEngine;

[ExecuteInEditMode]
public class Follow : MonoBehaviour
{
	public Transform target;

	public Vector3 offset;

	private void LateUpdate()
	{
		if ((bool)target)
		{
			base.transform.position = target.position + offset;
		}
	}
}
