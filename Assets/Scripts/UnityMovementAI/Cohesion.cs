using System;
using System.Collections.Generic;
using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(SteeringBasics))]
	public class Cohesion : MonoBehaviour
	{
		public float facingCosine = 120f;

		private float facingCosineVal;

		private SteeringBasics steeringBasics;

		private void Awake()
		{
			facingCosineVal = Mathf.Cos(facingCosine * ((float)Math.PI / 180f));
			steeringBasics = GetComponent<SteeringBasics>();
		}

		public Vector3 GetSteering(ICollection<MovementAIRigidbody> targets)
		{
			Vector3 a = Vector3.zero;
			int num = 0;
			foreach (MovementAIRigidbody target in targets)
			{
				if (steeringBasics.IsFacing(target.Position, facingCosineVal))
				{
					a += target.Position;
					num++;
				}
			}
			if (num == 0)
			{
				return Vector3.zero;
			}
			a /= num;
			return steeringBasics.Arrive(a);
		}
	}
}
