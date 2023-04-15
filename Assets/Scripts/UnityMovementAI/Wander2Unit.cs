using UnityEngine;

namespace UnityMovementAI
{
	public class Wander2Unit : MonoBehaviour
	{
		private SteeringBasics steeringBasics;

		private Wander2 wander;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			wander = GetComponent<Wander2>();
		}

		private void FixedUpdate()
		{
			Vector3 steering = wander.GetSteering();
			steeringBasics.Steer(steering);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
