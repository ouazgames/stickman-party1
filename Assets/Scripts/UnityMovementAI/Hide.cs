using System.Collections.Generic;
using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(SteeringBasics))]
	[RequireComponent(typeof(Evade))]
	public class Hide : MonoBehaviour
	{
		public float distanceFromBoundary = 0.6f;

		private SteeringBasics steeringBasics;

		private Evade evade;

		private void Awake()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			evade = GetComponent<Evade>();
		}

		public Vector3 GetSteering(MovementAIRigidbody target, ICollection<MovementAIRigidbody> obstacles)
		{
			Vector3 bestHidingSpot;
			return GetSteering(target, obstacles, out bestHidingSpot);
		}

		public Vector3 GetSteering(MovementAIRigidbody target, ICollection<MovementAIRigidbody> obstacles, out Vector3 bestHidingSpot)
		{
			float num = float.PositiveInfinity;
			bestHidingSpot = Vector3.zero;
			foreach (MovementAIRigidbody obstacle in obstacles)
			{
				Vector3 hidingPosition = GetHidingPosition(obstacle, target);
				float num2 = Vector3.Distance(hidingPosition, base.transform.position);
				if (num2 < num)
				{
					num = num2;
					bestHidingSpot = hidingPosition;
				}
			}
			if (num == float.PositiveInfinity)
			{
				return evade.GetSteering(target);
			}
			return steeringBasics.Arrive(bestHidingSpot);
		}

		private Vector3 GetHidingPosition(MovementAIRigidbody obstacle, MovementAIRigidbody target)
		{
			float d = obstacle.Radius + distanceFromBoundary;
			Vector3 a = obstacle.Position - target.Position;
			a.Normalize();
			return obstacle.Position + a * d;
		}
	}
}
