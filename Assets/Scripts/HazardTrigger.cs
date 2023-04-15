using UnityEngine;

public class HazardTrigger : MonoBehaviour
{
	public MoveOnPathScript MS;

	private bool ChackPlayer;

	private void OnTriggerEnter2D(Collider2D collision)
	{
		if (collision.tag == "Player" && !ChackPlayer)
		{
			MS.IsMove = true;
			ChackPlayer = true;
		}
	}
}
