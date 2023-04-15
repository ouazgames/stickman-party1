using UnityEngine;

public class Spriteshadow : MonoBehaviour
{
	public Material Mat;

	public Vector2 offset = new Vector2(-0.01f, -0.01f);

	private SpriteRenderer sprRendCaster;

	private SpriteRenderer sprRendShadow;

	private Transform transCaster;

	private Transform transShadow;

	private void Start()
	{
		transCaster = base.gameObject.transform;
		transShadow = new GameObject().transform;
		transShadow.parent = transCaster;
		transShadow.gameObject.name = "shadow";
		transShadow.localRotation = Quaternion.identity;
		transShadow.localScale = new Vector3(1f, 1f, 1f);
		sprRendCaster = GetComponent<SpriteRenderer>();
		sprRendShadow = transShadow.gameObject.AddComponent<SpriteRenderer>();
		sprRendShadow.sortingLayerName = sprRendCaster.sortingLayerName;
		sprRendShadow.sortingOrder = sprRendCaster.sortingOrder - 1;
		sprRendShadow.color = new Color32(0, 0, 0, 70);
		sprRendShadow.sprite = sprRendCaster.sprite;
		sprRendShadow.material = Mat;
	}

	private void LateUpdate()
	{
		transShadow.position = new Vector2(transCaster.position.x + offset.x, transCaster.position.y + offset.y);
	}
}
