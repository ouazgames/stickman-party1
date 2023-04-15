using CnControls;
using UnityEngine;

public class GhostAiPlayer : MonoBehaviour
{
	public bool IsSceneGhost;

	public AudioClip GhostLaugh;

	private AudioSource Source;

	public bool IsAIPlayer;

	public bool IsSMove;

	public float MoveSpeed;

	public float Speed;

	private Quaternion LastRotation;

	public float RotationAngle;

	public string HorizontalAxys = "";

	public string VertivcalAxys = "";

	public GameObject DeathStickmanPrefab;

	public GameObject[] GhostPrefab;

	public GameObject[] GhostPrefabAI;

	private Rigidbody2D rb;

	private Vector3 NormalScale = new Vector3(0.35f, 0.35f, 0.35f);

	[Header("Sensors")]
	public GameObjectSens CheckTarget;

	private GameObject Puck;

	private Vector3 targetPosition;

	private float SensorLenght = 1.5f;

	private Vector3 frontSensorPos = new Vector3(0.4f, 0f, 0f);

	private float FrontSideSensorPosition = 0.2f;

	private float FrontSensorAngle = 15f;

	private Vector3 euler;

	private float AiSpeed;

	private bool IsRotation;

	public Transform PlayerBoundaryHolder;

	private Boundary playerBoundary;

	private void Awake()
	{
		if (!IsSceneGhost)
		{
			CheckTarget = GetComponent<GameObjectSens>();
		}
		Source = GetComponent<AudioSource>();
		base.transform.localScale = new Vector3(0f, 0f, 0f);
		rb = GetComponent<Rigidbody2D>();
	}

	private void Start()
	{
		Source.PlayOneShot(GhostLaugh);
		AiSpeed = UnityEngine.Random.Range(1.8f, 2.5f);
		Speed = UnityEngine.Random.Range(1.8f, 2.5f);
		rb.drag = UnityEngine.Random.Range(0.7f, 1f);
	}

	private void Update()
	{
		if (base.transform.localScale != NormalScale)
		{
			base.transform.localScale = Vector3.Lerp(base.transform.localScale, NormalScale, 1f * Time.deltaTime);
		}
		if (!IsAIPlayer)
		{
			if ((CnInputManager.GetAxis(HorizontalAxys) == 0f && CnInputManager.GetAxis(VertivcalAxys) == 0f) || !IsSMove)
			{
				base.transform.rotation = LastRotation;
			}
			else if (IsSMove)
			{
				RotationAngle = Mathf.Atan2(0f - CnInputManager.GetAxis(HorizontalAxys), CnInputManager.GetAxis(VertivcalAxys)) * 57.29578f;
				Quaternion b = Quaternion.Euler(0f, 0f, RotationAngle);
				base.transform.rotation = Quaternion.Slerp(base.transform.rotation, b, Time.deltaTime * 10f);
			}
		}
	}

	private void FixedUpdate()
	{
		if (IsSMove)
		{
			if (!IsAIPlayer)
			{
				Vector3 a = new Vector3(CnInputManager.GetAxis(HorizontalAxys), CnInputManager.GetAxis(VertivcalAxys), 0f);
				base.transform.position += a * Speed * Time.deltaTime;
			}
			else
			{
				Sensors();
			}
		}
		MoveSpeed = rb.velocity.magnitude;
		LastRotation = base.transform.rotation;
	}

	private void Sensors()
	{
		Puck = CheckTarget.Puck;
		if ((bool)Puck)
		{
			targetPosition = Puck.transform.position;
			RotationAngle = Mathf.Atan2(targetPosition.x, targetPosition.y) * 57.29578f;
			Vector3 vector = targetPosition - base.transform.position;
			Quaternion b = Quaternion.AngleAxis(Mathf.Atan2(vector.y, vector.x) * 57.29578f, Vector3.forward);
			base.transform.rotation = Quaternion.Slerp(base.transform.rotation, b, Time.deltaTime * 7f);
			if (MoveSpeed <= 3f)
			{
				rb.AddForce(base.transform.right * AiSpeed);
			}
		}
	}

	private void OnCollisionEnter2D(Collision2D collision)
	{
		if (!(collision.collider.tag == "Player"))
		{
			return;
		}
		Object.Instantiate(DeathStickmanPrefab, collision.collider.transform.position, collision.collider.transform.rotation);
		if (collision.collider.name == "PlayerRed")
		{
			Object.Instantiate(GhostPrefab[0], collision.collider.transform.position, collision.collider.transform.rotation);
			Camera.main.GetComponent<GhostGameController>().AddName("PlayerRed");
		}
		else if (collision.collider.name == "PlayerBlue")
		{
			Camera.main.GetComponent<GhostGameController>().AddName("PlayerBlue");
			if (PlayerPrefs.GetInt("PlayerNumers") == 1)
			{
				Object.Instantiate(GhostPrefabAI[1], collision.collider.transform.position, collision.collider.transform.rotation);
			}
			else
			{
				Object.Instantiate(GhostPrefab[1], collision.collider.transform.position, collision.collider.transform.rotation);
			}
		}
		else if (collision.collider.name == "PlayerGreen")
		{
			Camera.main.GetComponent<GhostGameController>().AddName("PlayerGreen");
			if (PlayerPrefs.GetInt("PlayerNumers") == 1)
			{
				Object.Instantiate(GhostPrefabAI[2], collision.collider.transform.position, collision.collider.transform.rotation);
			}
			else if (PlayerPrefs.GetInt("PlayerNumers") == 2)
			{
				if (PlayerPrefs.GetInt("NeedBot") == 1)
				{
					Object.Instantiate(GhostPrefabAI[2], collision.collider.transform.position, collision.collider.transform.rotation);
				}
				else
				{
					Object.Instantiate(GhostPrefab[2], collision.collider.transform.position, collision.collider.transform.rotation);
				}
			}
			else if (PlayerPrefs.GetInt("PlayerNumers") == 3)
			{
				if (PlayerPrefs.GetInt("NeedBot") == 1)
				{
					Object.Instantiate(GhostPrefabAI[2], collision.collider.transform.position, collision.collider.transform.rotation);
				}
				else
				{
					Object.Instantiate(GhostPrefab[2], collision.collider.transform.position, collision.collider.transform.rotation);
				}
			}
			else if (PlayerPrefs.GetInt("PlayerNumers") == 4)
			{
				Object.Instantiate(GhostPrefab[2], collision.collider.transform.position, collision.collider.transform.rotation);
			}
		}
		else if (collision.collider.name == "PlayerYellow")
		{
			Camera.main.GetComponent<GhostGameController>().AddName("PlayerYellow");
			if (PlayerPrefs.GetInt("PlayerNumers") == 1)
			{
				Object.Instantiate(GhostPrefabAI[3], collision.collider.transform.position, collision.collider.transform.rotation);
			}
			else if (PlayerPrefs.GetInt("PlayerNumers") == 2)
			{
				if (PlayerPrefs.GetInt("NeedBot") == 1)
				{
					Object.Instantiate(GhostPrefabAI[3], collision.collider.transform.position, collision.collider.transform.rotation);
				}
				else
				{
					Object.Instantiate(GhostPrefab[3], collision.collider.transform.position, collision.collider.transform.rotation);
				}
			}
			else if (PlayerPrefs.GetInt("PlayerNumers") == 3)
			{
				if (PlayerPrefs.GetInt("NeedBot") == 1)
				{
					Object.Instantiate(GhostPrefabAI[3], collision.collider.transform.position, collision.collider.transform.rotation);
				}
				else
				{
					Object.Instantiate(GhostPrefab[3], collision.collider.transform.position, collision.collider.transform.rotation);
				}
			}
			else if (PlayerPrefs.GetInt("PlayerNumers") == 4)
			{
				Object.Instantiate(GhostPrefab[3], collision.collider.transform.position, collision.collider.transform.rotation);
			}
		}
		UnityEngine.Object.Destroy(collision.collider.gameObject);
	}
}
