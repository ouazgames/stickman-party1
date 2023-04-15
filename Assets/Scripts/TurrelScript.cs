using UnityEngine;

public class TurrelScript : MonoBehaviour
{
	public bool IsNeedRotation;

	public GameObject LaserPrefab;

	public Transform[] LaserTransform;

	private float RotationAngle;

	public Rigidbody2D[] PuckArray;

	public Rigidbody2D Puck;

	private Vector3 targetPosition;

	public float RotationSpeed;

	public float ShootTime;

	public GameObject CheckTarget;

	private float ShhotTimer;

	private float avoidingMultiplair = 40f;

	private void Start()
	{
	}

	private void Update()
	{
		ShhotTimer += Time.deltaTime;
		if (ShhotTimer >= ShootTime && !IsNeedRotation)
		{
			Object.Instantiate(LaserPrefab, LaserTransform[0].position, LaserTransform[0].rotation).name = base.gameObject.name;
			Object.Instantiate(LaserPrefab, LaserTransform[1].position, LaserTransform[1].rotation).name = base.gameObject.name;
			ShhotTimer = 0f;
		}
		else if (ShhotTimer >= ShootTime && IsNeedRotation && (bool)Puck)
		{
			Object.Instantiate(LaserPrefab, LaserTransform[0].position, LaserTransform[0].rotation).name = base.gameObject.name;
			Object.Instantiate(LaserPrefab, LaserTransform[1].position, LaserTransform[1].rotation).name = base.gameObject.name;
			ShhotTimer = 0f;
		}
	}

	private void FixedUpdate()
	{
		if (IsNeedRotation)
		{
			Puck = CheckTarget.GetComponent<Sense>().Puck;
			if ((bool)Puck)
			{
				targetPosition = Puck.transform.position;
				RotationAngle = Mathf.Atan2(targetPosition.x, targetPosition.y) * 57.29578f;
				Vector3 vector = targetPosition - base.transform.position;
				Quaternion b = Quaternion.AngleAxis(Mathf.Atan2(vector.y, vector.x) * 57.29578f, Vector3.forward);
				base.transform.rotation = Quaternion.Slerp(base.transform.rotation, b, Time.deltaTime * 1.3f);
			}
		}
	}
}
