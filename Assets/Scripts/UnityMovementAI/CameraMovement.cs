using UnityEngine;

namespace UnityMovementAI
{
	public class CameraMovement : MonoBehaviour
	{
		public Transform target;

		private Vector3 displacement;

		private void Start()
		{
			displacement = base.transform.position - target.position;
		}

		private void LateUpdate()
		{
			if (target != null)
			{
				base.transform.position = target.position + displacement;
			}
		}
	}
}
