using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FunGamesSocial : MonoBehaviour
{
	public static FunGamesSocial _instance;

	private void Awake()
	{
		if (_instance == null)
		{

			_instance = this;
			DontDestroyOnLoad(this.gameObject);
		}
		else
		{
			Destroy(this);
		}
	}

	// Start is called before the first frame update
	void Start()
	{
		//FunGamesFB.Start();
	}
}
