using UnityEngine;

public class BallPlayerscript : MonoBehaviour
{
	private bool IsStart;

	public float Speed;

	private float curSpeed;

	public bool IsMove;

	private int RandomSpeed;

	public GameObject CarObject;

	public Vector3 MinPosition;

	public Vector3 MaxPosition;

	public bool IsXPos;

	public bool IsAIPlayer;

	public GameObject CheckTarget;

	private Sense Sense;

	private Rigidbody2D rb;

	public Transform PlayerBoundaryHolder;

	private Boundary playerBoundary;

	public Rigidbody2D Puck;

	private Vector2 targetPosition;

	private void Start()
	{
		if (IsAIPlayer)
		{
			Sense = CheckTarget.GetComponent<Sense>();
			rb = GetComponent<Rigidbody2D>();
			rb.isKinematic = false;
			playerBoundary = new Boundary(PlayerBoundaryHolder.GetChild(0).position.y, PlayerBoundaryHolder.GetChild(1).position.y, PlayerBoundaryHolder.GetChild(2).position.x, PlayerBoundaryHolder.GetChild(3).position.x);
		}
	}

	public void PressButton()
	{
		if (!IsAIPlayer)
		{
			IsStart = true;
			if (RandomSpeed < 1)
			{
				RandomSpeed++;
				CarObject.transform.localRotation = Quaternion.Euler(base.transform.rotation.x, base.transform.rotation.y, base.transform.rotation.z + 4f);
				curSpeed = 0f - Speed;
			}
			else if (RandomSpeed >= 1)
			{
				CarObject.transform.localRotation = Quaternion.Euler(base.transform.rotation.x, base.transform.rotation.y, base.transform.rotation.z - 4f);
				RandomSpeed = 0;
				curSpeed = Speed;
			}
		}
	}

	private void FixedUpdate()
	{
		if (!IsAIPlayer)
		{
			if (IsStart)
			{
				base.transform.position += base.transform.right * curSpeed * Time.deltaTime;
			}
			if (IsXPos)
			{
				if (base.transform.position.x <= MinPosition.x)
				{
					base.transform.position = new Vector3(MinPosition.x, base.transform.position.y, base.transform.position.z);
				}
				if (base.transform.position.x >= MaxPosition.x)
				{
					base.transform.position = new Vector3(MaxPosition.x, base.transform.position.y, base.transform.position.z);
				}
			}
			else
			{
				if (base.transform.position.y <= MinPosition.y)
				{
					base.transform.position = new Vector3(base.transform.position.x, MinPosition.y, base.transform.position.z);
				}
				if (base.transform.position.y >= MaxPosition.y)
				{
					base.transform.position = new Vector3(base.transform.position.x, MaxPosition.y, base.transform.position.z);
				}
			}
			return;
		}
		Puck = Sense.Puck;
		if ((bool)Puck)
		{
			float num = UnityEngine.Random.Range(Speed * UnityEngine.Random.Range(0.5f, 1f), Speed);
			targetPosition = new Vector2(Mathf.Clamp(Puck.position.x, playerBoundary.Left, playerBoundary.Right), Mathf.Clamp(Puck.position.y, playerBoundary.Down, playerBoundary.Up));
			if (IsXPos)
			{
				rb.MovePosition(Vector2.MoveTowards(rb.position, new Vector2(targetPosition.x, rb.position.y), num * Time.fixedDeltaTime));
			}
			else
			{
				rb.MovePosition(Vector2.MoveTowards(rb.position, new Vector2(rb.position.x, targetPosition.y), num * Time.fixedDeltaTime));
			}
		}
	}
}
