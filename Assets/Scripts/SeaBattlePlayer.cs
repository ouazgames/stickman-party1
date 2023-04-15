using CnControls;
using UnityEngine;

public class SeaBattlePlayer : MonoBehaviour
{
	public bool IsAIPlayer;

	public GameObject CannonBall;

	public Transform Balltransform;

	public LineRenderer LeftLine;

	public LineRenderer RightLine;

	public string BolletName = "";

	public Transform[] LineTransforms;

	public bool IsSMove;

	private Quaternion LastRotation;

	public float RotationAngle;

	public string HorizontalAxys = "";

	public string VertivcalAxys = "";

	private Animation Anim;

	private AudioSource Source;

	public AudioClip RopeSound;

	public AudioClip ShootSound1;

	public AudioClip ShootSound2;

	public AudioClip ReloadSound;

	private float ReloadTimer;

	private bool IsReady;

	private bool isShoot;

	private bool isFire;

	public GameObject FakeBall;

	[Header("Sensors")]
	public GameObjectSens CheckTarget;

	private GameObject Puck;

	private Vector3 targetPosition;

	private float SensorLenght = 1.5f;

	private Vector3 frontSensorPos = new Vector3(0.4f, 0f, 0f);

	private float FrontSideSensorPosition = 0.2f;

	private float FrontSensorAngle = 15f;

	private Vector3 euler;

	private float AiSpeed = 5.2f;

	private bool IsRotation;

	private void Start()
	{
		Anim = GetComponent<Animation>();
		Source = GetComponent<AudioSource>();
		LeftLine.sortingLayerName = "sd";
		LeftLine.sortingOrder = 15;
		RightLine.sortingLayerName = "sd";
		RightLine.sortingOrder = 15;
		FakeBall.SetActive(value: true);
		if (!IsAIPlayer)
		{
			IsReady = true;
			isFire = false;
			isShoot = true;
		}
		else
		{
			IsReady = false;
			isFire = false;
			isShoot = true;
		}
	}

	private void FixedUpdate()
	{
		LastRotation = base.transform.rotation;
		LeftLine.SetPosition(0, LineTransforms[0].position);
		RightLine.SetPosition(0, LineTransforms[1].position);
		LeftLine.SetPosition(1, LineTransforms[2].position);
		RightLine.SetPosition(1, LineTransforms[3].position);
		if (IsSMove && IsAIPlayer)
		{
			Sensors();
		}
	}

	private void Sensors()
	{
		Puck = CheckTarget.Puck;
		if (!Puck)
		{
			return;
		}
		targetPosition = Puck.transform.position;
		RotationAngle = Mathf.Atan2(targetPosition.x, targetPosition.y) * 57.29578f;
		Vector3 vector = targetPosition - base.transform.position;
		Quaternion b = Quaternion.AngleAxis(Mathf.Atan2(vector.y, vector.x) * 57.29578f, Vector3.forward);
		base.transform.rotation = Quaternion.Slerp(base.transform.rotation, b, Time.deltaTime * 4.1f);
		RaycastHit2D raycastHit2D = Physics2D.Raycast(base.transform.position, base.transform.right * SensorLenght);
		if (!(raycastHit2D.collider != null))
		{
			return;
		}
		UnityEngine.Debug.DrawLine(base.transform.position, raycastHit2D.point, Color.red);
		if (Vector3.Distance(base.transform.position, raycastHit2D.point) <= 7.5f && Vector3.Distance(base.transform.position, raycastHit2D.point) > 5.5f)
		{
			if (IsReady && !isFire)
			{
				isShoot = false;
				isFire = true;
				Source.PlayOneShot(RopeSound);
				Anim.Play("SeaBattleAiPlayerAnimation");
			}
		}
		else if (Vector3.Distance(base.transform.position, raycastHit2D.point) <= 5.5f && !isShoot && IsReady)
		{
			isShoot = true;
			IsReady = false;
			switch (UnityEngine.Random.Range(1, 3))
			{
			case 1:
				Source.PlayOneShot(ShootSound1);
				break;
			case 2:
				Source.PlayOneShot(ShootSound2);
				break;
			}
			FakeBall.SetActive(value: false);
			Object.Instantiate(CannonBall, Balltransform.position, Balltransform.rotation).name = BolletName;
			Anim.Play("SeaBattleAiPlayerShootAnim");
		}
	}

	private void Update()
	{
		if (isShoot && !IsReady)
		{
			ReloadTimer += Time.deltaTime;
		}
		if (ReloadTimer >= 2f)
		{
			ReloadTimer = 0f;
			FakeBall.SetActive(value: true);
			Source.PlayOneShot(ReloadSound);
			IsReady = true;
			isFire = false;
		}
		if (IsAIPlayer)
		{
			return;
		}
		if ((CnInputManager.GetAxis(HorizontalAxys) == 0f && CnInputManager.GetAxis(VertivcalAxys) == 0f) || !IsSMove)
		{
			base.transform.rotation = LastRotation;
			if (!isShoot && IsReady)
			{
				isShoot = true;
				IsReady = false;
				switch (UnityEngine.Random.Range(1, 3))
				{
				case 1:
					Source.PlayOneShot(ShootSound1);
					break;
				case 2:
					Source.PlayOneShot(ShootSound2);
					break;
				}
				FakeBall.SetActive(value: false);
				Object.Instantiate(CannonBall, Balltransform.position, Balltransform.rotation).name = BolletName;
				Anim.Play("SeaBattlePlayerShootAnim");
			}
		}
		else if (IsSMove)
		{
			RotationAngle = Mathf.Atan2(CnInputManager.GetAxis(HorizontalAxys), 0f - CnInputManager.GetAxis(VertivcalAxys)) * 57.29578f;
			Quaternion b = Quaternion.Euler(0f, 0f, RotationAngle);
			base.transform.rotation = Quaternion.Slerp(base.transform.rotation, b, Time.deltaTime * 10f);
			if (IsReady && !isFire)
			{
				isShoot = false;
				isFire = true;
				Source.PlayOneShot(RopeSound);
				Anim.Play("SeaBattlePlayerAnimation");
			}
		}
	}
}
