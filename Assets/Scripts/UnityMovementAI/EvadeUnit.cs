using UnityEngine;

namespace UnityMovementAI
{
	public class EvadeUnit : MonoBehaviour
	{
		public MovementAIRigidbody target;

		private SteeringBasics steeringBasics;

		private Evade evade;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			evade = GetComponent<Evade>();
		}

		private void FixedUpdate()
		{
			Vector3 steering = evade.GetSteering(target);
			steeringBasics.Steer(steering);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
