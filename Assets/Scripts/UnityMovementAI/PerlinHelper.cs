using UnityEngine;

namespace UnityMovementAI
{
	public class PerlinHelper
	{
		public int width;

		public int height;

		public Vector2 offset;

		public Vector2 scale;

		public float this[int x, int y]
		{
			get
			{
				float x2 = offset.x + (float)x / (float)width * scale.x;
				float y2 = offset.y + (float)y / (float)height * scale.y;
				return Mathf.PerlinNoise(x2, y2);
			}
		}

		public PerlinHelper(int width, int height, float perlinScale)
		{
			this.width = width;
			this.height = height;
			offset = new Vector2(Random.value * 100000f, Random.value * 100000f);
			float num = (float)width / (float)height;
			scale = new Vector2(perlinScale * num, perlinScale);
		}
	}
}
