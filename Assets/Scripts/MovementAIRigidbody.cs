using System;
using System.Collections;
using UnityEngine;

public class MovementAIRigidbody : MonoBehaviour
{
	[Header("3D Settings")]
	public bool canFly;

	[Header("3D Grounded Settings")]
	public bool stayGrounded = true;

	public float groundFollowDistance = 0.1f;

	public LayerMask groundCheckMask = -5;

	public float slopeLimit = 80f;

	private SphereCollider col3D;

	private CircleCollider2D col2D;

	[NonSerialized]
	public bool is3D;

	[NonSerialized]
	public Vector3 wallNormal = Vector3.zero;

	[NonSerialized]
	public Vector3 movementNormal = Vector3.up;

	private Rigidbody rb3D;

	private Rigidbody2D rb2D;

	private int count;

	private int countDebug;

	private readonly float spherecastOffset = 0.051f;

	public float Radius
	{
		get
		{
			if (col3D != null)
			{
				return Mathf.Max(rb3D.transform.localScale.x, rb3D.transform.localScale.y, rb3D.transform.localScale.z) * col3D.radius;
			}
			if (col2D != null)
			{
				return Mathf.Max(rb2D.transform.localScale.x, rb2D.transform.localScale.y) * col2D.radius;
			}
			return -1f;
		}
	}

	public Vector3 Position
	{
		get
		{
			if (is3D)
			{
				if (canFly)
				{
					return rb3D.position;
				}
				return new Vector3(rb3D.position.x, 0f, rb3D.position.z);
			}
			return rb2D.position;
		}
	}

	public Vector3 ColliderPosition
	{
		get
		{
			if (is3D)
			{
				return Transform.TransformPoint(col3D.center) + rb3D.position - Transform.position;
			}
			return Transform.TransformPoint(col2D.offset);
		}
	}

	public Vector3 Velocity
	{
		get
		{
			if (is3D)
			{
				if (canFly)
				{
					return rb3D.velocity;
				}
				Vector3 velocity = rb3D.velocity;
				velocity.y = 0f;
				float magnitude = Vector3.ProjectOnPlane(rb3D.velocity, movementNormal).magnitude;
				return velocity.normalized * magnitude;
			}
			return rb2D.velocity;
		}
		set
		{
			if (is3D)
			{
				if (canFly)
				{
					rb3D.velocity = value;
					return;
				}
				if (rb3D.useGravity)
				{
					value.y = rb3D.velocity.y;
					rb3D.velocity = value;
				}
				else
				{
					rb3D.velocity = DirOnPlane(value, movementNormal) * value.magnitude;
				}
				LimitMovementOnSteepSlopes();
			}
			else
			{
				rb2D.velocity = value;
			}
		}
	}

	public Vector3 RealVelocity
	{
		get
		{
			if (!is3D)
			{
				return rb2D.velocity;
			}
			return rb3D.velocity;
		}
		set
		{
			if (is3D)
			{
				rb3D.velocity = value;
			}
			else
			{
				rb2D.velocity = value;
			}
		}
	}

	public Transform Transform
	{
		get
		{
			if (is3D)
			{
				return rb3D.transform;
			}
			return rb2D.transform;
		}
	}

	public Quaternion Rotation
	{
		get
		{
			if (is3D)
			{
				return rb3D.rotation;
			}
			Quaternion identity = Quaternion.identity;
			identity.eulerAngles = new Vector3(0f, 0f, rb2D.rotation);
			return identity;
		}
		set
		{
			if (is3D)
			{
				rb3D.MoveRotation(value);
			}
			else
			{
				rb2D.MoveRotation(value.eulerAngles.z);
			}
		}
	}

	public float AngularVelocity
	{
		get
		{
			if (is3D)
			{
				return rb3D.angularVelocity.y;
			}
			return rb2D.angularVelocity;
		}
		set
		{
			if (is3D)
			{
				rb3D.angularVelocity = new Vector3(0f, value, 0f);
			}
			else
			{
				rb2D.angularVelocity = value;
			}
		}
	}

	public float RotationInRadians
	{
		get
		{
			if (is3D)
			{
				return rb3D.rotation.eulerAngles.y * ((float)Math.PI / 180f);
			}
			return rb2D.rotation * ((float)Math.PI / 180f);
		}
	}

	public Vector3 RotationAsVector => SteeringBasics.OrientationToVector(RotationInRadians, is3D);

	private void Awake()
	{
		SetUp();
	}

	public void SetUp()
	{
		SetUpRigidbody();
		SetUpCollider();
	}

	private void SetUpRigidbody()
	{
		Rigidbody component = GetComponent<Rigidbody>();
		if (component != null)
		{
			rb3D = component;
			is3D = true;
		}
		else
		{
			rb2D = GetComponent<Rigidbody2D>();
			is3D = false;
		}
	}

	private void SetUpCollider()
	{
		if (is3D)
		{
			SphereCollider component = rb3D.GetComponent<SphereCollider>();
			if (component != null)
			{
				col3D = component;
			}
		}
		else
		{
			CircleCollider2D component2 = rb2D.GetComponent<CircleCollider2D>();
			if (component2 != null)
			{
				col2D = component2;
			}
		}
	}

	private void Start()
	{
		StartCoroutine(DebugDraw());
		FixedUpdate();
	}

	private IEnumerator DebugDraw()
	{
		yield return new WaitForFixedUpdate();
		Vector3 colliderPosition = ColliderPosition;
		UnityEngine.Debug.DrawLine(colliderPosition, colliderPosition + Velocity.normalized, Color.red, 0f, depthTest: false);
		if (is3D)
		{
			UnityEngine.Debug.DrawLine(colliderPosition, colliderPosition + RealVelocity.normalized, Color.green, 0f, depthTest: false);
			UnityEngine.Debug.DrawLine(colliderPosition, colliderPosition + wallNormal, Color.yellow, 0f, depthTest: false);
			UnityEngine.Debug.DrawLine(colliderPosition, colliderPosition + movementNormal, Color.blue, 0f, depthTest: false);
		}
		count++;
		countDebug = 0;
		StartCoroutine(DebugDraw());
	}

	private void FixedUpdate()
	{
		if (!is3D || canFly)
		{
			return;
		}
		bool num = !rb3D.useGravity || rb3D.velocity.y <= 0f;
		wallNormal = Vector3.zero;
		movementNormal = Vector3.up;
		rb3D.useGravity = true;
		RaycastHit hitInfo = default(RaycastHit);
		if (num && SphereCast(Vector3.down, out hitInfo, groundFollowDistance, groundCheckMask.value))
		{
			if (IsWall(hitInfo.normal))
			{
				Vector3 normalized = Vector3.Cross(Vector3.Cross(hitInfo.normal, Vector3.down), hitInfo.normal).normalized;
				float num2 = groundFollowDistance - hitInfo.distance;
				RaycastHit hitInfo2 = default(RaycastHit);
				if (num2 > 0f && SphereCast(normalized, out hitInfo2, num2, groundCheckMask.value) && !IsWall(hitInfo2.normal))
				{
					Vector3 newPos = rb3D.position + normalized * hitInfo2.distance;
					FoundGround(hitInfo2.normal, newPos);
				}
				if (hitInfo.distance <= 0.01f)
				{
					wallNormal = hitInfo.normal;
				}
			}
			else
			{
				Vector3 newPos2 = rb3D.position + Vector3.down * hitInfo.distance;
				FoundGround(hitInfo.normal, newPos2);
			}
		}
		LimitMovementOnSteepSlopes();
	}

	private bool SphereCast(Vector3 dir, out RaycastHit hitInfo, float dist, int layerMask, Vector3 planeNormal = default(Vector3))
	{
		dir.Normalize();
		if (Physics.SphereCast(ColliderPosition + planeNormal * 0.001f + (0f - spherecastOffset) * dir, maxDistance: spherecastOffset + dist, radius: Radius, direction: dir, hitInfo: out hitInfo, layerMask: layerMask))
		{
			hitInfo.distance -= spherecastOffset;
			return true;
		}
		return false;
	}

	private void FoundGround(Vector3 normal, Vector3 newPos)
	{
		movementNormal = normal;
		rb3D.useGravity = false;
		rb3D.MovePosition(newPos);
		rb3D.velocity = DirOnPlane(rb3D.velocity, movementNormal) * Velocity.magnitude;
	}

	private bool IsWall(Vector3 surfNormal)
	{
		return Vector3.Angle(Vector3.up, surfNormal) > slopeLimit;
	}

	private void LimitMovementOnSteepSlopes()
	{
		Vector3 velocity = rb3D.velocity;
		if (wallNormal != Vector3.zero && IsMovingInto(rb3D.velocity, wallNormal))
		{
			rb3D.velocity = LimitVelocityOnWall(rb3D.velocity, wallNormal);
		}
		else
		{
			wallNormal = Vector3.zero;
		}
		int num = 0;
		while (true)
		{
			if (num < 2)
			{
				Vector3 normalized = rb3D.velocity.normalized;
				float dist = rb3D.velocity.magnitude * Time.deltaTime;
				Vector3 colliderPosition = ColliderPosition;
				countDebug++;
				switch (num)
				{
				case 0:
					UnityEngine.Debug.DrawRay(colliderPosition + Vector3.up * 0.05f * countDebug, normalized, new Color(0.953f, 0.898f, 0.961f), 0f, depthTest: false);
					break;
				case 1:
					UnityEngine.Debug.DrawRay(colliderPosition + Vector3.up * 0.05f * countDebug, normalized, new Color(0.612f, 0.153f, 0.69f), 0f, depthTest: false);
					break;
				default:
					UnityEngine.Debug.DrawRay(colliderPosition + Vector3.up * 0.05f * countDebug, normalized, new Color(0.29f, 0.078f, 0.549f), 0f, depthTest: false);
					break;
				}
				RaycastHit hitInfo;
				if (SphereCast(normalized, out hitInfo, dist, groundCheckMask.value, movementNormal) && IsWall(hitInfo.normal) && IsMovingInto(normalized, hitInfo.normal))
				{
					float d = Mathf.Max(0f, hitInfo.distance);
					rb3D.MovePosition(rb3D.position + normalized * d);
					Vector3 vector = LimitVelocityOnWall(rb3D.velocity, hitInfo.normal);
					Vector3 dir = LimitVelocityOnWall(velocity, hitInfo.normal);
					if (wallNormal != Vector3.zero && (IsMovingInto(vector, wallNormal) || IsMovingInto(dir, wallNormal)))
					{
						break;
					}
					rb3D.velocity = vector;
					wallNormal = hitInfo.normal;
					num++;
					continue;
				}
				return;
			}
			return;
		}
		Vector3 zero = Vector3.zero;
		if (rb3D.useGravity)
		{
			zero.y = rb3D.velocity.y;
		}
		rb3D.velocity = zero;
	}

	private bool IsMovingInto(Vector3 dir, Vector3 normal)
	{
		return Vector3.Angle(dir, normal) > 90f;
	}

	private Vector3 LimitVelocityOnWall(Vector3 velocity, Vector3 planeNormal)
	{
		Vector3 vector = Vector3.Cross(planeNormal, Vector3.down);
		if (!rb3D.useGravity)
		{
			float magnitude = velocity.magnitude;
			velocity.y = 0f;
			magnitude *= Mathf.Abs(Mathf.Cos(Vector3.Angle(velocity, vector) * ((float)Math.PI / 180f)));
			Vector3 onNormal = Vector3.Cross(movementNormal, planeNormal);
			velocity = Vector3.Project(velocity, vector);
			velocity = Vector3.Project(velocity, onNormal).normalized * magnitude;
		}
		else
		{
			Vector3 from = Vector3.Cross(vector, planeNormal);
			float y = Mathf.Min(0f, rb3D.velocity.y);
			Vector3 vector2 = rb3D.velocity;
			vector2.y = 0f;
			vector2 = Vector3.ProjectOnPlane(vector2, planeNormal);
			if (Vector3.Angle(from, vector2) > 90f)
			{
				vector2 = Vector3.Project(vector2, vector);
			}
			vector2.y = y;
			vector2 = Vector3.ProjectOnPlane(vector2, planeNormal);
			velocity = vector2;
		}
		return velocity;
	}

	public void Jump(float speed)
	{
		if (!rb3D.useGravity)
		{
			rb3D.useGravity = true;
			Vector3 velocity = rb3D.velocity;
			velocity.y = speed;
			rb3D.velocity = velocity;
		}
	}

	private Vector3 DirOnPlane(Vector3 vector, Vector3 planeNormal)
	{
		Vector3 vector2 = vector;
		vector2.y = ((0f - planeNormal.x) * vector.x - planeNormal.z * vector.z) / planeNormal.y;
		return vector2.normalized;
	}

	public void MoveRotation(float angle)
	{
		if (is3D)
		{
			Quaternion rot = Quaternion.Euler(new Vector3(0f, angle, 0f));
			rb3D.MoveRotation(rot);
		}
		else
		{
			rb2D.MoveRotation(angle);
		}
	}

	public Vector3 ConvertVector(Vector3 v)
	{
		if (!is3D)
		{
			v.z = 0f;
		}
		else if (!canFly)
		{
			v.y = 0f;
		}
		return v;
	}
}
