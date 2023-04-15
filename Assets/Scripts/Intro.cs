using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Intro : MonoBehaviour
{
	private void Start()
	{
		StartCoroutine("CountTo");
	}

	private IEnumerator CountTo()
	{
		yield return new WaitForSeconds(3.5f);
		SceneManager.LoadScene(1);
	}
}
