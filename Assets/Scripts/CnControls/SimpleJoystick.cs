using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace CnControls
{
	public class SimpleJoystick : MonoBehaviour, IDragHandler, IEventSystemHandler, IPointerUpHandler, IPointerDownHandler
	{
		public float MovementRange = 50f;

		public string HorizontalAxisName = "Horizontal";

		public string VerticalAxisName = "Vertical";

		[Space(15f)]
		[Tooltip("Should the joystick be hidden on release?")]
		public bool HideOnRelease;

		[Tooltip("Should the Base image move along with the finger without any constraints?")]
		public bool MoveBase = true;

		[Tooltip("Should the joystick snap to finger? If it's FALSE, the MoveBase checkbox logic will be ommited")]
		public bool SnapsToFinger = true;

		[Tooltip("Constraints on the joystick movement axis")]
		public ControlMovementDirection JoystickMoveAxis = ControlMovementDirection.Both;

		[Tooltip("Image of the joystick base")]
		public Image JoystickBase;

		[Tooltip("Image of the stick itself")]
		public Image Stick;

		[Tooltip("Touch Zone transform")]
		public RectTransform TouchZone;

		private Vector2 _initialStickPosition;

		private Vector2 _intermediateStickPosition;

		private Vector2 _initialBasePosition;

		private RectTransform _baseTransform;

		private RectTransform _stickTransform;

		private float _oneOverMovementRange;

		protected VirtualAxis HorizintalAxis;

		protected VirtualAxis VerticalAxis;

		public Camera CurrentEventCamera
		{
			get;
			set;
		}

		private void Awake()
		{
			_stickTransform = Stick.GetComponent<RectTransform>();
			_baseTransform = JoystickBase.GetComponent<RectTransform>();
			_initialStickPosition = _stickTransform.anchoredPosition;
			_intermediateStickPosition = _initialStickPosition;
			_initialBasePosition = _baseTransform.anchoredPosition;
			_stickTransform.anchoredPosition = _initialStickPosition;
			_baseTransform.anchoredPosition = _initialBasePosition;
			_oneOverMovementRange = 1f / MovementRange;
			if (HideOnRelease)
			{
				Hide(isHidden: true);
			}
		}

		private void OnEnable()
		{
			HorizintalAxis = (HorizintalAxis ?? new VirtualAxis(HorizontalAxisName));
			VerticalAxis = (VerticalAxis ?? new VirtualAxis(VerticalAxisName));
			CnInputManager.RegisterVirtualAxis(HorizintalAxis);
			CnInputManager.RegisterVirtualAxis(VerticalAxis);
			float num3 = HorizintalAxis.Value = (VerticalAxis.Value = 0f);
			_baseTransform.anchoredPosition = _initialBasePosition;
			_stickTransform.anchoredPosition = _initialStickPosition;
			_intermediateStickPosition = _initialStickPosition;
		}

		private void OnDisable()
		{
			CnInputManager.UnregisterVirtualAxis(HorizintalAxis);
			CnInputManager.UnregisterVirtualAxis(VerticalAxis);
		}

		public virtual void OnDrag(PointerEventData eventData)
		{
			CurrentEventCamera = (eventData.pressEventCamera ?? CurrentEventCamera);
			RectTransformUtility.ScreenPointToWorldPointInRectangle(_stickTransform, eventData.position, CurrentEventCamera, out Vector3 worldPoint);
			_stickTransform.position = worldPoint;
			Vector2 anchoredPosition = _stickTransform.anchoredPosition;
			if ((JoystickMoveAxis & ControlMovementDirection.Horizontal) == (ControlMovementDirection)0)
			{
				anchoredPosition.x = _intermediateStickPosition.x;
			}
			if ((JoystickMoveAxis & ControlMovementDirection.Vertical) == (ControlMovementDirection)0)
			{
				anchoredPosition.y = _intermediateStickPosition.y;
			}
			_stickTransform.anchoredPosition = anchoredPosition;
			Vector2 a = new Vector2(anchoredPosition.x, anchoredPosition.y) - _intermediateStickPosition;
			float magnitude = a.magnitude;
			Vector2 a2 = a / magnitude;
			if (magnitude > MovementRange)
			{
				if (MoveBase && SnapsToFinger)
				{
					float d = a.magnitude - MovementRange;
					Vector2 vector = a2 * d;
					_baseTransform.anchoredPosition += vector;
					_intermediateStickPosition += vector;
				}
				else
				{
					_stickTransform.anchoredPosition = _intermediateStickPosition + a2 * MovementRange;
				}
			}
			Vector2 anchoredPosition2 = _stickTransform.anchoredPosition;
			Vector2 vector2 = new Vector2(anchoredPosition2.x, anchoredPosition2.y) - _intermediateStickPosition;
			float value = Mathf.Clamp(vector2.x * _oneOverMovementRange, -1f, 1f);
			float value2 = Mathf.Clamp(vector2.y * _oneOverMovementRange, -1f, 1f);
			HorizintalAxis.Value = value;
			VerticalAxis.Value = value2;
		}

		public void OnPointerUp(PointerEventData eventData)
		{
			_baseTransform.anchoredPosition = _initialBasePosition;
			_stickTransform.anchoredPosition = _initialStickPosition;
			_intermediateStickPosition = _initialStickPosition;
			float num3 = HorizintalAxis.Value = (VerticalAxis.Value = 0f);
			if (HideOnRelease)
			{
				Hide(isHidden: true);
			}
		}

		public void OnPointerDown(PointerEventData eventData)
		{
			if (SnapsToFinger)
			{
				CurrentEventCamera = (eventData.pressEventCamera ?? CurrentEventCamera);
				RectTransformUtility.ScreenPointToWorldPointInRectangle(_stickTransform, eventData.position, CurrentEventCamera, out Vector3 worldPoint);
				RectTransformUtility.ScreenPointToWorldPointInRectangle(_baseTransform, eventData.position, CurrentEventCamera, out Vector3 worldPoint2);
				_baseTransform.position = worldPoint2;
				_stickTransform.position = worldPoint;
				_intermediateStickPosition = _stickTransform.anchoredPosition;
			}
			else
			{
				OnDrag(eventData);
			}
			if (HideOnRelease)
			{
				Hide(isHidden: false);
			}
		}

		private void Hide(bool isHidden)
		{
			JoystickBase.gameObject.SetActive(!isHidden);
			Stick.gameObject.SetActive(!isHidden);
		}
	}
}
