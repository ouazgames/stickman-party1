using UnityEngine;

namespace UnityMovementAI
{
	public class ThirdPersonCamera : MonoBehaviour
	{
		public float distance = 5f;

		public float sensitivityX = 4f;

		public float sensitivityY = 1f;

		public float minY = 10f;

		public float maxY = 50f;

		public Transform target;

		public Vector3 targetOffset = new Vector3(0f, 1f, 0f);

		private float currentX;

		private float currentY;

		public static CursorLockMode cursorMode;

		private void Start()
		{
			cursorMode = CursorLockMode.Locked;
		}

		private void Update()
		{
			UpdateCursor();
			if (Cursor.lockState == CursorLockMode.Locked)
			{
				currentX += UnityEngine.Input.GetAxis("Mouse X");
				currentY += -1f * UnityEngine.Input.GetAxis("Mouse Y");
				currentY = Mathf.Clamp(currentY, minY, maxY);
			}
		}

		private void UpdateCursor()
		{
			if (UnityEngine.Input.GetKeyDown(KeyCode.Escape))
			{
				cursorMode = CursorLockMode.None;
			}
			if (target != null && (Input.GetMouseButtonDown(0) || Input.GetMouseButtonDown(1) || Input.GetMouseButtonDown(2)))
			{
				cursorMode = CursorLockMode.Locked;
			}
			Cursor.lockState = cursorMode;
			Cursor.visible = (CursorLockMode.Locked != cursorMode);
		}

		private void LateUpdate()
		{
			if (target != null)
			{
				Vector3 point = new Vector3(0f, 0f, 0f - distance);
				Quaternion rotation = Quaternion.Euler(currentY, currentX, 0f);
				base.transform.position = target.position + targetOffset + rotation * point;
				base.transform.LookAt(target.position + targetOffset);
			}
		}
	}
}
