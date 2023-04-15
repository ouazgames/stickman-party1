using UnityEngine;

namespace UnityMovementAI
{
	public class HideUnit : MonoBehaviour
	{
		public MovementAIRigidbody target;

		private SteeringBasics steeringBasics;

		private Hide hide;

		private Spawner obstacleSpawner;

		private WallAvoidance wallAvoid;

		private void Start()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			hide = GetComponent<Hide>();
			obstacleSpawner = GameObject.Find("ObstacleSpawner").GetComponent<Spawner>();
			wallAvoid = GetComponent<WallAvoidance>();
		}

		private void FixedUpdate()
		{
			Vector3 bestHidingSpot;
			Vector3 steering = hide.GetSteering(target, obstacleSpawner.objs, out bestHidingSpot);
			Vector3 linearAcceleration = wallAvoid.GetSteering(bestHidingSpot - base.transform.position);
			if (linearAcceleration.magnitude < 0.005f)
			{
				linearAcceleration = steering;
			}
			steeringBasics.Steer(linearAcceleration);
			steeringBasics.LookWhereYoureGoing();
		}
	}
}
