using UnityEngine;

namespace UnityMovementAI
{
	public class InterposeUnit : MonoBehaviour
	{
		public MovementAIRigidbody target1;

		public MovementAIRigidbody target2;

		private SteeringBasics steeringBasics;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
		}

		private void FixedUpdate()
		{
			Vector3 linearAcceleration = steeringBasics.Interpose(target1, target2);
			steeringBasics.Steer(linearAcceleration);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
