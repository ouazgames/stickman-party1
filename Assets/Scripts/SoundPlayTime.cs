using UnityEngine;

public class SoundPlayTime : MonoBehaviour
{
	public bool playOnAwake;

	public bool loopCheck;

	private float timer;

	public float waitTime = 1f;

	private float loopTime;

	public float loopWaitTime;

	private bool flag;

	public AudioClip sound01;

	private AudioSource audioSource;

	private void Start()
	{
		loopTime = loopWaitTime;
		audioSource = GetComponent<AudioSource>();
		audioSource.playOnAwake = playOnAwake;
		if (audioSource.playOnAwake)
		{
			audioSource.clip = sound01;
			audioSource.Play();
			if (!loopCheck)
			{
				UnityEngine.Object.Destroy(this);
			}
		}
		else
		{
			loopTime = 0f;
		}
	}

	private void Update()
	{
		loopTime -= Time.deltaTime;
		timer += Time.deltaTime;
		if (timer >= waitTime && !flag && loopTime <= 0f)
		{
			audioSource.clip = sound01;
			audioSource.Play();
			flag = false;
			loopTime = loopWaitTime;
			if (!loopCheck)
			{
				UnityEngine.Object.Destroy(this);
			}
		}
	}
}
