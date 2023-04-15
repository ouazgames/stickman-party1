using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(MovementAIRigidbody))]
	public class Flee : MonoBehaviour
	{
		public float panicDist = 3.5f;

		public bool decelerateOnStop = true;

		public float maxAcceleration = 10f;

		public float timeToTarget = 0.1f;

		private MovementAIRigidbody rb;

		private void Awake()
		{
			rb = GetComponent<MovementAIRigidbody>();
		}

		public Vector3 GetSteering(Vector3 targetPosition)
		{
			Vector3 v = base.transform.position - targetPosition;
			if (v.magnitude > panicDist)
			{
				if (decelerateOnStop && rb.Velocity.magnitude > 0.001f)
				{
					v = -rb.Velocity / timeToTarget;
					if (v.magnitude > maxAcceleration)
					{
						v = GiveMaxAccel(v);
					}
					return v;
				}
				rb.Velocity = Vector3.zero;
				return Vector3.zero;
			}
			return GiveMaxAccel(v);
		}

		private Vector3 GiveMaxAccel(Vector3 v)
		{
			v.Normalize();
			v *= maxAcceleration;
			return v;
		}
	}
}
