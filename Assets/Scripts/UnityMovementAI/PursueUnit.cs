using UnityEngine;

namespace UnityMovementAI
{
	public class PursueUnit : MonoBehaviour
	{
		public MovementAIRigidbody target;

		private SteeringBasics steeringBasics;

		private Pursue pursue;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			pursue = GetComponent<Pursue>();
		}

		private void FixedUpdate()
		{
			Vector3 steering = pursue.GetSteering(target);
			steeringBasics.Steer(steering);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
