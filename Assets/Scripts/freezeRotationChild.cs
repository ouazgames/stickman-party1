using UnityEngine;

public class freezeRotationChild : MonoBehaviour
{
	private Quaternion iniRot;

	private void Awake()
	{
		iniRot = base.transform.rotation;
	}

	private void LateUpdate()
	{
		base.transform.rotation = iniRot;
	}
}
