using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(SteeringBasics))]
	public class Wander1 : MonoBehaviour
	{
		public float wanderOffset = 1.5f;

		public float wanderRadius = 4f;

		public float wanderRate = 0.4f;

		private float wanderOrientation;

		private SteeringBasics steeringBasics;

		private MovementAIRigidbody rb;

		private void Awake()
		{
			steeringBasics = GetComponent<SteeringBasics>();
			rb = GetComponent<MovementAIRigidbody>();
		}

		public Vector3 GetSteering()
		{
			float rotationInRadians = rb.RotationInRadians;
			wanderOrientation += RandomBinomial() * wanderRate;
			float orientation = wanderOrientation + rotationInRadians;
			Vector3 a = base.transform.position + SteeringBasics.OrientationToVector(rotationInRadians, rb.is3D) * wanderOffset;
			a += SteeringBasics.OrientationToVector(orientation, rb.is3D) * wanderRadius;
			return steeringBasics.Seek(a);
		}

		private float RandomBinomial()
		{
			return UnityEngine.Random.value - UnityEngine.Random.value;
		}
	}
}
