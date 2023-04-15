using UnityEngine;

namespace UnityMovementAI
{
	public class WanderAvoidUnit : MonoBehaviour
	{
		private SteeringBasics steeringBasics;

		private Wander2 wander;

		private CollisionAvoidance colAvoid;

		private NearSensor colAvoidSensor;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			wander = GetComponent<Wander2>();
			colAvoid = GetComponent<CollisionAvoidance>();
			colAvoidSensor = base.transform.Find("ColAvoidSensor").GetComponent<NearSensor>();
		}

		private void FixedUpdate()
		{
			Vector3 steering = colAvoid.GetSteering(colAvoidSensor.targets);
			if (steering.magnitude < 0.005f)
			{
				steering = wander.GetSteering();
			}
			steeringBasics.Steer(steering);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
