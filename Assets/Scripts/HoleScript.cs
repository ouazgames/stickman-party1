using UnityEngine;

public class HoleScript : MonoBehaviour
{
	private Color NewColor = new Color32(byte.MaxValue, byte.MaxValue, byte.MaxValue, 0);

	private SpriteRenderer MyColor;

	private void Start()
	{
		MyColor = GetComponent<SpriteRenderer>();
	}

	private void Update()
	{
		MyColor.color = Color.Lerp(MyColor.color, NewColor, 0.001f);
	}
}
