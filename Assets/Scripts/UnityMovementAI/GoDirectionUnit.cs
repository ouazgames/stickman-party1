using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(SteeringBasics))]
	public class GoDirectionUnit : MonoBehaviour
	{
		public Vector3 direction;

		private MovementAIRigidbody rb;

		private SteeringBasics steeringBasics;

		private void Start()
		{
			rb = GetComponent<MovementAIRigidbody>();
			steeringBasics = GetComponent<SteeringBasics>();
		}

		private void FixedUpdate()
		{
			rb.Velocity = direction.normalized * steeringBasics.maxVelocity;
			steeringBasics.LookWhereYoureGoing();
			UnityEngine.Debug.DrawLine(rb.ColliderPosition, rb.ColliderPosition + direction.normalized, Color.cyan, 0f, depthTest: false);
		}
	}
}
