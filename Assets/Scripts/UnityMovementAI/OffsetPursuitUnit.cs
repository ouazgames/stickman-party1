using UnityEngine;

namespace UnityMovementAI
{
	public class OffsetPursuitUnit : MonoBehaviour
	{
		public MovementAIRigidbody target;

		public Vector3 offset;

		public float groupLookDist = 1.5f;

		private SteeringBasics steeringBasics;

		private OffsetPursuit offsetPursuit;

		private Separation separation;

		private NearSensor sensor;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			offsetPursuit = GetComponent<OffsetPursuit>();
			separation = GetComponent<Separation>();
			sensor = base.transform.Find("SeparationSensor").GetComponent<NearSensor>();
		}

		private void LateUpdate()
		{
			Vector3 targetPos;
			Vector3 steering = offsetPursuit.GetSteering(target, offset, out targetPos);
			Vector3 steering2 = separation.GetSteering(sensor.targets);
			steeringBasics.Steer(steering + steering2);
			if (Vector3.Distance(base.transform.position, targetPos) > groupLookDist)
			{
				steeringBasics.LookWhereYoureGoing();
			}
			else
			{
				steeringBasics.LookAtDirection(target.Rotation);
			}
		}
	}
}
