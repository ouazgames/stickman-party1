using System.Collections.Generic;
using UnityEngine;

public class Buoyancy2D : MonoBehaviour
{
	public float dragCoefficent = 0.4f;

	public float angularDragCoefficent = 0.4f;

	public float buoyancyFactor = 0.001f;

	private BoxCollider myBoxCollider;

	private float gravity;

	private Transform myTransform;

	private List<Rigidbody> rigidbodiesUnderWater = new List<Rigidbody>();

	private List<Transform> transformsUnderWater = new List<Transform>();

	private List<FloatingObject> floatingObjectUnderWater = new List<FloatingObject>();

	private void Start()
	{
		myBoxCollider = (GetComponent<Collider>() as BoxCollider);
		gravity = Mathf.Abs(Physics.gravity.y);
		myTransform = base.transform;
	}

	private void FixedUpdate()
	{
		float y = myTransform.TransformPoint(myBoxCollider.extents).y;
		for (int i = 0; i < rigidbodiesUnderWater.Count; i++)
		{
			float d = floatingObjectUnderWater[i].floatingArea.x * floatingObjectUnderWater[i].floatingArea.y;
			float value = (y - (transformsUnderWater[i].position.y - floatingObjectUnderWater[i].floatingArea.y * 0.5f)) / floatingObjectUnderWater[i].floatingArea.y;
			value = Mathf.Clamp01(value);
			Vector3 vector = Vector3.up * value * buoyancyFactor * d / rigidbodiesUnderWater[i].mass * gravity;
			Vector3 vector2 = -rigidbodiesUnderWater[i].velocity * dragCoefficent * rigidbodiesUnderWater[i].mass;
			Vector3 force = vector + vector2;
			UnityEngine.Debug.DrawRay(transformsUnderWater[i].position, vector2, Color.red);
			UnityEngine.Debug.DrawRay(transformsUnderWater[i].position, vector, Color.yellow);
			rigidbodiesUnderWater[i].AddForce(force, ForceMode.Force);
			Vector3 torque = -rigidbodiesUnderWater[i].angularVelocity.normalized * rigidbodiesUnderWater[i].angularVelocity.sqrMagnitude * angularDragCoefficent;
			rigidbodiesUnderWater[i].AddTorque(torque, ForceMode.Force);
		}
	}

	private void OnTriggerEnter(Collider _collider)
	{
		FloatingObject component = _collider.GetComponent<FloatingObject>();
		if (component != null)
		{
			rigidbodiesUnderWater.Add(_collider.GetComponent<Rigidbody>());
			transformsUnderWater.Add(_collider.transform);
			floatingObjectUnderWater.Add(component);
		}
	}

	private void OnTriggerExit(Collider _collider)
	{
		FloatingObject component = _collider.GetComponent<FloatingObject>();
		if (component != null)
		{
			rigidbodiesUnderWater.Remove(_collider.GetComponent<Rigidbody>());
			transformsUnderWater.Remove(_collider.transform);
			floatingObjectUnderWater.Remove(component);
		}
	}
}
