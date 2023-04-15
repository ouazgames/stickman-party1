using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(SteeringBasics))]
	public class OffsetPursuit : MonoBehaviour
	{
		public float maxPrediction = 1f;

		private MovementAIRigidbody rb;

		private SteeringBasics steeringBasics;

		private void Awake()
		{
			rb = GetComponent<MovementAIRigidbody>();
			steeringBasics = GetComponent<SteeringBasics>();
		}

		public Vector3 GetSteering(MovementAIRigidbody target, Vector3 offset)
		{
			Vector3 targetPos;
			return GetSteering(target, offset, out targetPos);
		}

		public Vector3 GetSteering(MovementAIRigidbody target, Vector3 offset, out Vector3 targetPos)
		{
			Vector3 a = target.Position + target.Transform.TransformDirection(offset);
			float magnitude = (a - base.transform.position).magnitude;
			float magnitude2 = rb.Velocity.magnitude;
			float d = (!(magnitude2 <= magnitude / maxPrediction)) ? (magnitude / magnitude2) : maxPrediction;
			targetPos = a + target.Velocity * d;
			return steeringBasics.Arrive(targetPos);
		}
	}
}
