using UnityEngine;

public class SumoPlayer : MonoBehaviour
{
	public float magnitude;

	public Vector3 MyScale;

	private Vector3 NewScale = new Vector3(0.7f, 0.7f, 0.7f);

	public GameObject WaterSplash;

	public float force = 5f;

	public float IceForce = 20f;

	public float Movespeed;

	public float Speed = 5f;

	private Quaternion LastRotation;

	public float RotationAngle;

	private float curSpeed;

	private AudioSource Source;

	public AudioSource IceSource;

	private Rigidbody2D rb;

	public AudioClip Ball1;

	public AudioClip Ball2;

	public AudioClip Step1;

	public AudioClip Step2;

	private float StepTimer;

	private Animation Anim;

	public bool IsSMove;

	private bool IsRotation = true;

	public bool IsAIPlayer;

	private float SensorLenght = 1.5f;

	private Vector3 frontSensorPos = new Vector3(0.4f, 0f, 0f);

	private float FrontSideSensorPosition = 0.2f;

	private float FrontSensorAngle = 15f;

	private Vector3 euler;

	private float AiSpeed = 5.2f;

	private float RandomWait;

	private float RandomTimer;

	private float InvokeRandomWait;

	private void OnEnable()
	{
		base.transform.localScale = MyScale;
	}

	private void Start()
	{
		rb = GetComponent<Rigidbody2D>();
		Anim = GetComponent<Animation>();
		Source = GetComponent<AudioSource>();
		Anim.Play("PlayerStopAnimation");
		curSpeed = Speed;
		RandomTimer = UnityEngine.Random.Range(0.4f, 1.3f);
		InvokeRandomWait = UnityEngine.Random.Range(0.5f, 1.2f);
	}

	private void FixedUpdate()
	{
		if (IsRotation || !IsSMove)
		{
			StepTimer = 0f;
			base.transform.Rotate(0f, 0f, curSpeed * Time.deltaTime);
			if (!IsAIPlayer)
			{
				Anim.Play("PlayerStopAnimation");
			}
		}
		else
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
			Vector2 a = base.transform.up;
			rb.AddForce(a * Movespeed);
			if (!IsAIPlayer)
			{
				Anim.Play("PlayerMoveAnimation");
			}
		}
		if (IsSMove && IsAIPlayer)
		{
			Sensors();
		}
	}

	private void Sensors()
	{
		RandomWait += Time.deltaTime;
		Vector3 position = base.transform.position;
		RaycastHit2D raycastHit2D = Physics2D.Raycast(position, base.transform.up * SensorLenght);
		if (!(raycastHit2D.collider != null))
		{
			return;
		}
		UnityEngine.Debug.DrawLine(position, raycastHit2D.point, Color.red);
		if (raycastHit2D.collider.CompareTag("Player"))
		{
			if (RandomWait >= RandomTimer)
			{
				IsRotation = false;
				rb.angularVelocity = 0f;
				Anim.Play("PlayerMoveAnimation");
				Invoke("Wait", InvokeRandomWait);
			}
			else
			{
				IsRotation = true;
				Anim.Play("PlayerStopAnimation");
			}
		}
		else if (!raycastHit2D.collider.CompareTag("Player"))
		{
			IsRotation = true;
			Anim.Play("PlayerStopAnimation");
		}
	}

	private void Wait()
	{
		RandomWait = 0f;
	}

	private void Update()
	{
		magnitude = rb.velocity.magnitude;
	}

	public void PressButton()
	{
		if (IsSMove && !IsAIPlayer)
		{
			IsRotation = false;
			rb.angularVelocity = 0f;
			rb.velocity = Vector3.zero;
		}
	}

	public void ButtonUp()
	{
		IsRotation = true;
	}

	private void OnCollisionEnter2D(Collision2D collision)
	{
		if (collision.collider.tag == "Player")
		{
			switch (UnityEngine.Random.Range(1, 3))
			{
			case 1:
				Source.PlayOneShot(Ball1);
				break;
			case 2:
				Source.PlayOneShot(Ball2);
				break;
			}
			if (!(rb.velocity.magnitude > 2f) || !(rb.velocity.magnitude > collision.collider.GetComponent<Rigidbody2D>().velocity.magnitude))
			{
				return;
			}
			ContactPoint2D contactPoint2D = collision.contacts[0];
			Vector2 normalized = (contactPoint2D.point - new Vector2(base.transform.position.x, base.transform.position.y)).normalized;
			collision.collider.GetComponent<Rigidbody2D>().AddForce(normalized * force);
		}
		if (collision.gameObject.tag == "Hazard")
		{
			switch (UnityEngine.Random.Range(1, 3))
			{
			case 1:
				IceSource.PlayOneShot(Ball1);
				break;
			case 2:
				IceSource.PlayOneShot(Ball2);
				break;
			}
			ContactPoint2D contactPoint2D2 = collision.contacts[0];
			Vector2 a = -(contactPoint2D2.point - new Vector2(base.transform.position.x, base.transform.position.y)).normalized;
			rb.AddForce(a * IceForce);
			rb.angularVelocity = 0f;
			UnityEngine.Object.Destroy(collision.collider.gameObject);
		}
	}

	private void OnTriggerStay2D(Collider2D collision)
	{
		bool flag = collision.tag == "Ground";
	}

	private void OnTriggerExit2D(Collider2D collision)
	{
		if (collision.tag == "Ground")
		{
			if (OptionsIntro.Instance.VibrationCheck == 0)
			{
				OptionsIntro.Instance.TriggerVibrate();
			}
			base.transform.localScale = NewScale;
			Invoke("CreateWaterSplash", 0.15f);
			if (PlayerPrefs.GetInt("IsCups") == 1)
			{
				Camera.main.GetComponent<SumoGameController>().AddName(base.gameObject.name);
			}
		}
	}

	private void CreateWaterSplash()
	{
		Object.Instantiate(WaterSplash, base.transform.position, base.transform.rotation);
		UnityEngine.Object.Destroy(base.gameObject);
	}
}
