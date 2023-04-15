using UnityEngine;

public class BallScript : MonoBehaviour
{
	private Rigidbody2D rb;

	public float force = 5f;

	public SoccerGameController SGC;

	private void Start()
	{
		rb = GetComponent<Rigidbody2D>();
	}

	private void OnCollisionEnter2D(Collision2D c)
	{
		if (c.gameObject.tag == "Player")
		{
			ContactPoint2D contactPoint2D = c.contacts[0];
			Vector2 a = -(contactPoint2D.point - new Vector2(base.transform.position.x, base.transform.position.y)).normalized;
			rb.AddForce(a * force);
		}
	}

	private void OnTriggerEnter2D(Collider2D other)
	{
		if (other.tag == "RedTeam")
		{
			SGC.BlueGoal();
			if (OptionsIntro.Instance.VibrationCheck == 0)
			{
				OptionsIntro.Instance.TriggerVibrate();
			}
		}
		if (other.tag == "BlueTeam")
		{
			SGC.RedGoal();
			if (OptionsIntro.Instance.VibrationCheck == 0)
			{
				OptionsIntro.Instance.TriggerVibrate();
			}
		}
	}
}
