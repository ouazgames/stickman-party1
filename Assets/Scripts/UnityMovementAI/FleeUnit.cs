using UnityEngine;

namespace UnityMovementAI
{
	public class FleeUnit : MonoBehaviour
	{
		public Transform target;

		private SteeringBasics steeringBasics;

		private Flee flee;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			flee = GetComponent<Flee>();
		}

		private void FixedUpdate()
		{
			Vector3 steering = flee.GetSteering(target.position);
			steeringBasics.Steer(steering);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
