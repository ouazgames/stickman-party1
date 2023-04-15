using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(Flee))]
	public class Evade : MonoBehaviour
	{
		public float maxPrediction = 1f;

		private Flee flee;

		private void Awake()
		{
			flee = GetComponent<Flee>();
		}

		public Vector3 GetSteering(MovementAIRigidbody target)
		{
			float magnitude = (target.Position - base.transform.position).magnitude;
			float magnitude2 = target.Velocity.magnitude;
			float d;
			if (magnitude2 <= magnitude / maxPrediction)
			{
				d = maxPrediction;
			}
			else
			{
				d = magnitude / magnitude2;
				d *= 0.9f;
			}
			Vector3 targetPosition = target.Position + target.Velocity * d;
			return flee.GetSteering(targetPosition);
		}
	}
}
