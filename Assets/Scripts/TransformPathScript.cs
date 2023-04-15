using System.Collections.Generic;
using UnityEngine;

public class TransformPathScript : MonoBehaviour
{
	public Color RayColor = Color.yellow;

	public List<Transform> path_objs = new List<Transform>();

	private Transform[] theArray;

	private void OnDrawGizmos()
	{
		Gizmos.color = RayColor;
		theArray = GetComponentsInChildren<Transform>();
		path_objs.Clear();
		Transform[] array = theArray;
		foreach (Transform transform in array)
		{
			if (transform != base.transform)
			{
				path_objs.Add(transform);
			}
			for (int j = 0; j < path_objs.Count; j++)
			{
				Vector3 position = path_objs[j].position;
				if (j > 0)
				{
					Gizmos.DrawLine(path_objs[j - 1].position, position);
					Gizmos.DrawWireSphere(position, 0.2f);
				}
			}
		}
	}
}
