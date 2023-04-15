using System;
using UnityEngine;

public class GameObjectSens : MonoBehaviour
{
	public float checkRadius;

	public LayerMask CheckLayers;

	public GameObject Puck;

	public Collider2D[] Colliders;

	private void Update()
	{
		Colliders = Physics2D.OverlapCircleAll(base.transform.position, checkRadius, CheckLayers);
		Array.Sort(Colliders, new DistanceComparer(base.transform));
		if (Colliders.Length != 0)
		{
			Puck = Colliders[0].gameObject;
		}
	}

	private void OnDrawGizmos()
	{
		Gizmos.DrawWireSphere(base.transform.position, checkRadius);
	}
}
