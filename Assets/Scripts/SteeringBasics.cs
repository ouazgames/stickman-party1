using System.Collections.Generic;
using UnityEngine;

public class SteeringBasics : MonoBehaviour
{
	[Header("General")]
	private MovementAIRigidbody Mr;

	public float maxVelocity = 3.5f;

	public bool IsSMove;

	public Animation Anim;

	public float maxAcceleration = 10f;

	public float turnSpeed = 20f;

	private AudioSource Source;

	public AudioClip Step1;

	public AudioClip Step2;

	private float StepTimer;

	[Header("Arrive")]
	public float targetRadius = 0.005f;

	public float slowRadius = 1f;

	public float timeToTarget = 0.1f;

	[Header("Look Direction Smoothing")]
	public bool smoothing = true;

	public int numSamplesForSmoothing = 5;

	private Queue<Vector3> velocitySamples = new Queue<Vector3>();

	private MovementAIRigidbody rb;

	private void Awake()
	{
		Mr = GetComponent<MovementAIRigidbody>();
		rb = GetComponent<MovementAIRigidbody>();
		Source = GetComponent<AudioSource>();
	}

	public void Steer(Vector3 linearAcceleration)
	{
		if (IsSMove)
		{
			StepTimer += Time.deltaTime;
			rb.Velocity += linearAcceleration * Time.deltaTime;
			if (rb.Velocity.magnitude > maxVelocity)
			{
				rb.Velocity = rb.Velocity.normalized * maxVelocity;
				Anim.Play("PlayerMoveAnimation");
			}
			if (StepTimer >= 0.25f)
			{
				switch (UnityEngine.Random.Range(1, 3))
				{
				case 1:
					Source.PlayOneShot(Step1);
					break;
				case 2:
					Source.PlayOneShot(Step2);
					break;
				}
				StepTimer = 0f;
			}
		}
		else
		{
			StepTimer = 0f;
			Anim.Play("PlayerStopAnimation");
		}
	}

	public Vector3 Seek(Vector3 targetPosition, float maxSeekAccel)
	{
		Vector3 a = rb.ConvertVector(targetPosition - base.transform.position);
		a.Normalize();
		return a * maxSeekAccel;
	}

	public Vector3 Seek(Vector3 targetPosition)
	{
		return Seek(targetPosition, maxAcceleration);
	}

	public void LookWhereYoureGoing()
	{
		Vector3 direction = rb.Velocity;
		if (smoothing)
		{
			if (velocitySamples.Count == numSamplesForSmoothing)
			{
				velocitySamples.Dequeue();
			}
			velocitySamples.Enqueue(rb.Velocity);
			direction = Vector3.zero;
			foreach (Vector3 velocitySample in velocitySamples)
			{
				direction += velocitySample;
			}
			direction /= velocitySamples.Count;
		}
		LookAtDirection(direction);
	}

	public void LookAtDirection(Vector3 direction)
	{
		direction.Normalize();
		if (direction.sqrMagnitude > 0.001f)
		{
			if (rb.is3D)
			{
				float b = -1f * (Mathf.Atan2(direction.z, direction.x) * 57.29578f);
				float y = Mathf.LerpAngle(rb.Rotation.eulerAngles.y, b, Time.deltaTime * turnSpeed);
				rb.Rotation = Quaternion.Euler(0f, y, 0f);
			}
			else
			{
				float b2 = Mathf.Atan2(direction.y, direction.x) * 57.29578f;
				float z = Mathf.LerpAngle(rb.Rotation.eulerAngles.z, b2, Time.deltaTime * turnSpeed);
				rb.Rotation = Quaternion.Euler(0f, 0f, z);
			}
		}
	}

	public void LookAtDirection(Quaternion toRotation)
	{
		if (rb.is3D)
		{
			LookAtDirection(toRotation.eulerAngles.y);
		}
		else
		{
			LookAtDirection(toRotation.eulerAngles.z);
		}
	}

	public void LookAtDirection(float toRotation)
	{
		if (rb.is3D)
		{
			float y = Mathf.LerpAngle(rb.Rotation.eulerAngles.y, toRotation, Time.deltaTime * turnSpeed);
			rb.Rotation = Quaternion.Euler(0f, y, 0f);
		}
		else
		{
			float z = Mathf.LerpAngle(rb.Rotation.eulerAngles.z, toRotation, Time.deltaTime * turnSpeed);
			rb.Rotation = Quaternion.Euler(0f, 0f, z);
		}
	}

	public Vector3 Arrive(Vector3 targetPosition)
	{
		UnityEngine.Debug.DrawLine(base.transform.position, targetPosition, Color.cyan, 0f, depthTest: false);
		targetPosition = rb.ConvertVector(targetPosition);
		Vector3 a = targetPosition - rb.Position;
		float magnitude = a.magnitude;
		if (magnitude < targetRadius)
		{
			rb.Velocity = Vector3.zero;
			return Vector3.zero;
		}
		float d = (!(magnitude > slowRadius)) ? (maxVelocity * (magnitude / slowRadius)) : maxVelocity;
		a.Normalize();
		a *= d;
		Vector3 a2 = a - rb.Velocity;
		a2 *= 1f / timeToTarget;
		if (a2.magnitude > maxAcceleration)
		{
			a2.Normalize();
			a2 *= maxAcceleration;
		}
		return a2;
	}

	public Vector3 Interpose(MovementAIRigidbody target1, MovementAIRigidbody target2)
	{
		Vector3 a = (target1.Position + target2.Position) / 2f;
		float d = Vector3.Distance(a, base.transform.position) / maxVelocity;
		Vector3 a2 = target1.Position + target1.Velocity * d;
		Vector3 b = target2.Position + target2.Velocity * d;
		a = (a2 + b) / 2f;
		return Arrive(a);
	}

	public bool IsInFront(Vector3 target)
	{
		return IsFacing(target, 0f);
	}

	public bool IsFacing(Vector3 target, float cosineValue)
	{
		Vector3 normalized = base.transform.right.normalized;
		Vector3 rhs = target - base.transform.position;
		rhs.Normalize();
		return Vector3.Dot(normalized, rhs) >= cosineValue;
	}

	public static Vector3 OrientationToVector(float orientation, bool is3DGameObj)
	{
		if (is3DGameObj)
		{
			return new Vector3(Mathf.Cos(0f - orientation), 0f, Mathf.Sin(0f - orientation));
		}
		return new Vector3(Mathf.Cos(orientation), Mathf.Sin(orientation), 0f);
	}

	public static float VectorToOrientation(Vector3 direction, bool is3DGameObj)
	{
		if (is3DGameObj)
		{
			return -1f * Mathf.Atan2(direction.z, direction.x);
		}
		return Mathf.Atan2(direction.y, direction.x);
	}

	public static void DebugCross(Vector3 position, float size = 0.5f, Color color = default(Color), float duration = 0f, bool depthTest = true)
	{
		Vector3 start = position + Vector3.right * size * 0.5f;
		Vector3 end = position - Vector3.right * size * 0.5f;
		Vector3 start2 = position + Vector3.up * size * 0.5f;
		Vector3 end2 = position - Vector3.up * size * 0.5f;
		Vector3 start3 = position + Vector3.forward * size * 0.5f;
		Vector3 end3 = position - Vector3.forward * size * 0.5f;
		UnityEngine.Debug.DrawLine(start, end, color, duration, depthTest);
		UnityEngine.Debug.DrawLine(start2, end2, color, duration, depthTest);
		UnityEngine.Debug.DrawLine(start3, end3, color, duration, depthTest);
	}
}
