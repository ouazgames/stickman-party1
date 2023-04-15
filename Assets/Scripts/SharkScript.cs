using System.Collections.Generic;
using UnityEngine;

public class SharkScript : MonoBehaviour
{
	public bool IsShip;

	public bool IsBats;

	public Transform Path;

	public float MaxSteerAngle = 45f;

	private List<Transform> nodes;

	private Quaternion LastRotation;

	public float MoveSpeed;

	public float speed = 5f;

	public float MaxSpeed = 5f;

	private int curnode;

	private Vector2 targetVelocity;

	private Rigidbody2D rb;

	private void Start()
	{
		rb = GetComponent<Rigidbody2D>();
		Transform[] componentsInChildren = Path.GetComponentsInChildren<Transform>();
		nodes = new List<Transform>();
		for (int i = 0; i < componentsInChildren.Length; i++)
		{
			if (componentsInChildren[i] != Path.transform)
			{
				nodes.Add(componentsInChildren[i]);
			}
		}
	}

	private void FixedUpdate()
	{
		Applysteer();
		Drive();
		CheckWaypointDistance();
		MoveSpeed = rb.velocity.magnitude;
	}

	private void Applysteer()
	{
		Vector3 vector = nodes[curnode].position - base.transform.position;
		Quaternion b = Quaternion.AngleAxis(Mathf.Atan2(vector.y, vector.x) * 57.29578f, Vector3.forward);
		base.transform.rotation = Quaternion.Slerp(base.transform.rotation, b, Time.deltaTime * 1f);
	}

	private void Drive()
	{
		if (!IsBats)
		{
			if (MoveSpeed <= 3f)
			{
				rb.AddForce(base.transform.right * speed);
			}
		}
		else if (MoveSpeed <= MaxSpeed)
		{
			rb.AddForce(base.transform.right * speed);
		}
	}

	private void CheckWaypointDistance()
	{
		if (Vector3.Distance(base.transform.position, nodes[curnode].position) < 4.5f)
		{
			if (curnode == nodes.Count - 1)
			{
				curnode = 0;
			}
			else
			{
				curnode++;
			}
		}
	}

	private void OnTriggerEnter2D(Collider2D collision)
	{
		if (IsShip && collision.tag == "Finish")
		{
			UnityEngine.Object.Destroy(base.gameObject);
		}
	}
}
