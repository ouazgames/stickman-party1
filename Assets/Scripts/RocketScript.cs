using UnityEngine;

public class RocketScript : MonoBehaviour
{
	private Rigidbody2D rb;

	public GameObject SmallExplosion;

	public GameObject DizzyStars;

	private float LifeTime = 10f;

	private float Speed = 9f;

	private void Awake()
	{
		base.transform.SetParent(null);
	}

	private void Start()
	{
		rb = GetComponent<Rigidbody2D>();
		rb.velocity = base.transform.right * Speed;
		UnityEngine.Object.Destroy(base.gameObject, LifeTime);
	}

	private void OnTriggerEnter2D(Collider2D collision)
	{
		if (collision.tag == "Player")
		{
			collision.gameObject.GetComponent<ColorPlayer>().MoveOff();
			Object.Instantiate(DizzyStars, collision.gameObject.transform.position, collision.gameObject.transform.rotation).transform.SetParent(collision.transform);
			Object.Instantiate(SmallExplosion, base.gameObject.transform.position, base.gameObject.transform.rotation);
			UnityEngine.Object.Destroy(base.gameObject);
		}
	}
}
