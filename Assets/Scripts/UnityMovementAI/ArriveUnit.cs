using UnityEngine;

namespace UnityMovementAI
{
	public class ArriveUnit : MonoBehaviour
	{
		public Vector3 targetPosition;

		private SteeringBasics steeringBasics;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
		}

		private void FixedUpdate()
		{
			Vector3 linearAcceleration = steeringBasics.Arrive(targetPosition);
			steeringBasics.Steer(linearAcceleration);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
