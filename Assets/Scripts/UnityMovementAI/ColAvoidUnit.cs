using UnityEngine;

namespace UnityMovementAI
{
	public class ColAvoidUnit : MonoBehaviour
	{
		public LinePath path;

		private SteeringBasics steeringBasics;

		private FollowPath followPath;

		private CollisionAvoidance colAvoid;

		private NearSensor colAvoidSensor;

		private void Start()
		{
			path.CalcDistances();
			steeringBasics = GetComponent<SteeringBasics>();
			followPath = GetComponent<FollowPath>();
			colAvoid = GetComponent<CollisionAvoidance>();
			colAvoidSensor = base.transform.Find("ColAvoidSensor").GetComponent<NearSensor>();
		}

		private void FixedUpdate()
		{
			path.Draw();
			if (followPath.IsAtEndOfPath(path))
			{
				path.ReversePath();
			}
			Vector3 steering = colAvoid.GetSteering(colAvoidSensor.targets);
			if (steering.magnitude < 0.005f)
			{
				steering = followPath.GetSteering(path);
			}
			steeringBasics.Steer(steering);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
