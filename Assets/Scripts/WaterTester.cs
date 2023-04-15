using UnityEngine;

public class WaterTester : MonoBehaviour
{
	public Water2D water;

	public float force;

	public int size;

	public GameObject objectToInstantiate;

	private void Awake()
	{
	}

	private void Update()
	{
		if (Input.GetMouseButtonDown(0))
		{
			Vector3 vector = Camera.main.ScreenToWorldPoint(new Vector3(UnityEngine.Input.mousePosition.x, UnityEngine.Input.mousePosition.y, water.transform.position.z - base.transform.position.z));
			if (objectToInstantiate != null)
			{
				GameObject gameObject = UnityEngine.Object.Instantiate(objectToInstantiate, vector + Vector3.forward * 10f, Quaternion.identity);
				gameObject.transform.eulerAngles = new Vector3(0f, -180f, UnityEngine.Random.Range(0, 360));
				gameObject.transform.localScale = Vector3.one * UnityEngine.Random.Range(0.5f, 1.3f);
				gameObject.GetComponent<Rigidbody>().mass = Mathf.Lerp(0.1f, 1f, Mathf.InverseLerp(0.5f, 1.3f, gameObject.transform.localScale.x));
			}
			else
			{
				water.ObjectEnteredWater(vector, force, size, _emitParticles: true);
			}
		}
	}
}
