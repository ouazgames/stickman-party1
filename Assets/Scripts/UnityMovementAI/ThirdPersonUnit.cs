using UnityEngine;

namespace UnityMovementAI
{
	[RequireComponent(typeof(MovementAIRigidbody))]
	[RequireComponent(typeof(Camera))]
	public class ThirdPersonUnit : MonoBehaviour
	{
		public float speed = 5f;

		public float facingSpeed = 720f;

		public float jumpSpeed = 7f;

		public bool autoAttachToCamera = true;

		private MovementAIRigidbody rb;

		private Transform cam;

		private float horAxis;

		private float vertAxis;

		private void Start()
		{
			rb = GetComponent<MovementAIRigidbody>();
			cam = Camera.main.transform;
			if (autoAttachToCamera)
			{
				cam.GetComponent<ThirdPersonCamera>().target = base.transform;
			}
		}

		private void Update()
		{
			horAxis = UnityEngine.Input.GetAxisRaw("Horizontal");
			vertAxis = UnityEngine.Input.GetAxisRaw("Vertical");
			if (Input.GetButtonDown("Jump"))
			{
				rb.Jump(jumpSpeed);
			}
		}

		private void FixedUpdate()
		{
			if (Cursor.lockState == CursorLockMode.Locked)
			{
				rb.Velocity = GetMovementDir() * speed;
			}
			else
			{
				rb.Velocity = Vector3.zero;
			}
		}

		private void LateUpdate()
		{
			if (Cursor.lockState == CursorLockMode.Locked)
			{
				Vector3 movementDir = GetMovementDir();
				if (movementDir.magnitude > 0f)
				{
					float y = base.transform.eulerAngles.y;
					float target = Mathf.Atan2(0f - movementDir.z, movementDir.x) * 57.29578f;
					rb.Rotation = Quaternion.Euler(0f, Mathf.MoveTowardsAngle(y, target, facingSpeed * Time.deltaTime), 0f);
				}
			}
		}

		private Vector3 GetMovementDir()
		{
			return (cam.forward * vertAxis + cam.right * horAxis).normalized;
		}
	}
}
