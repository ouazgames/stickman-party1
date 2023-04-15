using UnityEngine;

[ExecuteInEditMode]
[RequireComponent(typeof(SpriteCycle))]
public class SpriteCycleParallax : MonoBehaviour
{
	public Transform target;

	public Vector2 factor;

	private SpriteCycle spriteCicle;

	private void Awake()
	{
		spriteCicle = GetComponent<SpriteCycle>();
	}

	private void Start()
	{
		if (!target && (bool)Camera.main)
		{
			target = Camera.main.transform;
		}
	}

	private void Update()
	{
		if ((bool)target && (bool)spriteCicle)
		{
			spriteCicle.position = target.position.x * factor.x;
			Vector3 localPosition = base.transform.localPosition;
			localPosition.y = target.position.y * factor.y;
			base.transform.localPosition = localPosition;
		}
	}
}
