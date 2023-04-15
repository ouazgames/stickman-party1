using UnityEngine;

namespace UnityMovementAI
{
	public class FlockingUnit : MonoBehaviour
	{
		public float cohesionWeight = 1.5f;

		public float separationWeight = 2f;

		public float velocityMatchWeight = 1f;

		private SteeringBasics steeringBasics;

		private Wander2 wander;

		private Cohesion cohesion;

		private Separation separation;

		private VelocityMatch velocityMatch;

		private NearSensor sensor;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			wander = GetComponent<Wander2>();
			cohesion = GetComponent<Cohesion>();
			separation = GetComponent<Separation>();
			velocityMatch = GetComponent<VelocityMatch>();
			sensor = base.transform.Find("Sensor").GetComponent<NearSensor>();
		}

		private void FixedUpdate()
		{
			Vector3 zero = Vector3.zero;
			zero += cohesion.GetSteering(sensor.targets) * cohesionWeight;
			zero += separation.GetSteering(sensor.targets) * separationWeight;
			zero += velocityMatch.GetSteering(sensor.targets) * velocityMatchWeight;
			if (zero.magnitude < 0.005f)
			{
				zero = wander.GetSteering();
			}
			steeringBasics.Steer(zero);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
