using UnityEngine;

public class PlayerScript : MonoBehaviour
{
	private bool IsGound;

	private bool IsGound2;

	public bool IsAIPlayer;

	private bool IsJump;

	public GameObject FinishStarsPrefab;

	public GameObject DustPrefab;

	private Rigidbody2D rb;

	private int NumCount;

	private Transform MyScale;

	private AudioSource Source;

	public AudioClip Jump1;

	public AudioClip Jump2;

	public AudioClip Powerup;

	public bool IsSMove;

	private float Movespeed = 4.5f;

	private int IsSpeedUp;

	private bool IsGrounded;

	public GameObject SpeedPrefab;

	private Color MyColor;

	private float timer;

	public GameObject MySR;

	public GameObject DeathPrefab;

	private float MyGravety;

	private float GroundTimer;

	private bool GoTimer;

	[Header("Sensors")]
	private float SensorLenght = 1.5f;

	private Vector3 frontSensorPos = new Vector3(0.4f, -0.37f, 0f);

	private float FrontSideSensorPosition = 0.2f;

	private float FrontSensorAngle = 15f;

	private LayerMask layerMask;

	private bool avoiding;

	private void Start()
	{
		layerMask = 1 << LayerMask.NameToLayer("Tank");
		layerMask = LayerMask.GetMask("Tank");
		layerMask = ~(int)layerMask;
		MyColor = MySR.GetComponent<SpriteRenderer>().color;
		MyColor.a = 0.15f;
		Source = GetComponent<AudioSource>();
		MyScale = base.gameObject.transform;
		rb = GetComponent<Rigidbody2D>();
		rb.gravityScale = 2f;
	}

	public void PlayerButton()
	{
		if (!IsAIPlayer && IsGrounded && IsSpeedUp == 0)
		{
			base.transform.localScale = new Vector3(MyScale.localScale.x, 0f - MyScale.localScale.y, MyScale.localScale.z);
			if (NumCount == 0)
			{
				NumCount++;
				rb.gravityScale = -2f;
				Source.PlayOneShot(Jump1);
			}
			else
			{
				rb.gravityScale = 2f;
				Source.PlayOneShot(Jump2);
				NumCount = 0;
			}
		}
	}

	public void AiPlayerJump()
	{
		if (!IsAIPlayer)
		{
			return;
		}
		Invoke("JumpOff", 0.5f);
		if (IsGrounded && IsSpeedUp == 0)
		{
			base.transform.localScale = new Vector3(MyScale.localScale.x, 0f - MyScale.localScale.y, MyScale.localScale.z);
			if (NumCount == 0)
			{
				NumCount++;
				rb.gravityScale = -2f;
				Source.PlayOneShot(Jump1);
			}
			else
			{
				rb.gravityScale = 2f;
				Source.PlayOneShot(Jump2);
				NumCount = 0;
			}
		}
	}

	private void JumpOff()
	{
		IsJump = false;
	}

	private void FixedUpdate()
	{
		if (IsAIPlayer && IsSMove)
		{
			Sensors();
		}
	}

	private void Sensors()
	{
		Vector3 position = base.transform.position;
		RaycastHit2D raycastHit2D = Physics2D.Raycast(position, base.transform.right * SensorLenght, float.PositiveInfinity, layerMask);
		if (raycastHit2D.collider != null)
		{
			UnityEngine.Debug.DrawLine(position, raycastHit2D.point);
			if (Vector3.Distance(position, raycastHit2D.point) <= UnityEngine.Random.Range(0.3f, 4f) && !IsJump && !raycastHit2D.collider.CompareTag("Hazard"))
			{
				AiPlayerJump();
				IsJump = true;
			}
			else if (Vector3.Distance(position, raycastHit2D.point) <= UnityEngine.Random.Range(3.5f, 4.3f) && !IsJump && raycastHit2D.collider.CompareTag("Track1") && !IsJump)
			{
				AiPlayerJump();
				IsJump = true;
			}
		}
		position += base.transform.up * frontSensorPos.y;
		RaycastHit2D raycastHit2D2 = Physics2D.Raycast(position, base.transform.right * SensorLenght, float.PositiveInfinity, layerMask);
		if (raycastHit2D2.collider != null)
		{
			UnityEngine.Debug.DrawLine(position, raycastHit2D2.point);
			if (Vector3.Distance(position, raycastHit2D2.point) <= UnityEngine.Random.Range(0.2f, 0.5f) && !IsJump)
			{
				AiPlayerJump();
				IsJump = true;
			}
			if (raycastHit2D2.collider.CompareTag("Ground2") && !IsJump)
			{
				UnityEngine.Debug.Log("hitRightAngle.collider.CompareTag(Finish)");
				IsJump = true;
				Invoke("JumpOff", 0.15f);
			}
		}
		position -= base.transform.up * frontSensorPos.y * 2f;
		RaycastHit2D raycastHit2D3 = Physics2D.Raycast(position, base.transform.right * SensorLenght, float.PositiveInfinity, layerMask);
		if (raycastHit2D3.collider != null)
		{
			UnityEngine.Debug.DrawLine(position, raycastHit2D3.point);
			if (Vector3.Distance(position, raycastHit2D3.point) <= UnityEngine.Random.Range(0.2f, 0.5f) && !IsJump)
			{
				AiPlayerJump();
				IsJump = true;
			}
		}
		position += base.transform.right * frontSensorPos.x;
		RaycastHit2D raycastHit2D4 = Physics2D.Raycast(position, -base.transform.up * SensorLenght);
		if (raycastHit2D4.collider == null && !IsJump)
		{
			UnityEngine.Debug.DrawLine(position, raycastHit2D4.point);
			IsGound = false;
			if (!IsGound2)
			{
				AiPlayerJump();
				IsJump = true;
			}
		}
		else if (raycastHit2D4.collider != null)
		{
			UnityEngine.Debug.DrawLine(position, raycastHit2D4.point);
			if (raycastHit2D4.collider.CompareTag("Ground3"))
			{
				IsGound = false;
			}
			else
			{
				IsGound = true;
			}
		}
		RaycastHit2D raycastHit2D5 = Physics2D.Raycast(position, base.transform.up * SensorLenght);
		if (raycastHit2D5.collider == null && !IsJump)
		{
			UnityEngine.Debug.DrawLine(position, raycastHit2D5.point);
			IsGound2 = false;
			if (!IsGound)
			{
				AiPlayerJump();
				IsJump = true;
			}
		}
		else if (raycastHit2D5.collider != null)
		{
			UnityEngine.Debug.DrawLine(position, raycastHit2D5.point);
			if (raycastHit2D5.collider.CompareTag("Ground3"))
			{
				IsGound2 = false;
			}
			else
			{
				IsGound2 = true;
			}
		}
		position += base.transform.up * FrontSideSensorPosition;
		RaycastHit2D raycastHit2D6 = Physics2D.Raycast(position, Quaternion.Euler(0f, 0f, 30f) * base.transform.right * SensorLenght, float.PositiveInfinity, layerMask);
		if (raycastHit2D6.collider != null)
		{
			UnityEngine.Debug.DrawLine(position, raycastHit2D6.point);
			if (raycastHit2D6.collider.CompareTag("Finish"))
			{
				UnityEngine.Debug.Log("hitLeftAngle.collider.CompareTag(Finish)");
				IsJump = true;
				Invoke("JumpOff", 0.5f);
			}
		}
		position -= base.transform.up * FrontSideSensorPosition * 2f;
		RaycastHit2D raycastHit2D7 = Physics2D.Raycast(position, Quaternion.Euler(0f, 0f, -30f) * base.transform.right, SensorLenght, layerMask);
		if (raycastHit2D7.collider != null)
		{
			UnityEngine.Debug.DrawLine(position, raycastHit2D7.point);
			if (raycastHit2D7.collider.CompareTag("Finish"))
			{
				UnityEngine.Debug.Log("hitRightAngle.collider.CompareTag(Finish)");
				IsJump = true;
				Invoke("JumpOff", 0.5f);
			}
		}
	}

	private void Update()
	{
		if (GoTimer)
		{
			GroundTimer += Time.deltaTime;
		}
		if (GroundTimer >= 0.5f)
		{
			IsGrounded = false;
		}
		if (IsSMove && IsSpeedUp == 0)
		{
			base.transform.position += base.transform.right * Movespeed * Time.deltaTime;
		}
		else if (IsSMove && IsSpeedUp == 1)
		{
			timer += Time.deltaTime;
			rb.AddForce(base.transform.right * 1.6f, ForceMode2D.Impulse);
			if ((double)timer >= 0.015)
			{
				GameObject gameObject = UnityEngine.Object.Instantiate(SpeedPrefab, MySR.transform.position, Quaternion.identity);
				gameObject.transform.localScale = base.transform.localScale;
				gameObject.GetComponent<SpriteRenderer>().color = MyColor;
				timer = 0f;
			}
		}
	}

	private void OnTriggerEnter2D(Collider2D other)
	{
		if (other.tag == "SpeedUp")
		{
			MyGravety = rb.gravityScale;
			rb.gravityScale = 0f;
			IsSpeedUp = 1;
			other.GetComponent<AudioSource>().PlayOneShot(Powerup);
			Invoke("SpeedDown", 0.35f);
		}
		else if (other.tag == "FinishLine")
		{
			Object.Instantiate(FinishStarsPrefab, base.transform.position, base.transform.rotation);
			RunGameController component = Camera.main.GetComponent<RunGameController>();
			component.FinishName = base.gameObject.name;
			if (PlayerPrefs.GetInt("IsCups") == 1)
			{
				component.AddNameWinner(base.gameObject.name);
			}
			component.FinishGame();
			UnityEngine.Object.Destroy(base.gameObject);
		}
		else if (other.tag == "Finish")
		{
			Object.Instantiate(DeathPrefab, base.transform.position, Quaternion.identity).transform.SetParent(other.transform);
			if (PlayerPrefs.GetInt("IsCups") == 1)
			{
				Camera.main.GetComponent<RunGameController>().AddNameLuser(base.gameObject.name);
			}
			UnityEngine.Object.Destroy(base.gameObject);
		}
	}

	private void SpeedDown()
	{
		IsSpeedUp = 0;
		rb.velocity = Vector3.zero;
		rb.gravityScale = MyGravety;
	}

	private void OnCollisionEnter2D(Collision2D collision)
	{
		if (collision.collider.tag == "Player" || collision.collider.tag == "Box")
		{
			IsGrounded = true;
			GroundTimer = 0f;
			GoTimer = false;
		}
		else if (collision.collider.tag == "Ground" || collision.collider.tag == "Ground2" || collision.collider.tag == "Ground3")
		{
			IsGrounded = true;
			GoTimer = false;
			GroundTimer = 0f;
			ContactPoint2D contactPoint2D = collision.contacts[0];
			Vector3 position = contactPoint2D.point;
			Object.Instantiate(DustPrefab, position, base.transform.rotation).transform.localScale = base.transform.localScale;
		}
		else if (collision.collider.tag == "Finish" || collision.collider.tag == "Track1")
		{
			if (OptionsIntro.Instance.VibrationCheck == 0)
			{
				OptionsIntro.Instance.TriggerVibrate();
			}
			if (PlayerPrefs.GetInt("IsCups") == 1)
			{
				Camera.main.GetComponent<RunGameController>().AddNameLuser(base.gameObject.name);
			}
			Object.Instantiate(DeathPrefab, base.transform.position, Quaternion.identity).transform.SetParent(collision.collider.transform);
			UnityEngine.Object.Destroy(base.gameObject);
		}
	}

	private void OnCollisionStay2D(Collision2D collision)
	{
		if (collision.collider.tag == "Ground")
		{
			IsGrounded = true;
		}
		else if (collision.collider.tag == "Player" || collision.collider.tag == "Box")
		{
			IsGrounded = true;
		}
	}

	private void OnCollisionExit2D(Collision2D collision)
	{
		GoTimer = true;
	}
}
