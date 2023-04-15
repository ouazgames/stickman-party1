using System;
using System.Collections.Generic;
using UnityEngine;

namespace UnityMovementAI
{
	public class Spawner : MonoBehaviour
	{
		public Transform obj;

		public Vector2 objectSizeRange = new Vector2(1f, 2f);

		public int numberOfObjects = 10;

		public bool randomizeOrientation;

		public float boundaryPadding = 1f;

		public float spaceBetweenObjects = 1f;

		public MovementAIRigidbody[] thingsToAvoid;

		private Vector3 bottomLeft;

		private Vector3 widthHeight;

		private bool isObj3D;

		[NonSerialized]
		public List<MovementAIRigidbody> objs = new List<MovementAIRigidbody>();

		private void Start()
		{
			MovementAIRigidbody component = obj.GetComponent<MovementAIRigidbody>();
			component.SetUp();
			isObj3D = component.is3D;
			float z = Camera.main.WorldToViewportPoint(Vector3.zero).z;
			bottomLeft = Camera.main.ViewportToWorldPoint(new Vector3(0f, 0f, z));
			Vector3 a = Camera.main.ViewportToWorldPoint(new Vector3(1f, 1f, z));
			widthHeight = a - bottomLeft;
			for (int i = 0; i < numberOfObjects; i++)
			{
				for (int j = 0; j < 10; j++)
				{
					if (TryToCreateObject())
					{
						break;
					}
				}
			}
		}

		private bool TryToCreateObject()
		{
			float num = UnityEngine.Random.Range(objectSizeRange.x, objectSizeRange.y);
			float num2 = num / 2f;
			Vector3 vector = default(Vector3);
			vector.x = bottomLeft.x + UnityEngine.Random.Range(boundaryPadding + num2, widthHeight.x - boundaryPadding - num2);
			if (isObj3D)
			{
				vector.z = bottomLeft.z + UnityEngine.Random.Range(boundaryPadding + num2, widthHeight.z - boundaryPadding - num2);
			}
			else
			{
				vector.y = bottomLeft.y + UnityEngine.Random.Range(boundaryPadding + num2, widthHeight.y - boundaryPadding - num2);
			}
			if (CanPlaceObject(num2, vector))
			{
				Transform transform = UnityEngine.Object.Instantiate(obj, vector, Quaternion.identity);
				if (isObj3D)
				{
					transform.localScale = new Vector3(num, obj.localScale.y, num);
				}
				else
				{
					transform.localScale = new Vector3(num, num, obj.localScale.z);
				}
				if (randomizeOrientation)
				{
					Vector3 eulerAngles = base.transform.eulerAngles;
					if (isObj3D)
					{
						eulerAngles.y = UnityEngine.Random.Range(0f, 360f);
					}
					else
					{
						eulerAngles.z = UnityEngine.Random.Range(0f, 360f);
					}
					base.transform.eulerAngles = eulerAngles;
				}
				objs.Add(transform.GetComponent<MovementAIRigidbody>());
				return true;
			}
			return false;
		}

		private bool CanPlaceObject(float halfSize, Vector3 pos)
		{
			for (int i = 0; i < thingsToAvoid.Length; i++)
			{
				if (Vector3.Distance(thingsToAvoid[i].Position, pos) < halfSize + thingsToAvoid[i].Radius)
				{
					return false;
				}
			}
			foreach (MovementAIRigidbody obj2 in objs)
			{
				if (Vector3.Distance(obj2.Position, pos) < obj2.Radius + spaceBetweenObjects + halfSize)
				{
					return false;
				}
			}
			return true;
		}
	}
}
