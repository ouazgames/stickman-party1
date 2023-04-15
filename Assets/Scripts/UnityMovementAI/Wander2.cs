using System;
using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(SteeringBasics))]
	public class Wander2 : MonoBehaviour
	{
		public float wanderRadius = 1.2f;

		public float wanderDistance = 2f;

		public float wanderJitter = 40f;

		private Vector3 wanderTarget;

		private SteeringBasics steeringBasics;

		private MovementAIRigidbody rb;

		private void Awake()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			rb = GetComponent<MovementAIRigidbody>();
		}

		private void Start()
		{
			float f = UnityEngine.Random.value * 2f * (float)Math.PI;
			if (rb.is3D)
			{
				wanderTarget = new Vector3(wanderRadius * Mathf.Cos(f), 0f, wanderRadius * Mathf.Sin(f));
			}
			else
			{
				wanderTarget = new Vector3(wanderRadius * Mathf.Cos(f), wanderRadius * Mathf.Sin(f), 0f);
			}
		}

		public Vector3 GetSteering()
		{
			float num = wanderJitter * Time.deltaTime;
			if (rb.is3D)
			{
				wanderTarget += new Vector3(UnityEngine.Random.Range(-1f, 1f) * num, 0f, UnityEngine.Random.Range(-1f, 1f) * num);
			}
			else
			{
				wanderTarget += new Vector3(UnityEngine.Random.Range(-1f, 1f) * num, UnityEngine.Random.Range(-1f, 1f) * num, 0f);
			}
			wanderTarget.Normalize();
			wanderTarget *= wanderRadius;
			Vector3 targetPosition = base.transform.position + base.transform.right * wanderDistance + wanderTarget;
			return steeringBasics.Seek(targetPosition);
		}
	}
}
