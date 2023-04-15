using UnityEngine;

namespace UnityMovementAI
{
	public class SeekUnit : MonoBehaviour
	{
		public Transform target;

		private SteeringBasics steeringBasics;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
		}

		private void FixedUpdate()
		{
			Vector3 linearAcceleration = steeringBasics.Seek(target.position);
			steeringBasics.Steer(linearAcceleration);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
