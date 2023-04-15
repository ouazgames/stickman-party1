using UnityEngine;

namespace UnityMovementAI
{
	public class FirstPersonCamera : MonoBehaviour
	{
		public float speed = 15f;

		public float xSensitivity = 2f;

		public float ySensitivity = 2f;

		public bool clampVerticalRotation = true;

		private CursorLockMode wantedMode;

		private void Start()
		{
			wantedMode = CursorLockMode.Locked;
		}

		private void Update()
		{
			UpdateCursor();
			if (Cursor.lockState == CursorLockMode.Locked)
			{
				RotateCamera();
				MoveCamera();
			}
		}

		private void UpdateCursor()
		{
			if (UnityEngine.Input.GetKeyDown(KeyCode.Escape))
			{
				wantedMode = CursorLockMode.None;
			}
			if (Input.GetMouseButtonDown(0) || Input.GetMouseButtonDown(1) || Input.GetMouseButtonDown(2))
			{
				wantedMode = CursorLockMode.Locked;
			}
			Cursor.lockState = wantedMode;
			Cursor.visible = (CursorLockMode.Locked != wantedMode);
		}

		private void RotateCamera()
		{
			float y = UnityEngine.Input.GetAxis("Mouse X") * xSensitivity;
			float num = -1f * UnityEngine.Input.GetAxis("Mouse Y") * ySensitivity;
			if (clampVerticalRotation)
			{
				num = ClampXAxisRotation(num);
			}
			base.transform.Rotate(new Vector3(num, 0f, 0f), Space.Self);
			base.transform.Rotate(new Vector3(0f, y, 0f), Space.World);
		}

		private float ClampXAxisRotation(float xRot)
		{
			float x = base.transform.localEulerAngles.x;
			float num = x + xRot;
			if (num > 90f && num < 270f)
			{
				xRot = ((!(xRot > 0f)) ? (270f - x) : (90f - x));
			}
			return xRot;
		}

		private void MoveCamera()
		{
			float axisRaw = UnityEngine.Input.GetAxisRaw("Vertical");
			float axisRaw2 = UnityEngine.Input.GetAxisRaw("Horizontal");
			Vector3 a = base.transform.right * axisRaw2 + base.transform.forward * axisRaw;
			if (Input.GetButton("Jump"))
			{
				a += base.transform.up;
			}
			base.transform.position += a.normalized * speed * Time.deltaTime;
		}
	}
}
