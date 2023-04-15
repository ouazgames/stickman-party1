using UnityEngine;

public class MetalBallScript : MonoBehaviour
{
	private Rigidbody2D rb;

	private Vector3 oldVel;

	private AudioSource Source;

	private BumperCarGameController BGC;

	private Collider2D MyCollider;

	public float Speed;

	public float mySpeed;

	public AudioClip SpawnSound;

	public AudioClip TriggerSound1;

	public AudioClip TriggerSound2;

	public AudioClip HitSound1;

	public AudioClip HitSound2;

	public AudioClip HitSound3;

	private void Start()
	{
		MyCollider = GetComponent<Collider2D>();
		rb = GetComponent<Rigidbody2D>();
		Source = GetComponent<AudioSource>();
		BGC = Camera.main.GetComponent<BumperCarGameController>();
		base.transform.InverseTransformDirection(rb.velocity);
		rb.velocity = base.transform.up * Speed;
		Invoke("ChangeLayer", 1.5f);
		Source.PlayOneShot(SpawnSound);
	}

	private void ChangeLayer()
	{
		base.gameObject.layer = 0;
	}

	private void FixedUpdate()
	{
		oldVel = rb.velocity;
		mySpeed = rb.velocity.magnitude;
	}

	private void OnCollisionEnter2D(Collision2D collision)
	{
		ContactPoint2D contactPoint2D = collision.contacts[0];
		if (collision.collider.tag == "Player")
		{
			if (mySpeed < 5f)
			{
				rb.velocity = Vector3.Reflect(oldVel * 1.5f, contactPoint2D.normal);
			}
			else if (mySpeed >= 5f)
			{
				rb.velocity = Vector3.Reflect(oldVel, contactPoint2D.normal);
			}
			Source.PlayOneShot(HitSound3);
			return;
		}
		rb.velocity = Vector3.Reflect(oldVel, contactPoint2D.normal);
		switch (UnityEngine.Random.Range(1, 3))
		{
		case 1:
			Source.PlayOneShot(HitSound1);
			break;
		case 2:
			Source.PlayOneShot(HitSound2);
			break;
		}
	}

	private void OnTriggerEnter2D(Collider2D collision)
	{
		if (collision.tag == "RedTeam")
		{
			BGC.RedTeam();
			Invoke("DestroyObject", 3f);
			switch (UnityEngine.Random.Range(1, 3))
			{
			case 1:
				Source.PlayOneShot(TriggerSound1);
				break;
			case 2:
				Source.PlayOneShot(TriggerSound2);
				break;
			}
		}
		else if (collision.tag == "BlueTeam")
		{
			BGC.BlueTeam();
			Invoke("DestroyObject", 3f);
			switch (UnityEngine.Random.Range(1, 3))
			{
			case 1:
				Source.PlayOneShot(TriggerSound1);
				break;
			case 2:
				Source.PlayOneShot(TriggerSound2);
				break;
			}
		}
		else if (collision.tag == "GreenTeam")
		{
			BGC.GreenTeam();
			Invoke("DestroyObject", 3f);
			switch (UnityEngine.Random.Range(1, 3))
			{
			case 1:
				Source.PlayOneShot(TriggerSound1);
				break;
			case 2:
				Source.PlayOneShot(TriggerSound2);
				break;
			}
		}
		else if (collision.tag == "YellowTeam")
		{
			BGC.YellowTeam();
			Invoke("DestroyObject", 3f);
			switch (UnityEngine.Random.Range(1, 3))
			{
			case 1:
				Source.PlayOneShot(TriggerSound1);
				break;
			case 2:
				Source.PlayOneShot(TriggerSound2);
				break;
			}
		}
	}

	private void DestroyObject()
	{
		UnityEngine.Object.Destroy(base.gameObject);
	}
}
