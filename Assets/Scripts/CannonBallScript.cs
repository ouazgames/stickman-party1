using UnityEngine;
using UnityEngine.UI;

public class CannonBallScript : MonoBehaviour
{
	public GameObject ShipRuin;

	public GameObject Splash;

	public GameObject BigExplosion;

	public float ForcePower;

	private string PlayerTag = "";

	public string MyTag = "";

	public float MoveSpeed;

	private Rigidbody2D rb;

	public GameObject TextPrefab;

	private float LifeTime = 3.5f;

	private SeaBattleController Controller;

	private void Start()
	{
		Controller = Camera.main.GetComponent<SeaBattleController>();
		UnityEngine.Object.Destroy(base.gameObject, LifeTime);
		rb = GetComponent<Rigidbody2D>();
		rb.AddForce(base.transform.right * ForcePower, ForceMode2D.Impulse);
	}

	private void OnCollisionEnter2D(Collision2D collision)
	{
		if (collision.collider.gameObject.name == base.gameObject.name)
		{
			Object.Instantiate(TextPrefab, collision.collider.gameObject.transform.position, Quaternion.identity).GetComponentInChildren<Text>().text = "-1";
			if (base.gameObject.name == "ShipRed")
			{
				Controller.DeleteRedPoint();
			}
			else if (base.gameObject.name == "ShipBlue")
			{
				Controller.DeleteBluePoint();
			}
			else if (base.gameObject.name == "ShipGreen")
			{
				Controller.DeleteGreenPoint();
			}
			else if (base.gameObject.name == "ShipYellow")
			{
				Controller.DeleteYellowPoint();
			}
			if (OptionsIntro.Instance.VibrationCheck == 0)
			{
				OptionsIntro.Instance.TriggerVibrate();
			}
			Object.Instantiate(BigExplosion, base.transform.position, Quaternion.identity);
			Object.Instantiate(ShipRuin, collision.gameObject.transform.position, collision.gameObject.transform.rotation);
			UnityEngine.Object.Destroy(collision.gameObject);
			UnityEngine.Object.Destroy(base.gameObject);
		}
		else if (collision.collider.gameObject.name != base.gameObject.name)
		{
			Object.Instantiate(TextPrefab, collision.collider.gameObject.transform.position, Quaternion.identity).GetComponentInChildren<Text>().text = "+1";
			if (base.gameObject.name == "ShipRed")
			{
				Controller.AddRedPoint();
			}
			else if (base.gameObject.name == "ShipBlue")
			{
				Controller.AddBluePoint();
			}
			else if (base.gameObject.name == "ShipGreen")
			{
				Controller.AddGreenPoint();
			}
			else if (base.gameObject.name == "ShipYellow")
			{
				Controller.AddYellowPoint();
			}
			if (OptionsIntro.Instance.VibrationCheck == 0)
			{
				OptionsIntro.Instance.TriggerVibrate();
			}
			Object.Instantiate(BigExplosion, base.transform.position, Quaternion.identity);
			Object.Instantiate(ShipRuin, collision.gameObject.transform.position, collision.gameObject.transform.rotation);
			UnityEngine.Object.Destroy(collision.gameObject);
			UnityEngine.Object.Destroy(base.gameObject);
		}
	}

	private void FixedUpdate()
	{
		MoveSpeed = rb.velocity.magnitude;
		if (MoveSpeed <= 3.5f)
		{
			Object.Instantiate(Splash, base.transform.position, base.transform.rotation);
			UnityEngine.Object.Destroy(base.gameObject);
		}
	}
}
