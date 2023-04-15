using UnityEngine;

public class CameraManager : MonoBehaviour
{
	public float horizontalResolution = 1920f;

	private void OnGUI()
	{
		float num = (float)Screen.width / (float)Screen.height;
		Camera.main.orthographicSize = horizontalResolution / num / 200f;
	}
}
