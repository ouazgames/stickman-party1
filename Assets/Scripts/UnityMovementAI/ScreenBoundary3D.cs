using UnityEngine;

namespace UnityMovementAI
{
	public class ScreenBoundary3D : MonoBehaviour
	{
		private Vector3 bottomLeft;

		private Vector3 topRight;

		private Vector3 widthHeight;

		private void Start()
		{
			float z = Mathf.Abs(Camera.main.transform.position.y);
			bottomLeft = Camera.main.ViewportToWorldPoint(new Vector3(0f, 0f, z));
			topRight = Camera.main.ViewportToWorldPoint(new Vector3(1f, 1f, z));
			widthHeight = topRight - bottomLeft;
			base.transform.localScale = new Vector3(widthHeight.x, base.transform.localScale.y, widthHeight.z);
		}

		private void OnTriggerStay(Collider other)
		{
			KeepInBounds(other);
		}

		private void OnTriggerExit(Collider other)
		{
			KeepInBounds(other);
		}

		private void KeepInBounds(Collider other)
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
			if (transform.position.z < bottomLeft.z)
			{
				transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z + widthHeight.z);
			}
			if (transform.position.z > topRight.z)
			{
				transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z - widthHeight.z);
			}
		}
	}
}
