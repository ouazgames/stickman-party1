using UnityEngine;

public class BoxLifeTime : MonoBehaviour
{
	public float LifeTime;

	public GameObject StarObject;

	public bool isColorGame;

	public bool isRocketBox;

	private ColorGameController Controller;

	private void Start()
	{
		Invoke("DestroyObject", LifeTime);
		if (isColorGame)
		{
			Controller = Camera.main.GetComponent<ColorGameController>();
		}
	}

	private void DestroyObject()
	{
		Object.Instantiate(StarObject, base.transform.position, base.transform.rotation);
		if (isColorGame)
		{
			if (isRocketBox)
			{
				Controller.RocketBoxCount--;
			}
			else
			{
				Controller.ColorBoxCount--;
			}
			Controller.AddName = base.gameObject.name;
			Controller.AddPoint();
		}
		UnityEngine.Object.Destroy(base.gameObject);
	}
}
