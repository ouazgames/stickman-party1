using UnityEngine;

namespace UnityMovementAI
{
	public class DebugSphereCast : MonoBehaviour
	{
		public float radius;

		public Vector3 hitPosition;

		public Vector3 hitSphereCenter;

		public float slopeLimit = 80f;

		private void Start()
		{
			SphereCollider component = GetComponent<SphereCollider>();
			radius = Mathf.Max(base.transform.localScale.x, base.transform.localScale.y, base.transform.localScale.z) * component.radius;
		}

		private void Update()
		{
			hitPosition = Vector3.zero;
			hitSphereCenter = Vector3.zero;
			if (!Physics.SphereCast(base.transform.position, radius, Vector3.down, out RaycastHit hitInfo))
			{
				return;
			}
			hitPosition = hitInfo.point;
			hitSphereCenter = base.transform.position + Vector3.down * (hitInfo.distance + radius);
			SteeringBasics.DebugCross(hitPosition, 0.5f, Color.yellow);
			SteeringBasics.DebugCross(hitSphereCenter, 0.5f, Color.red);
			if (IsWall(hitInfo.normal))
			{
				Vector3 direction = Vector3.Cross(Vector3.Cross(hitInfo.normal, Vector3.down), hitInfo.normal);
				if (Physics.Raycast(hitInfo.point, direction, out RaycastHit hitInfo2))
				{
					SteeringBasics.DebugCross(hitInfo2.point, 0.5f, Color.magenta);
				}
			}
		}

		private bool IsWall(Vector3 surfNormal)
		{
			return Vector3.Angle(Vector3.up, surfNormal) > slopeLimit;
		}
	}
}
