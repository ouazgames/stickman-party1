using UnityEngine;

public class FloatingObject : MonoBehaviour
{
	public Vector3 floatingArea;

	private void OnDrawGizmosSelected()
	{
		Gizmos.DrawWireCube(base.transform.position, floatingArea);
	}
}
