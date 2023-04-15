using UnityEngine;

public class ScrollingUVs_Layers : MonoBehaviour
{
	public Vector2 uvAnimationRate = new Vector2(1f, 0f);

	public string textureName = "_MainTex";

	private Vector2 uvOffset = Vector2.zero;

	private void LateUpdate()
	{
		uvOffset += uvAnimationRate * Time.deltaTime;
		if (GetComponent<Renderer>().enabled)
		{
			GetComponent<Renderer>().sharedMaterial.SetTextureOffset(textureName, uvOffset);
		}
	}
}
