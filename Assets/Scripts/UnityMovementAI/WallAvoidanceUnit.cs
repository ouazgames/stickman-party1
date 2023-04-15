using UnityEngine;

namespace UnityMovementAI
{
	public class WallAvoidanceUnit : MonoBehaviour
	{
		public LinePath path;

		private SteeringBasics steeringBasics;

		private WallAvoidance wallAvoidance;

		private FollowPath followPath;

		private void Start()
		{
			path.CalcDistances();
			steeringBasics = GetComponent<SteeringBasics>();
			wallAvoidance = GetComponent<WallAvoidance>();
			followPath = GetComponent<FollowPath>();
		}

		private void FixedUpdate()
		{
			if (followPath.IsAtEndOfPath(path))
			{
				path.ReversePath();
			}
			Vector3 steering = wallAvoidance.GetSteering();
			if (steering.magnitude < 0.005f)
			{
				steering = followPath.GetSteering(path);
			}
			steeringBasics.Steer(steering);
			steeringBasics.LookWhereYoureGoing();
			path.Draw();
		}
	}
}
