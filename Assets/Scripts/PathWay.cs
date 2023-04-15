using System;
using System.Collections.Generic;
using UnityEngine;

public class PathWay : MonoBehaviour
{
	public Color lineColor;

	private List<Transform> nodes = new List<Transform>();

	public static string DirectorySeparatorChar
	{
		get;
		set;
	}

	private void OnDrawGizmos()
	{
		Gizmos.color = lineColor;
		Transform[] componentsInChildren = GetComponentsInChildren<Transform>();
		nodes = new List<Transform>();
		for (int i = 0; i < componentsInChildren.Length; i++)
		{
			if (componentsInChildren[i] != base.transform)
			{
				nodes.Add(componentsInChildren[i]);
			}
		}
		for (int j = 0; j < nodes.Count; j++)
		{
			Vector3 position = nodes[j].position;
			Vector3 from = Vector3.zero;
			if (j > 0)
			{
				from = nodes[j - 1].position;
			}
			else if (j == 0 && nodes.Count > 1)
			{
				from = nodes[nodes.Count - 1].position;
			}
			Gizmos.DrawLine(from, position);
			Gizmos.DrawSphere(position, 0.1f);
		}
	}

	public static string GetDirectoryName(string spritePath)
	{
		throw new NotImplementedException();
	}
}
