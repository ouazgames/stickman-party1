using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(SteeringBasics))]
	public class Pursue : MonoBehaviour
	{
		public float maxPrediction = 1f;

		private MovementAIRigidbody rb;

		private SteeringBasics steeringBasics;

		private void Awake()
		{
			rb = GetComponent<MovementAIRigidbody>();
			steeringBasics = GetComponent<SteeringBasics>();
		}

		public Vector3 GetSteering(MovementAIRigidbody target)
		{
			float magnitude = (target.Position - base.transform.position).magnitude;
			float magnitude2 = rb.Velocity.magnitude;
			float d = (!(magnitude2 <= magnitude / maxPrediction)) ? (magnitude / magnitude2) : maxPrediction;
			Vector3 targetPosition = target.Position + target.Velocity * d;
			return steeringBasics.Seek(targetPosition);
		}
	}
}
