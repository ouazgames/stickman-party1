using UnityEngine;

namespace UnityMovementAI
{
	public class Wander1Unit : MonoBehaviour
	{
		private SteeringBasics steeringBasics;

		private Wander1 wander;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			wander = GetComponent<Wander1>();
		}

		private void FixedUpdate()
		{
			Vector3 steering = wander.GetSteering();
			steeringBasics.Steer(steering);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
