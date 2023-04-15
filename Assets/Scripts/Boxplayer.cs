using UnityEngine;

public class Boxplayer : MonoBehaviour
{
	public GameObject Dizzy;

	private Animation Anim;

	private AudioSource Source;

	public AudioClip KickSound1;

	public AudioClip KickSound2;

	public AudioClip ButtonSound1;

	public AudioClip ButtonSound2;

	public AudioClip HurtSound;

	public bool IsMove;

	private float Timer;

	private float WaitTimer;

	private int PunchCount;

	private int RandomSound;

	public GameObject ButtonObject;

	public Transform Transform1;

	public Transform Transform2;

	public int MyCount;

	public bool IsAIPlayer;

	private float AiTimer;

	private float RandomCount;

	private BoxGameController Controller;

	private void Start()
	{
		IsMove = true;
		Controller = Camera.main.GetComponent<BoxGameController>();
		Anim = GetComponent<Animation>();
		Source = GetComponent<AudioSource>();
		RandomCount = UnityEngine.Random.Range(1f, 3.7f);
	}

	private void Update()
	{
		if (!IsMove)
		{
			return;
		}
		Timer += Time.deltaTime;
		WaitTimer += Time.deltaTime;
		if (PunchCount >= 3)
		{
			IsMove = false;
			Dizzy.SetActive(value: true);
			Source.PlayOneShot(HurtSound);
			Invoke("MoveOn", 3f);
		}
		if (IsAIPlayer)
		{
			AiTimer += Time.deltaTime;
			if (AiTimer >= RandomCount)
			{
				AiButton();
				AiTimer = 0f;
			}
		}
	}

	private void MoveOn()
	{
		IsMove = true;
		PunchCount = 0;
		Dizzy.SetActive(value: false);
	}

	public void PressButton()
	{
		if (!IsAIPlayer && IsMove && Timer >= 0.15f)
		{
			Anim.Play("HandAnimation");
			RandomSound = UnityEngine.Random.Range(1, 3);
			if (RandomSound == 1)
			{
				Source.PlayOneShot(KickSound1);
			}
			else if (RandomSound == 2)
			{
				Source.PlayOneShot(KickSound2);
			}
			if (WaitTimer <= 1f && PunchCount < 3)
			{
				PunchCount++;
				WaitTimer = 0f;
			}
			else if (WaitTimer > 1f && PunchCount < 3)
			{
				WaitTimer = 0f;
				PunchCount = 0;
			}
			Timer = 0f;
		}
	}

	public void AiButton()
	{
		if (IsMove && IsAIPlayer && Timer >= 0.15f)
		{
			Anim.Play("HandAnimation");
			RandomSound = UnityEngine.Random.Range(1, 3);
			if (RandomSound == 1)
			{
				Source.PlayOneShot(KickSound1);
			}
			else if (RandomSound == 2)
			{
				Source.PlayOneShot(KickSound2);
			}
			if (WaitTimer <= 1f && PunchCount < 3)
			{
				PunchCount++;
				WaitTimer = 0f;
			}
			else if (WaitTimer > 1f && PunchCount < 3)
			{
				WaitTimer = 0f;
				PunchCount = 0;
			}
			Timer = 0f;
			RandomCount = UnityEngine.Random.Range(0.3f, 3.7f);
		}
	}

	private void OnTriggerEnter2D(Collider2D collision)
	{
		if (!(collision.tag == "Button"))
		{
			return;
		}
		if (!Controller.PressButton)
		{
			Controller.PressCount = MyCount;
			Controller.BoxButton();
			switch (UnityEngine.Random.Range(1, 3))
			{
			case 1:
				Source.PlayOneShot(ButtonSound1);
				break;
			case 2:
				Source.PlayOneShot(ButtonSound2);
				break;
			}
		}
		if (OptionsIntro.Instance.VibrationCheck == 0)
		{
			OptionsIntro.Instance.TriggerVibrate();
		}
		ButtonObject.transform.position = Transform2.position;
		Invoke("ButtonTransform", 0.2f);
	}

	private void ButtonTransform()
	{
		ButtonObject.transform.position = Transform1.position;
	}
}
