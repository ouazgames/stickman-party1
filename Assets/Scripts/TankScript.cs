using UnityEngine;

public class TankScript : MonoBehaviour
{
	public bool isRed;

	private FlagGameController FlagController;

	public GameObject Flag;

	public bool IsGetFlag;

	public string FlagTag = "";

	public string MyBaseTag = "";

	public AudioClip powerUp;

	public string StartTag = "";

	public bool IsCaptureFlag;

	private float MoveTimer;

	public GameObject[] Bullet;

	private int BulletCount;

	private float BulletTimer;

	public GameObject Shield;

	private Vector3 StartScale;

	public float scalingRate = 0.05f;

	private Vector3 NewScale = new Vector3(0.6f, 0.6f, 0.6f);

	public GameObject[] TankHead;

	public GameObject StarEffect;

	public GameObject LaserPrefab;

	public Transform[] LaserTransform;

	public AudioClip LaserShootSound;

	public AudioClip LaserBonusSound;

	public AudioClip ShieldOnSound;

	public AudioClip ShieldOffSound;

	public AudioClip ToySound;

	private float BonusTimer;

	private int RandomBonus;

	private bool IsBonus;

	public GameObject[] Trails;

	public GameObject TankBody;

	public GameObject BigExplosion;

	public GameObject BulletPrefab;

	public Transform BulletTransform;

	private float Speed = 140f;

	private float curSpeed;

	private int RandomSpeed;

	private bool IsRotation = true;

	private float Movespeed = 5f;

	public AudioClip TankSound;

	private AudioSource Source;

	private bool IsShoot;

	private Animation Anim;

	public AudioClip ShotFiring;

	public AudioSource FireSource;

	public bool IsSMove;

	private bool IsReset;

	public bool Deathmatch;

	private void Awake()
	{
		if (Camera.main.GetComponent<FlagGameController>() != null)
		{
			FlagController = Camera.main.GetComponent<FlagGameController>();
		}
		if (!IsCaptureFlag)
		{
			StartTag = "Player";
		}
	}

	private void Start()
	{
		BulletCount = 5;
		StartScale = base.transform.localScale;
		Anim = GetComponent<Animation>();
		Source = GetComponent<AudioSource>();
		FireSource.clip = TankSound;
		FireSource.volume = 0.05f;
		FireSource.Play();
		RandomSpeed = UnityEngine.Random.Range(1, 3);
		if (RandomSpeed == 1)
		{
			curSpeed = Speed;
		}
		else if (RandomSpeed == 2)
		{
			curSpeed = 0f - Speed;
		}
		IsReset = true;
	}

	private void OnEnable()
	{
		IsGetFlag = false;
		if (Flag != null)
		{
			Flag.SetActive(value: false);
		}
		if (IsReset)
		{
			BulletCount = 5;
			Anim.Play("New Animation");
			if (Deathmatch)
			{
				RandomBonus = 3;
				base.transform.localScale = StartScale;
				Shield.SetActive(value: true);
				base.gameObject.tag = "Untagged";
				IsBonus = true;
			}
		}
	}

	private void Go()
	{
		IsSMove = true;
	}

	private void Update()
	{
		if (BulletCount < 5)
		{
			if (BulletCount == 4)
			{
				Bullet[0].SetActive(value: true);
				Bullet[1].SetActive(value: true);
				Bullet[2].SetActive(value: true);
				Bullet[3].SetActive(value: true);
				Bullet[4].SetActive(value: false);
			}
			else if (BulletCount == 3)
			{
				Bullet[0].SetActive(value: true);
				Bullet[1].SetActive(value: true);
				Bullet[2].SetActive(value: true);
				Bullet[3].SetActive(value: false);
				Bullet[4].SetActive(value: false);
			}
			else if (BulletCount == 2)
			{
				Bullet[0].SetActive(value: true);
				Bullet[1].SetActive(value: true);
				Bullet[2].SetActive(value: false);
				Bullet[3].SetActive(value: false);
				Bullet[4].SetActive(value: false);
			}
			else if (BulletCount == 1)
			{
				Bullet[0].SetActive(value: true);
				Bullet[1].SetActive(value: false);
				Bullet[2].SetActive(value: false);
				Bullet[3].SetActive(value: false);
				Bullet[4].SetActive(value: false);
			}
			else if (BulletCount == 0)
			{
				Bullet[0].SetActive(value: false);
				Bullet[1].SetActive(value: false);
				Bullet[2].SetActive(value: false);
				Bullet[3].SetActive(value: false);
				Bullet[4].SetActive(value: false);
			}
			BulletTimer += Time.deltaTime;
			if (BulletTimer >= 1.5f)
			{
				BulletCount++;
				BulletTimer = 0f;
			}
		}
		else if (BulletCount >= 5)
		{
			BulletCount = 5;
			BulletTimer = 0f;
			GameObject[] bullet = Bullet;
			for (int i = 0; i < bullet.Length; i++)
			{
				bullet[i].SetActive(value: true);
			}
		}
		if (IsSMove)
		{
			MoveTimer += Time.deltaTime;
		}
		if (IsRotation)
		{
			FireSource.volume = 0.05f;
			FireSource.pitch = 1f;
			base.transform.Rotate(0f, 0f, curSpeed * Time.deltaTime);
		}
		else if (!IsRotation)
		{
			FireSource.volume = 0.3f;
			FireSource.pitch = 1.5f;
			base.transform.position += base.transform.right * Movespeed * Time.deltaTime;
		}
		if (IsShoot)
		{
			if (!IsBonus || (IsBonus && RandomBonus != 2))
			{
				BulletCount--;
				Source.PlayOneShot(ShotFiring);
				if (MoveTimer >= 0.15f)
				{
					base.transform.position += base.transform.right * (0f - Movespeed) * Time.deltaTime;
				}
				Anim.Play("TankShoot");
				Object.Instantiate(BulletPrefab, BulletTransform.position, BulletTransform.rotation).name = base.gameObject.name;
				IsShoot = false;
			}
			else if (RandomBonus == 2)
			{
				Source.PlayOneShot(LaserShootSound);
				if (MoveTimer >= 0.15f)
				{
					base.transform.position += base.transform.right * (0f - Movespeed) * Time.deltaTime;
				}
				Anim.Play("TankShootLaser");
				Object.Instantiate(LaserPrefab, LaserTransform[0].position, LaserTransform[0].rotation).name = base.gameObject.name;
				Object.Instantiate(LaserPrefab, LaserTransform[1].position, LaserTransform[1].rotation).name = base.gameObject.name;
				IsShoot = false;
			}
		}
		if (IsBonus)
		{
			BonusTimer += Time.deltaTime;
			if (BonusTimer <= 10f && RandomBonus == 1 && base.transform.localScale != NewScale)
			{
				base.transform.localScale = Vector3.Lerp(base.transform.localScale, NewScale, scalingRate * Time.deltaTime * 2f);
			}
			if (!Deathmatch)
			{
				if (BonusTimer > 10f)
				{
					BonusTimer = 0f;
					IsBonus = false;
				}
			}
			else if (BonusTimer > 2.5f)
			{
				BonusTimer = 0f;
				IsBonus = false;
			}
		}
		else
		{
			if (IsBonus)
			{
				return;
			}
			if (RandomBonus == 2)
			{
				Source.PlayOneShot(LaserBonusSound);
				TankHead[1].SetActive(value: false);
				TankHead[0].SetActive(value: true);
				RandomBonus = 0;
			}
			else if (RandomBonus == 3)
			{
				if (!Deathmatch)
				{
					Source.PlayOneShot(ShieldOnSound);
				}
				Shield.SetActive(value: false);
				base.gameObject.tag = StartTag;
				RandomBonus = 0;
			}
			else if (RandomBonus == 1 && base.transform.localScale != StartScale)
			{
				base.transform.localScale = Vector3.Lerp(base.transform.localScale, StartScale, scalingRate * Time.deltaTime * 2f);
			}
			else if (RandomBonus == 1 && base.transform.localScale == StartScale)
			{
				RandomBonus = 0;
			}
		}
	}

	public void PlayerButton()
	{
		if (IsSMove)
		{
			if (IsBonus && RandomBonus == 2)
			{
				IsShoot = true;
			}
			else if ((!IsBonus || (IsBonus && RandomBonus != 2)) && BulletCount >= 1)
			{
				IsShoot = true;
			}
			if (RandomSpeed == 1)
			{
				RandomSpeed++;
				curSpeed = 0f - Speed;
			}
			else if (RandomSpeed == 2)
			{
				RandomSpeed = 1;
				curSpeed = Speed;
			}
		}
	}

	public void PressButton()
	{
		if (IsSMove)
		{
			IsRotation = false;
		}
	}

	public void ButtonUp()
	{
		IsRotation = true;
		MoveTimer = 0f;
	}

	public void DestroyTank()
	{
		if (PlayerPrefs.GetInt("IsCups") == 1)
		{
			Camera.main.GetComponent<TankGameController>().AddName(base.gameObject.name);
		}
		GameObject[] trails = Trails;
		for (int i = 0; i < trails.Length; i++)
		{
			trails[i].transform.SetParent(null);
			Object.Instantiate(TankBody, base.transform.position, base.transform.rotation);
			Object.Instantiate(BigExplosion, base.transform.position, base.transform.rotation);
			UnityEngine.Object.Destroy(base.gameObject);
		}
	}

	private void OnTriggerEnter2D(Collider2D other)
	{
		if (other.tag == "Box")
		{
			if (!IsBonus)
			{
				Object.Instantiate(StarEffect, base.transform.position, base.transform.rotation);
				RandomBonus = UnityEngine.Random.Range(1, 4);
				if (RandomBonus == 1)
				{
					Source.PlayOneShot(ToySound);
				}
				else if (RandomBonus == 2)
				{
					Source.PlayOneShot(LaserBonusSound);
					base.transform.localScale = StartScale;
					TankHead[0].SetActive(value: false);
					TankHead[1].SetActive(value: true);
				}
				if (RandomBonus == 3)
				{
					Source.PlayOneShot(ShieldOnSound);
					base.transform.localScale = StartScale;
					Shield.SetActive(value: true);
					base.gameObject.tag = "Untagged";
				}
				IsBonus = true;
				UnityEngine.Object.Destroy(other.gameObject);
			}
			else if (IsBonus)
			{
				UnityEngine.Object.Destroy(other.gameObject);
			}
		}
		else if (other.tag == FlagTag)
		{
			Source.PlayOneShot(powerUp);
			other.gameObject.SetActive(value: false);
			IsGetFlag = true;
			Flag.SetActive(value: true);
		}
		else if (other.tag == MyBaseTag && IsGetFlag)
		{
			if (!isRed)
			{
				FlagController.BlueGoals++;
				FlagController.GameOver();
			}
			else
			{
				FlagController.RedGoals++;
				FlagController.GameOver();
			}
		}
	}
}
