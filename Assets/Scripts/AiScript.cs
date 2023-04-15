using UnityEngine;

public class AiScript : MonoBehaviour
{
	public float checkRadius;

	public LayerMask CheckLayers;

	public float MaxMovementSpeed;

	private Rigidbody2D rb;

	private Vector2 startingPosition;

	public Rigidbody2D[] PuckArray;

	public Rigidbody2D Puck;

	public Transform PlayerBoundaryHolder;

	private Boundary playerBoundary;

	public Transform PuckBoundaryHolder;

	private Boundary puckBoundary;

	private Vector2 targetPosition;

	private bool isFirstTimeInOpponentsHalf = true;

	private float offsetXFromTarget;

	public GameObject CheckTarget;

	private bool StartThink;

	private void Start()
	{
		rb = GetComponent<Rigidbody2D>();
		startingPosition = rb.position;
		playerBoundary = new Boundary(PlayerBoundaryHolder.GetChild(0).position.y, PlayerBoundaryHolder.GetChild(1).position.y, PlayerBoundaryHolder.GetChild(2).position.x, PlayerBoundaryHolder.GetChild(3).position.x);
		puckBoundary = new Boundary(PuckBoundaryHolder.GetChild(0).position.y, PuckBoundaryHolder.GetChild(1).position.y, PuckBoundaryHolder.GetChild(2).position.x, PuckBoundaryHolder.GetChild(3).position.x);
	}

	private void OnEnable()
	{
		Invoke("StartGame", 1f);
	}

	private void StartGame()
	{
		StartThink = true;
	}

	private void OnTriggerEnter2D(Collider2D other)
	{
		bool flag = other.tag == "Field";
	}

	private void FixedUpdate()
	{
		if (StartThink)
		{
			Puck = CheckTarget.GetComponent<Sense>().Puck;
		}
		if (!Puck)
		{
			return;
		}
		float num;
		if (Puck.position.y < puckBoundary.Down)
		{
			if (isFirstTimeInOpponentsHalf)
			{
				isFirstTimeInOpponentsHalf = false;
				offsetXFromTarget = UnityEngine.Random.Range(-1f, 1f);
			}
			num = UnityEngine.Random.Range(0.8f, 5f);
			targetPosition = new Vector2(Mathf.Clamp(Puck.position.x + offsetXFromTarget, playerBoundary.Left, playerBoundary.Right), startingPosition.y);
		}
		else
		{
			isFirstTimeInOpponentsHalf = true;
			num = UnityEngine.Random.Range(MaxMovementSpeed * UnityEngine.Random.Range(0.5f, 1f), MaxMovementSpeed);
			targetPosition = new Vector2(Mathf.Clamp(Puck.position.x, playerBoundary.Left, playerBoundary.Right), Mathf.Clamp(Puck.position.y, playerBoundary.Down, playerBoundary.Up));
		}
		rb.MovePosition(Vector2.MoveTowards(rb.position, targetPosition, num * Time.fixedDeltaTime));
	}
}
