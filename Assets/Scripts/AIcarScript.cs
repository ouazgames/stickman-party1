using System.Collections.Generic;
using UnityEngine;

public class AIcarScript : MonoBehaviour
{
	private RaceGameController RGC;

	public bool IsSMove;

	public Transform Path;

	public float MaxSteerAngle = 45f;

	private List<Transform> nodes;

	private Quaternion LastRotation;

	public float MoveSpeed;

	public float speed = 5f;

	private int curnode;

	private Vector2 targetVelocity;

	private Rigidbody2D rb;

	private int TrackCont;

	private int Laps;

	public AudioSource SkidSource;

	public GameObject WhiteBody;

	private Animation Anim;

	private AudioSource Source;

	public AudioClip EngineSound;

	public AudioClip WheelColSound;

	public AudioClip WheelColSound2;

	public AudioClip LapsPlus;

	private float minPitch;

	private float maxPitch;

	private float pitchModifier;

	private float CurPitch;

	private float time;

	private int SpeedCount;

	private float SpeedTimer;

	public float acceleration;

	public float steering;

	private bool IsTrack1;

	private bool IsTrack2;

	private bool IsTrack3;

	private bool IsGo;

	public AudioClip PowerUpSound;

	private bool IsBonus;

	private float BonusTimer;

	[Header("Sensors")]
	private float SensorLenght = 0.5f;

	private Vector3 frontSensorPos = new Vector3(0.4f, 0f, 0f);

	private float FrontSideSensorPosition = 0.2f;

	private float FrontSensorAngle = 15f;

	private LayerMask layerMask;

	private bool avoiding;

	private void Awake()
	{
		LastRotation = base.transform.rotation;
		rb = GetComponent<Rigidbody2D>();
		minPitch = 0.7f;
		maxPitch = 3f;
		Anim = base.gameObject.GetComponent<Animation>();
		Source = GetComponent<AudioSource>();
	}

	private void Start()
	{
		layerMask = 1 << LayerMask.NameToLayer("Effector");
		layerMask = LayerMask.GetMask("Effector");
		layerMask = ~(int)layerMask;
		RGC = Camera.main.GetComponent<RaceGameController>();
		Transform[] componentsInChildren = Path.GetComponentsInChildren<Transform>();
		nodes = new List<Transform>();
		for (int i = 0; i < componentsInChildren.Length; i++)
		{
			if (componentsInChildren[i] != Path.transform)
			{
				nodes.Add(componentsInChildren[i]);
			}
		}
		Source.clip = EngineSound;
		Source.pitch = 1f;
		Source.volume = 0.05f;
		Source.Play();
		pitchModifier = maxPitch - minPitch;
		SpeedTimer = 3.5f;
	}

	private void FixedUpdate()
	{
		Sensors();
		Applysteer();
		Drive();
		CheckWaypointDistance();
		MoveSpeed = rb.velocity.magnitude;
	}

	private void Applysteer()
	{
		if (IsSMove)
		{
			if (!avoiding)
			{
				Vector3 vector = nodes[curnode].position - base.transform.position;
				Quaternion b = Quaternion.AngleAxis(Mathf.Atan2(vector.y, vector.x) * 57.29578f, Vector3.forward);
				base.transform.rotation = Quaternion.Slerp(base.transform.rotation, b, Time.deltaTime * 4f);
			}
		}
		else
		{
			base.transform.rotation = LastRotation;
		}
	}

	private void Drive()
	{
		if (IsSMove && MoveSpeed <= 3f)
		{
			rb.AddForce(base.transform.right * speed);
		}
	}

	private void CheckWaypointDistance()
	{
		if (Vector3.Distance(base.transform.position, nodes[curnode].position) < 1.5f)
		{
			if (curnode == nodes.Count - 1)
			{
				curnode = 0;
			}
			else
			{
				curnode++;
			}
		}
	}

	private void Sensors()
	{
		Vector3 position = base.transform.position;
		position += base.transform.right * frontSensorPos.x;
		position += base.transform.up * frontSensorPos.y;
		float num = 0f;
		avoiding = false;
		RaycastHit2D raycastHit2D = Physics2D.Raycast(position, base.transform.right * SensorLenght, float.PositiveInfinity, layerMask);
		if (raycastHit2D.collider != null)
		{
			Vector2 point = raycastHit2D.point;
			UnityEngine.Debug.DrawLine(position, raycastHit2D.point);
		}
		position += base.transform.up * FrontSideSensorPosition;
		RaycastHit2D raycastHit2D2 = Physics2D.Raycast(position, base.transform.right * SensorLenght, float.PositiveInfinity, layerMask);
		Vector2 point2 = raycastHit2D2.point;
		UnityEngine.Debug.DrawLine(position, raycastHit2D2.point);
		RaycastHit2D raycastHit2D3 = Physics2D.Raycast(position, Quaternion.Euler(0f, 0f, 30f) * base.transform.right, SensorLenght, layerMask);
		if (raycastHit2D3.collider != null && raycastHit2D3.collider.CompareTag("Wheels"))
		{
			UnityEngine.Debug.DrawLine(position, raycastHit2D3.point);
			avoiding = true;
			num = 3f;
		}
		position -= base.transform.up * FrontSideSensorPosition * 2f;
		RaycastHit2D raycastHit2D4 = Physics2D.Raycast(position, base.transform.right * SensorLenght, float.PositiveInfinity, layerMask);
		Vector2 point3 = raycastHit2D4.point;
		UnityEngine.Debug.DrawLine(position, raycastHit2D4.point);
		RaycastHit2D raycastHit2D5 = Physics2D.Raycast(position, Quaternion.Euler(0f, 0f, -30f) * base.transform.right, SensorLenght, layerMask);
		if (raycastHit2D5.collider != null && raycastHit2D5.collider.CompareTag("Wheels"))
		{
			UnityEngine.Debug.DrawLine(position, raycastHit2D3.point);
			avoiding = true;
			num += 3f;
		}
		if (avoiding)
		{
			Vector3 vector = nodes[curnode].position - base.transform.position;
			Quaternion b = Quaternion.AngleAxis(Mathf.Atan2(vector.y, vector.x) * 57.29578f * num, Vector3.forward);
			base.transform.rotation = Quaternion.Slerp(base.transform.rotation, b, Time.deltaTime * 5f);
		}
	}

	private void Update()
	{
		if (MoveSpeed > 0f)
		{
			if (MoveSpeed < 2f && SpeedCount >= 3)
			{
				SpeedCount = 2;
			}
			if (SpeedTimer > 1.7f)
			{
				SpeedTimer -= Time.deltaTime;
			}
			if (SpeedTimer <= 1.7f && SpeedCount < 3)
			{
				SpeedCount++;
				SpeedTimer = 3.5f;
			}
			if (Source.pitch <= maxPitch)
			{
				CurPitch = minPitch + MoveSpeed / SpeedTimer;
				Source.pitch = CurPitch;
			}
			else
			{
				Source.pitch = maxPitch;
			}
			time = 0f;
		}
		else
		{
			SpeedCount = 0;
			time += Time.deltaTime;
			if (Source.pitch > minPitch)
			{
				Source.pitch = CurPitch - time * 2.5f;
			}
			else
			{
				Source.pitch = minPitch;
			}
		}
		if (IsSMove)
		{
			if (!IsGo)
			{
				Anim.Play("RaceCarAnimation");
				IsGo = true;
			}
			Source.volume = 0.2f;
		}
		else
		{
			Source.volume = 0.05f;
		}
		if (IsBonus)
		{
			if (BonusTimer <= 0.2f)
			{
				BonusTimer += Time.deltaTime;
				rb.AddForce(base.transform.right * 0.5f, ForceMode2D.Impulse);
			}
			else
			{
				BonusTimer = 0f;
				IsBonus = false;
			}
		}
	}

	private void OnCollisionEnter2D(Collision2D collision)
	{
		if (collision.collider.tag == "Wheels")
		{
			switch (UnityEngine.Random.Range(1, 3))
			{
			case 1:
				SkidSource.volume = 0.23f;
				SkidSource.PlayOneShot(WheelColSound);
				break;
			case 2:
				SkidSource.volume = 0.23f;
				SkidSource.PlayOneShot(WheelColSound2);
				break;
			}
		}
	}

	private void OnTriggerEnter2D(Collider2D collision)
	{
		if (!IsSMove)
		{
			return;
		}
		if (collision.tag == "Track1")
		{
			if (!IsTrack1)
			{
				TrackCont = 1;
				IsTrack3 = false;
				IsTrack2 = false;
				IsTrack1 = true;
			}
		}
		else if (collision.tag == "Track2")
		{
			if (!IsTrack2)
			{
				TrackCont++;
				IsTrack2 = true;
			}
		}
		else if (collision.tag == "Track3")
		{
			if (!IsTrack3)
			{
				TrackCont++;
				IsTrack3 = true;
			}
		}
		else if (collision.tag == "Finish")
		{
			if (TrackCont == 3 && IsTrack3)
			{
				if (OptionsIntro.Instance.VibrationCheck == 0)
				{
					OptionsIntro.Instance.TriggerSelection();
				}
				Laps++;
				SkidSource.volume = 0.7f;
				SkidSource.PlayOneShot(LapsPlus);
				PlayWhiteAnim();
			}
			TrackCont = 0;
			IsTrack1 = false;
			IsTrack2 = false;
			IsTrack3 = false;
			if (Laps == 3)
			{
				RGC.PlayerName = base.gameObject.name;
				if (PlayerPrefs.GetInt("IsCups") == 1)
				{
					RGC.AddName(base.gameObject.name);
					IsSMove = false;
				}
				RGC.IGameOver();
			}
			else if (Laps <= 2 && Laps >= 1 && PlayerPrefs.GetInt("GameMode") == 1)
			{
				RGC.PlayerName = base.gameObject.name;
				RGC.CheckPlayer();
			}
		}
		else if (collision.tag == "SpeedUp")
		{
			Source.PlayOneShot(PowerUpSound);
			PlayWhiteAnim();
			IsBonus = true;
		}
	}

	private void PlayWhiteAnim()
	{
		WhiteBody.SetActive(value: true);
		Invoke("PlayWhiteAnim2", 0.15f);
	}

	private void PlayWhiteAnim2()
	{
		WhiteBody.SetActive(value: false);
		Invoke("PlayWhiteAnim3", 0.15f);
	}

	private void PlayWhiteAnim3()
	{
		WhiteBody.SetActive(value: true);
		Invoke("PlayWhiteAnim4", 0.15f);
	}

	private void PlayWhiteAnim4()
	{
		WhiteBody.SetActive(value: false);
	}
}
