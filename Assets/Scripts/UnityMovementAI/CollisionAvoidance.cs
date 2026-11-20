using System.Collections.Generic;
using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(MovementAIRigidbody))]
	public class CollisionAvoidance : MonoBehaviour
	{
		public float maxAcceleration = 15f;

		[Tooltip("How much space can be between two characters before they are considered colliding")]
		public float distanceBetween;

		private MovementAIRigidbody rb;

		private void Awake()
		{
			rb = GetComponent<MovementAIRigidbody>();
		}

		public Vector3 GetSteering(ICollection<MovementAIRigidbody> targets)
		{
			Vector3 zero = Vector3.zero;
			float num = float.PositiveInfinity;
			MovementAIRigidbody movementAIRigidbody = null;
			float value2 = 0f;
			float value3 = 0f;
			float value4 = 0f;
			Vector3 a = Vector3.zero;
			Vector3 a2 = Vector3.zero;
			foreach (MovementAIRigidbody target in targets)
			{
				Vector3 vector = rb.ColliderPosition - target.ColliderPosition;
				Vector3 vector2 = rb.RealVelocity - target.RealVelocity;
				float magnitude = vector.magnitude;
				float magnitude2 = vector2.magnitude;
				if (magnitude2 != 0f)
				{
					float value5 = -1f * Vector3.Dot(vector, vector2) / (magnitude2 * magnitude2);
					float magnitude3 = (vector + vector2 * value5).magnitude;
					if (!(magnitude3 > rb.Radius + target.Radius + distanceBetween) && value5 > 0f && value5 < num)
					{
						num = value5;
						movementAIRigidbody = target;
						value2 = magnitude3;
						value3 = magnitude;
						a = vector;
						a2 = vector2;
						value4 = target.Radius;
					}
				}
			}
			if (movementAIRigidbody == null)
			{
				return zero;
			}
			zero = ((!(value2 <= 0f) && !(value3 < rb.Radius + value4 + distanceBetween)) ? (a + a2 * num) : (rb.ColliderPosition - movementAIRigidbody.ColliderPosition));
			zero = rb.ConvertVector(zero);
			zero.Normalize();
			return zero * maxAcceleration;
		}
	}
}
