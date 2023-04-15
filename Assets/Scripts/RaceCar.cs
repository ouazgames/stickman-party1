using CnControls;
using UnityEngine;
using UnityEngine.UI;

public class RaceCar : MonoBehaviour
{
	public RaceGameController RGC;

	public bool IsSMove;

	public Text LapsText;

	private int TrackCont;

	private int Laps;

	private Transform target;

	public AudioSource SkidSource;

	public GameObject WhiteBody;

	public AudioClip PowerUpSound;

	private bool IsBonus;

	private float BonusTimer;

	public float MoveSpeed;

	public float speed = 5f;

	private Rigidbody2D rb;

	public float RotationAngle;

	private float Timer = 0.4f;

	private bool IsGo;

	private Animation Anim;

	private AudioSource Source;

	public AudioClip EngineSound;

	public AudioClip WheelColSound;

	public AudioClip WheelColSound2;

	public AudioClip LapsPlus;

	public string HorizontalAxys = "";

	public string VertivcalAxys = "";

	private Quaternion LastRotation;

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

	private void Awake()
	{
		minPitch = 0.7f;
		maxPitch = 3f;
		Anim = base.gameObject.GetComponent<Animation>();
		rb = GetComponent<Rigidbody2D>();
		Source = GetComponent<AudioSource>();
	}

	private void Start()
	{
		LapsText.text = "0/3";
		LastRotation = base.transform.rotation;
		Source.clip = EngineSound;
		Source.pitch = 1f;
		Source.volume = 0.05f;
		Source.Play();
		pitchModifier = maxPitch - minPitch;
		SpeedTimer = 3.5f;
	}

	private void FixedUpdate()
	{
		if (IsSMove)
		{
			Vector2 a = new Vector2(CnInputManager.GetAxis(HorizontalAxys), CnInputManager.GetAxis(VertivcalAxys));
			if (MoveSpeed <= 3f)
			{
				rb.AddForce(a * speed);
			}
		}
		MoveSpeed = rb.velocity.magnitude;
		LastRotation = base.transform.rotation;
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
		if ((CnInputManager.GetAxis(HorizontalAxys) == 0f && CnInputManager.GetAxis(VertivcalAxys) == 0f) || !IsSMove)
		{
			base.transform.rotation = LastRotation;
			Source.volume = 0.05f;
			if (IsGo)
			{
				Anim.Stop();
				IsGo = false;
			}
		}
		else if (IsSMove)
		{
			if (!IsGo)
			{
				Anim.Play("RaceCarAnimation");
				IsGo = true;
			}
			Source.volume = 0.2f;
			RotationAngle = Mathf.Atan2(0f - CnInputManager.GetAxis(HorizontalAxys), CnInputManager.GetAxis(VertivcalAxys)) * 57.29578f;
			Quaternion b = Quaternion.Euler(0f, 0f, RotationAngle);
			base.transform.rotation = Quaternion.Slerp(base.transform.rotation, b, Time.deltaTime * 5f);
		}
		if (IsBonus)
		{
			if (BonusTimer <= 0.2f)
			{
				BonusTimer += Time.deltaTime;
				Vector2 a = new Vector2(CnInputManager.GetAxis(HorizontalAxys), CnInputManager.GetAxis(VertivcalAxys));
				rb.AddForce(a * 0.5f, ForceMode2D.Impulse);
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
				LapsText.text = Laps + "/3";
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
