using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(SteeringBasics))]
	public class FollowPath : MonoBehaviour
	{
		public float stopRadius = 0.005f;

		public float pathOffset = 0.71f;

		public float pathDirection = 1f;

		private SteeringBasics steeringBasics;

		private MovementAIRigidbody rb;

		private void Awake()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			rb = GetComponent<MovementAIRigidbody>();
		}

		public Vector3 GetSteering(LinePath path)
		{
			return GetSteering(path, pathLoop: false);
		}

		public Vector3 GetSteering(LinePath path, bool pathLoop)
		{
			Vector3 targetPosition;
			return GetSteering(path, pathLoop, out targetPosition);
		}

		public Vector3 GetSteering(LinePath path, bool pathLoop, out Vector3 targetPosition)
		{
			if (path.Length == 1)
			{
				targetPosition = path[0];
			}
			else
			{
				float param = path.GetParam(base.transform.position, rb);
				if (!pathLoop && IsAtEndOfPath(path, param, out Vector3 finalDestination))
				{
					targetPosition = finalDestination;
					rb.Velocity = Vector3.zero;
					return Vector3.zero;
				}
				param += pathDirection * pathOffset;
				targetPosition = path.GetPosition(param, pathLoop);
			}
			return steeringBasics.Arrive(targetPosition);
		}

		public bool IsAtEndOfPath(LinePath path)
		{
			if (path.Length == 1)
			{
				Vector3 b = rb.ConvertVector(path[0]);
				return Vector3.Distance(rb.Position, b) < stopRadius;
			}
			float param = path.GetParam(base.transform.position, rb);
			Vector3 finalDestination;
			return IsAtEndOfPath(path, param, out finalDestination);
		}

		private bool IsAtEndOfPath(LinePath path, float param, out Vector3 finalDestination)
		{
			finalDestination = ((pathDirection > 0f) ? path[path.Length - 1] : path[0]);
			finalDestination = rb.ConvertVector(finalDestination);
			if (param >= path.distances[path.Length - 2])
			{
				return Vector3.Distance(rb.Position, finalDestination) < stopRadius;
			}
			return false;
		}
	}
}
