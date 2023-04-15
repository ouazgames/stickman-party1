using System.Collections.Generic;
using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(MovementAIRigidbody))]
	public class Separation : MonoBehaviour
	{
		public float sepMaxAcceleration = 25f;

		public float maxSepDist = 1f;

		private MovementAIRigidbody rb;

		private void Awake()
		{
			rb = GetComponent<MovementAIRigidbody>();
		}

		public Vector3 GetSteering(ICollection<MovementAIRigidbody> targets)
		{
			Vector3 vector = Vector3.zero;
			foreach (MovementAIRigidbody target in targets)
			{
				Vector3 v = rb.ColliderPosition - target.ColliderPosition;
				float magnitude = v.magnitude;
				if (magnitude < maxSepDist)
				{
					float d = sepMaxAcceleration * (maxSepDist - magnitude) / (maxSepDist - rb.Radius - target.Radius);
					v = rb.ConvertVector(v);
					v.Normalize();
					vector += v * d;
				}
			}
			return vector;
		}
	}
}
