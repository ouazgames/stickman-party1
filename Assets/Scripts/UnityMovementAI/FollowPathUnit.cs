using UnityEngine;

namespace UnityMovementAI
{
	public class FollowPathUnit : MonoBehaviour
	{
		public bool pathLoop;

		public bool reversePath;

		public LinePath path;

		private SteeringBasics steeringBasics;

		private FollowPath followPath;

		private void Start()
		{
			path.CalcDistances();
			steeringBasics = GetComponent<SteeringBasics>();
			followPath = GetComponent<FollowPath>();
		}

		private void FixedUpdate()
		{
			path.Draw();
			if (reversePath && followPath.IsAtEndOfPath(path))
			{
				path.ReversePath();
			}
			Vector3 steering = followPath.GetSteering(path, pathLoop);
			steeringBasics.Steer(steering);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
