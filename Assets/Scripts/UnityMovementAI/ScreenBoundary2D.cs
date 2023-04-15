using UnityEngine;

namespace UnityMovementAI
{
	public class ScreenBoundary2D : MonoBehaviour
	{
		private Vector3 bottomLeft;

		private Vector3 topRight;

		private Vector3 widthHeight;

		private void Start()
		{
			float z = Mathf.Abs(Camera.main.transform.position.z);
			bottomLeft = Camera.main.ViewportToWorldPoint(new Vector3(0f, 0f, z));
			topRight = Camera.main.ViewportToWorldPoint(new Vector3(1f, 1f, z));
			widthHeight = topRight - bottomLeft;
			base.transform.localScale = new Vector3(widthHeight.x, widthHeight.y, base.transform.localScale.z);
		}

		private void OnTriggerStay2D(Collider2D other)
		{
			KeepInBounds(other);
		}

		private void OnTriggerExit2D(Collider2D other)
		{
			KeepInBounds(other);
		}

		private void KeepInBounds(Collider2D other)
		{
			Transform transform = other.transform;
			if (transform.position.x < bottomLeft.x)
			{
				transform.position = new Vector3(transform.position.x + widthHeight.x, transform.position.y, transform.position.z);
			}
			if (transform.position.x > topRight.x)
			{
				transform.position = new Vector3(transform.position.x - widthHeight.x, transform.position.y, transform.position.z);
			}
			if (transform.position.y < bottomLeft.y)
			{
				transform.position = new Vector3(transform.position.x, transform.position.y + widthHeight.y, transform.position.z);
			}
			if (transform.position.y > topRight.y)
			{
				transform.position = new Vector3(transform.position.x, transform.position.y - widthHeight.y, transform.position.z);
			}
		}
	}
}
