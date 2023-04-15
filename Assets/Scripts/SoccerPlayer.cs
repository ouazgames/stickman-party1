using CnControls;
using UnityEngine;

public class SoccerPlayer : MonoBehaviour
{
	public bool IsAIPlayer;

	public float force = 3f;

	public float MoveSpeed;

	public float speed = 5f;

	private Quaternion LastRotation;

	public float RotationAngle;

	private AudioSource Source;

	private Rigidbody2D rb;

	public AudioClip Ball1;

	public AudioClip Ball2;

	public AudioClip Step1;

	public AudioClip Step2;

	private float StepTimer;

	private Animation Anim;

	public bool IsSMove;

	public string HorizontalAxys = "";

	public string VertivcalAxys = "";

	[Header("Sensors")]
	private Vector2 startingPosition;

	private bool isFirstTimeInOpponentsHalf = true;

	private float offsetXFromTarget;

	private LayerMask layerMask;

	private Vector3 targetPosition;

	private Sense CheckTarget;

	public Transform PlayerBoundaryHolder;

	private Boundary playerBoundary;

	public Transform PuckBoundaryHolder;

	private Boundary puckBoundary;

	public Rigidbody2D Puck;

	private float SensorLenght = 1.5f;

	private Vector3 frontSensorPos = new Vector3(0.4f, 0f, 0f);

	private float FrontSideSensorPosition = 0.2f;

	private float FrontSensorAngle = 15f;

	private bool BallColl;

	private void Start()
	{
		CheckTarget = GetComponent<Sense>();
		rb = GetComponent<Rigidbody2D>();
		Anim = GetComponent<Animation>();
		Source = GetComponent<AudioSource>();
		Anim.Play("PlayerStopAnimation");
		if (IsAIPlayer)
		{
			startingPosition = rb.position;
			playerBoundary = new Boundary(PlayerBoundaryHolder.GetChild(0).position.y, PlayerBoundaryHolder.GetChild(1).position.y, PlayerBoundaryHolder.GetChild(2).position.x, PlayerBoundaryHolder.GetChild(3).position.x);
			layerMask = 1 << LayerMask.NameToLayer("Bullet");
			layerMask = LayerMask.GetMask("Bullet");
			layerMask = ~(int)layerMask;
		}
	}

	private void FixedUpdate()
	{
		if (IsSMove)
		{
			if (IsAIPlayer)
			{
				Puck = CheckTarget.Puck;
				if ((bool)Puck)
				{
					float num = UnityEngine.Random.Range(MoveSpeed * UnityEngine.Random.Range(0.5f, 1f), MoveSpeed);
					Vector3 position = base.transform.position;
					position += base.transform.up * frontSensorPos.y;
					RaycastHit2D raycastHit2D = Physics2D.Raycast(position, base.transform.right * SensorLenght, float.PositiveInfinity, layerMask);
					if (raycastHit2D.collider != null)
					{
						UnityEngine.Debug.DrawLine(position, raycastHit2D.point);
						if (raycastHit2D.collider.CompareTag("Finish") && BallColl)
						{
							targetPosition = raycastHit2D.collider.gameObject.transform.position;
							RotationAngle = Mathf.Atan2(targetPosition.x, targetPosition.y) * 57.29578f;
							Vector3 vector = targetPosition - base.transform.position;
							float z = Mathf.Atan2(vector.y, vector.x) * 57.29578f;
							base.transform.rotation = Quaternion.Slerp(base.transform.rotation, Quaternion.Euler(0f, 0f, z), 10f);
						}
						else
						{
							targetPosition = new Vector2(Mathf.Clamp(Puck.position.x, playerBoundary.Left, playerBoundary.Right), Mathf.Clamp(Puck.position.y, playerBoundary.Down, playerBoundary.Up));
							RotationAngle = Mathf.Atan2(targetPosition.x, targetPosition.y) * 57.29578f;
							Vector3 vector2 = Puck.transform.position - base.transform.position;
							float z2 = Mathf.Atan2(vector2.y, vector2.x) * 57.29578f;
							base.transform.rotation = Quaternion.Slerp(base.transform.rotation, Quaternion.Euler(0f, 0f, z2), 10f);
						}
					}
					rb.MovePosition(Vector2.MoveTowards(rb.position, targetPosition, num * Time.fixedDeltaTime));
				}
			}
			else
			{
				Vector3 a = new Vector3(CnInputManager.GetAxis(HorizontalAxys), CnInputManager.GetAxis(VertivcalAxys), 0f);
				base.transform.position += a * MoveSpeed * Time.deltaTime;
			}
		}
		LastRotation = base.transform.rotation;
	}

	private void Update()
	{
		if (!IsAIPlayer)
		{
			if ((CnInputManager.GetAxis(HorizontalAxys) == 0f && CnInputManager.GetAxis(VertivcalAxys) == 0f) || !IsSMove)
			{
				base.transform.rotation = LastRotation;
				StepTimer = 0f;
				Anim.Play("PlayerStopAnimation");
			}
			else
			{
				if (!IsSMove)
				{
					return;
				}
				StepTimer += Time.deltaTime;
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
				Anim.Play("PlayerMoveAnimation");
				RotationAngle = Mathf.Atan2(0f - CnInputManager.GetAxis(HorizontalAxys), CnInputManager.GetAxis(VertivcalAxys)) * 57.29578f;
				Quaternion b = Quaternion.Euler(0f, 0f, RotationAngle);
				base.transform.rotation = Quaternion.Slerp(base.transform.rotation, b, Time.deltaTime * 10f);
			}
		}
		else
		{
			if (!IsSMove || !Puck)
			{
				return;
			}
			if ((Puck.gameObject.activeSelf && Puck.position.x > puckBoundary.Left && Puck.position.x < puckBoundary.Right) || (Puck.gameObject.activeSelf && Puck.position.x < puckBoundary.Left && Puck.position.x > puckBoundary.Right))
			{
				base.transform.rotation = LastRotation;
				StepTimer = 0f;
				Anim.Play("PlayerStopAnimation");
			}
			else if (Puck.gameObject.activeSelf && Puck.position.x <= puckBoundary.Left && Puck.position.x <= puckBoundary.Right)
			{
				StepTimer += Time.deltaTime;
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
				Anim.Play("PlayerMoveAnimation");
			}
			else if (!Puck.gameObject.activeSelf)
			{
				base.transform.rotation = LastRotation;
				StepTimer = 0f;
				Anim.Play("PlayerStopAnimation");
			}
		}
	}

	private void OnCollisionEnter2D(Collision2D collision)
	{
		if (collision.collider.tag == "Ball")
		{
			BallColl = true;
			switch (UnityEngine.Random.Range(1, 3))
			{
			case 1:
				collision.collider.GetComponent<AudioSource>().PlayOneShot(Ball1);
				break;
			case 2:
				collision.collider.GetComponent<AudioSource>().PlayOneShot(Ball2);
				break;
			}
		}
		else if (collision.gameObject.tag == "Player")
		{
			ContactPoint2D contactPoint2D = collision.contacts[0];
			Vector2 a = -(contactPoint2D.point - new Vector2(base.transform.position.x, base.transform.position.y)).normalized;
			rb.AddForce(a * force);
		}
	}

	private void OnCollisionExit2D(Collision2D collision)
	{
		if (collision.collider.tag == "Ball")
		{
			BallColl = false;
		}
	}
}
