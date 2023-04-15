using UnityEngine;

public class BooletScript : MonoBehaviour
{
	public GameObject BigExplosion;

	public GameObject HolePrefab;

	public float ForcePower;

	public GameObject ExplosionPrefab;

	public bool IsDeathMatch;

	public bool IsCaptureFlag;

	private string PlayerTag = "";

	public string MyTag = "";

	private void Awake()
	{
		if (IsCaptureFlag)
		{
			PlayerTag = MyTag;
		}
		else
		{
			PlayerTag = "Player";
		}
	}

	private void Start()
	{
		GetComponent<Rigidbody2D>().AddForce(base.transform.right * ForcePower, ForceMode2D.Impulse);
	}

	private void OnTriggerEnter2D(Collider2D collision)
	{
		if (collision.name == base.gameObject.name)
		{
			return;
		}
		if (collision.tag == PlayerTag && collision.name != base.gameObject.name)
		{
			Object.Instantiate(ExplosionPrefab, base.transform.position, Quaternion.identity);
			if (IsDeathMatch)
			{
				TankDeathmatchController component = Camera.main.GetComponent<TankDeathmatchController>();
				collision.gameObject.SetActive(value: false);
				Object.Instantiate(BigExplosion, base.transform.position, base.transform.rotation);
				if (base.gameObject.name == "PlayerRed")
				{
					component.AddRed();
				}
				else if (base.gameObject.name == "PlayerBlue")
				{
					component.AddBlue();
				}
				else if (base.gameObject.name == "PlayerGreen")
				{
					component.AddGreen();
				}
				else if (base.gameObject.name == "PlayerYellow")
				{
					component.AddYellow();
				}
				if (OptionsIntro.Instance.VibrationCheck == 0)
				{
					OptionsIntro.Instance.TriggerVibrate();
				}
			}
			else if (!IsCaptureFlag && !IsDeathMatch)
			{
				if (collision.GetComponent<TankScript>() != null)
				{
					collision.GetComponent<TankScript>().DestroyTank();
				}
				else
				{
					collision.GetComponent<TankAI>().DestroyTank();
				}
				if (OptionsIntro.Instance.VibrationCheck == 0)
				{
					OptionsIntro.Instance.TriggerVibrate();
				}
			}
			else if (IsCaptureFlag && !IsDeathMatch)
			{
				if (collision.GetComponent<TankScript>() != null)
				{
					if (collision.GetComponent<TankScript>().IsGetFlag)
					{
						if (collision.tag == "PlayerRed")
						{
							Camera.main.GetComponent<FlagGameController>().ActiveBlueFlag();
						}
						else if (collision.tag == "PlayerBlue")
						{
							Camera.main.GetComponent<FlagGameController>().ActiveRedFlag();
						}
					}
				}
				else if (collision.GetComponent<TankAI>().IsGetFlag)
				{
					if (collision.tag == "PlayerRed")
					{
						Camera.main.GetComponent<FlagGameController>().ActiveBlueFlag();
					}
					else if (collision.tag == "PlayerBlue")
					{
						Camera.main.GetComponent<FlagGameController>().ActiveRedFlag();
					}
				}
				collision.gameObject.SetActive(value: false);
				if (OptionsIntro.Instance.VibrationCheck == 0)
				{
					OptionsIntro.Instance.TriggerVibrate();
				}
				Object.Instantiate(BigExplosion, base.transform.position, base.transform.rotation);
			}
			if (HolePrefab != null)
			{
				Object.Instantiate(HolePrefab, base.transform.position, base.transform.rotation);
			}
			UnityEngine.Object.Destroy(base.gameObject);
		}
		else if (collision.tag == "Hazard")
		{
			UnityEngine.Object.Destroy(collision.gameObject);
			Object.Instantiate(ExplosionPrefab, base.transform.position, Quaternion.identity);
			if (HolePrefab != null)
			{
				Object.Instantiate(HolePrefab, base.transform.position, base.transform.rotation);
			}
			UnityEngine.Object.Destroy(base.gameObject);
		}
		else
		{
			Object.Instantiate(ExplosionPrefab, base.transform.position, Quaternion.identity);
			if (HolePrefab != null)
			{
				Object.Instantiate(HolePrefab, base.transform.position, base.transform.rotation);
			}
			UnityEngine.Object.Destroy(base.gameObject);
		}
	}
}
