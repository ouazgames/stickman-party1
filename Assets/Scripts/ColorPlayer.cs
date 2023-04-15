using CnControls;
using UnityEngine;
using UnityEngine.UI;

public class ColorPlayer : MonoBehaviour
{
	public GameObject CountTextPrefab;

	public GameObject RocketPrefabPrefab;

	public GameObject SparkPrefab;

	public float force = 3f;

	public float MoveSpeed;

	public float speed = 5f;

	private Quaternion LastRotation;

	public float RotationAngle;

	private AudioSource Source;

	private Rigidbody2D rb;

	public AudioClip Step1;

	public AudioClip Step2;

	public AudioClip GetColor;

	private float StepTimer;

	private Animation Anim;

	public bool IsSMove;

	public string HorizontalAxys = "";

	public string VertivcalAxys = "";

	public Color32 BlockColor;

	public Color32 MyColor;

	public string BlockName;

	public int i;

	[Header("Sensors")]
	private GameObjectSens CheckTarget;

	public bool IsAIPlayer;

	public Transform PlayerBoundaryHolder;

	private Boundary playerBoundary;

	private GameObject Puck;

	private Vector3 targetPosition;

	private LayerMask layerMask;

	private float SensorLenght = 1.5f;

	private Vector3 frontSensorPos = new Vector3(0.4f, 0f, 0f);

	private float FrontSideSensorPosition = 0.2f;

	private float FrontSensorAngle = 15f;

	private Vector3 euler;

	private float AiSpeed = 5.2f;

	private bool IsRotation;

	private void Start()
	{
		CheckTarget = GetComponent<GameObjectSens>();
		playerBoundary = new Boundary(PlayerBoundaryHolder.GetChild(0).position.y, PlayerBoundaryHolder.GetChild(1).position.y, PlayerBoundaryHolder.GetChild(2).position.x, PlayerBoundaryHolder.GetChild(3).position.x);
		rb = GetComponent<Rigidbody2D>();
		Anim = GetComponent<Animation>();
		Source = GetComponent<AudioSource>();
		Anim.Play("PlayerStopAnimation");
	}

	private void FixedUpdate()
	{
		if (IsSMove)
		{
			if (!IsAIPlayer)
			{
				Vector3 a = new Vector3(CnInputManager.GetAxis(HorizontalAxys), CnInputManager.GetAxis(VertivcalAxys), 0f);
				base.transform.position += a * MoveSpeed * Time.deltaTime;
			}
			else
			{
				Sensors();
			}
		}
		LastRotation = base.transform.rotation;
	}

	private void Sensors()
	{
		Puck = CheckTarget.Puck;
		if ((bool)Puck)
		{
			float num = UnityEngine.Random.Range(MoveSpeed * UnityEngine.Random.Range(0.5f, 1f), MoveSpeed * UnityEngine.Random.Range(0.5f, 1f));
			targetPosition = Puck.transform.position;
			RotationAngle = Mathf.Atan2(targetPosition.x, targetPosition.y) * 57.29578f;
			Vector3 vector = targetPosition - base.transform.position;
			float z = Mathf.Atan2(vector.y, vector.x) * 57.29578f;
			base.transform.rotation = Quaternion.Slerp(base.transform.rotation, Quaternion.Euler(0f, 0f, z), 1f);
			rb.MovePosition(Vector2.MoveTowards(rb.position, targetPosition, num * Time.fixedDeltaTime));
			IsRotation = false;
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
			return;
		}
		if (!IsRotation)
		{
			StepTimer = 0f;
			Anim.Play("PlayerStopAnimation");
			euler = base.transform.eulerAngles;
			euler.z = UnityEngine.Random.Range(0f, 360f);
			IsRotation = true;
		}
		base.transform.rotation = Quaternion.Slerp(base.transform.rotation, Quaternion.Euler(0f, 0f, euler.z), 1f);
		Vector3 position = base.transform.position;
		position += base.transform.up * frontSensorPos.y;
		UnityEngine.Debug.Log("Ray");
		RaycastHit2D raycastHit2D = Physics2D.Raycast(position, base.transform.right * SensorLenght);
		if (!(raycastHit2D.collider != null))
		{
			return;
		}
		UnityEngine.Debug.DrawLine(position, raycastHit2D.point, Color.red);
		if (Vector3.Distance(position, raycastHit2D.point) <= 2f)
		{
			IsRotation = false;
			return;
		}
		rb.AddForce(base.transform.right * AiSpeed);
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

	private void OffRotation()
	{
		IsRotation = false;
	}

	private void OnRotation()
	{
		IsRotation = true;
	}

	private void Update()
	{
		if (IsAIPlayer)
		{
			return;
		}
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

	private void OnCollisionEnter2D(Collision2D collision)
	{
		if (collision.gameObject.tag == "Player")
		{
			ContactPoint2D contactPoint2D = collision.contacts[0];
			Vector2 a = -(contactPoint2D.point - new Vector2(base.transform.position.x, base.transform.position.y)).normalized;
			rb.AddForce(a * force);
		}
		else if (collision.collider.tag == "Finish")
		{
			if (OptionsIntro.Instance.VibrationCheck == 0)
			{
				OptionsIntro.Instance.TriggerVibrate();
			}
			ColorGameController component = Camera.main.GetComponent<ColorGameController>();
			component.ColorBoxCount--;
			component.AddName = collision.gameObject.name;
			component.AddPoint();
			GameObject[] array = GameObject.FindGameObjectsWithTag("ColorBlock");
			Source.PlayOneShot(GetColor);
			int num = 0;
			GameObject[] array2 = array;
			foreach (GameObject gameObject in array2)
			{
				if (gameObject.name == BlockName)
				{
					gameObject.GetComponent<SpriteRenderer>().color = BlockColor;
					num++;
					gameObject.name = "colorBlock";
				}
			}
			component.ColorCount[this.i] += num;
			Object.Instantiate(CountTextPrefab, base.transform.position, Quaternion.identity).transform.Find("Text").GetComponent<Text>().text = "+" + num;
			Object.Instantiate(SparkPrefab, collision.transform.position, collision.transform.rotation);
			UnityEngine.Object.Destroy(collision.gameObject);
		}
		else if (collision.collider.tag == "Rocket")
		{
			if (OptionsIntro.Instance.VibrationCheck == 0)
			{
				OptionsIntro.Instance.TriggerVibrate();
			}
			ColorGameController component2 = Camera.main.GetComponent<ColorGameController>();
			component2.RocketBoxCount--;
			component2.AddName = collision.gameObject.name;
			component2.AddPoint();
			Object.Instantiate(RocketPrefabPrefab, base.transform.position, Quaternion.identity);
			Object.Instantiate(SparkPrefab, collision.transform.position, collision.transform.rotation);
			UnityEngine.Object.Destroy(collision.gameObject);
		}
	}

	private void OnTriggerEnter2D(Collider2D collision)
	{
		if (collision.tag == "ColorBlock")
		{
			collision.gameObject.GetComponent<SpriteRenderer>().color = MyColor;
			collision.gameObject.name = BlockName;
		}
	}

	public void MoveOff()
	{
		IsSMove = false;
		Invoke("MoveOn", 3f);
		if (IsAIPlayer)
		{
			base.transform.rotation = LastRotation;
			StepTimer = 0f;
			Anim.Play("PlayerStopAnimation");
		}
	}

	public void MoveOn()
	{
		IsSMove = true;
	}
}
