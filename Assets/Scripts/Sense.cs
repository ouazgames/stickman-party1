using System;
using UnityEngine;

public class Sense : MonoBehaviour
{
	public float checkRadius;

	public LayerMask CheckLayers;

	public Rigidbody2D Puck;

	private void Update()
	{
		Collider2D[] array = Physics2D.OverlapCircleAll(base.transform.position, checkRadius, CheckLayers);
		Array.Sort(array, new DistanceComparer(base.transform));
		if (array.Length != 0)
		{
			Puck = array[0].gameObject.GetComponent<Rigidbody2D>();
		}
	}

	private void OnDrawGizmos()
	{
		Gizmos.DrawWireSphere(base.transform.position, checkRadius);
	}
}
