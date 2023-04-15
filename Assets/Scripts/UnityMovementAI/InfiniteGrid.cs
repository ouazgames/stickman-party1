using UnityEngine;

namespace UnityMovementAI
{
	public class InfiniteGrid : MonoBehaviour
	{
		public bool show = true;

		public float cellSize = 1f;

		public Vector3 gridLocation;

		private Vector3 bottomLeft;

		private Vector3 topRight;

		private Vector3 upDir;

		private Vector3 rightDir;

		private Vector3 oneByOneDiagonal;

		private Vector2 widthHeight;

		public Material lineMat;

		private void GetGridBounds()
		{
			float z = Camera.main.WorldToViewportPoint(gridLocation).z;
			bottomLeft = Camera.main.ViewportToWorldPoint(new Vector3(0f, 0f, z));
			topRight = Camera.main.ViewportToWorldPoint(new Vector3(1f, 1f, z));
			Vector3 a = Camera.main.ViewportToWorldPoint(new Vector3(1f, 0f, z));
			Vector3 a2 = Camera.main.ViewportToWorldPoint(new Vector3(0f, 1f, z));
			rightDir = a - bottomLeft;
			rightDir.Normalize();
			upDir = a2 - bottomLeft;
			upDir.Normalize();
			oneByOneDiagonal = (rightDir + upDir).normalized * Mathf.Sqrt(cellSize * cellSize + cellSize * cellSize);
			ConvertToGridBounds();
		}

		private void ConvertToGridBounds()
		{
			Vector3 a = ProjectAndExtend(bottomLeft, rightDir, shouldFloor: true);
			Vector3 b = ProjectAndExtend(bottomLeft, upDir, shouldFloor: true);
			bottomLeft = a + b - oneByOneDiagonal;
			a = ProjectAndExtend(topRight, rightDir, shouldFloor: false);
			b = ProjectAndExtend(topRight, upDir, shouldFloor: false);
			topRight = a + b + oneByOneDiagonal;
			Vector3 vector = topRight - bottomLeft;
			widthHeight.x = Vector3.Project(vector, rightDir).magnitude;
			widthHeight.y = Vector3.Project(vector, upDir).magnitude;
		}

		private Vector3 ProjectAndExtend(Vector3 vector, Vector3 onNormal, bool shouldFloor)
		{
			Vector3 vector2 = Vector3.Project(vector, onNormal);
			float d = Mathf.Floor(vector2.magnitude / cellSize) * cellSize;
			return vector2.normalized * d;
		}

		private void OnPostRender()
		{
			GL.Begin(1);
			if (show)
			{
				lineMat.SetPass(0);
				GetGridBounds();
				for (float num = 0f; num <= widthHeight.y; num += 1f)
				{
					Vector3 vector = bottomLeft + upDir * num;
					Vector3 vector2 = vector + rightDir * widthHeight.x;
					GL.Vertex3(vector.x, vector.y, vector.z);
					GL.Vertex3(vector2.x, vector2.y, vector2.z);
				}
				for (float num2 = 0f; num2 <= widthHeight.x; num2 += 1f)
				{
					Vector3 vector3 = bottomLeft + rightDir * num2;
					Vector3 vector4 = vector3 + upDir * widthHeight.y;
					GL.Vertex3(vector3.x, vector3.y, vector3.z);
					GL.Vertex3(vector4.x, vector4.y, vector4.z);
				}
			}
			GL.End();
		}
	}
}
