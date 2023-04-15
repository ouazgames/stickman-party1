using System.Collections;
using UnityEngine;

public class DistanceComparer : IComparer
{
	private Transform CompareTransform;

	public DistanceComparer(Transform ComTransform)
	{
		CompareTransform = ComTransform;
	}

	public int Compare(object x, object y)
	{
		Collider2D obj = x as Collider2D;
		Collider2D collider2D = y as Collider2D;
		float sqrMagnitude = (obj.transform.position - CompareTransform.position).sqrMagnitude;
		float sqrMagnitude2 = (collider2D.transform.position - CompareTransform.position).sqrMagnitude;
		return sqrMagnitude.CompareTo(sqrMagnitude2);
	}
}
