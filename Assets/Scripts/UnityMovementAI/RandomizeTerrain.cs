using UnityEngine;

namespace UnityMovementAI
{
	public class RandomizeTerrain : MonoBehaviour
	{
		public float perlinScale = 10f;

		public float minHeight;

		public float maxHeight = 10f;

		public float circleCutoff = 12f;

		public int numSmoothings = 3;

		public void Randomize()
		{
			GenerateHeights(GetComponent<Terrain>(), perlinScale);
		}

		public void GenerateHeights(Terrain terrain, float perlinScale)
		{
			float num = terrain.terrainData.heightmapResolution / 2;
			float num2 = num - circleCutoff;
			Vector2 b = new Vector2(num, num);
			float num3 = minHeight / terrain.terrainData.heightmapScale.y;
			float num4 = maxHeight / terrain.terrainData.heightmapScale.y;
			PerlinHelper perlinHelper = new PerlinHelper(terrain.terrainData.heightmapResolution, terrain.terrainData.heightmapResolution, perlinScale);
			float[,] array = new float[terrain.terrainData.heightmapResolution, terrain.terrainData.heightmapResolution];
			for (int i = 0; i < terrain.terrainData.heightmapResolution; i++)
			{
				for (int j = 0; j < terrain.terrainData.heightmapResolution; j++)
				{
					float num5 = Vector2.Distance(new Vector2(i, j), b);
					float num6 = 0f;
					if (num5 < num2)
					{
						num6 = 1f;
					}
					else if (num5 >= num2 && num5 < num)
					{
						num6 = (num5 - num2) / (num - num2);
						num6 = 1f - num6;
					}
					array[i, j] = num3 + perlinHelper[i, j] * (num4 - num3);
					array[i, j] *= num6;
				}
			}
			for (int k = 0; k < numSmoothings; k++)
			{
				SmoothHeights(array);
			}
			terrain.terrainData.SetHeights(0, 0, array);
		}

		private void SmoothHeights(float[,] heights)
		{
			for (int i = 0; i < heights.GetLength(0); i++)
			{
				for (int j = 0; j < heights.GetLength(1); j++)
				{
					heights[i, j] = GetHeightAverage(heights, i, j);
				}
			}
		}

		private float GetHeightAverage(float[,] heights, int x, int y)
		{
			float num = 0f;
			float num2 = 0f;
			for (int i = x - 1; i <= x + 1; i++)
			{
				for (int j = y - 1; j <= y + 1; j++)
				{
					if (i >= 0 && i < heights.GetLength(0) && j >= 0 && j < heights.GetLength(1))
					{
						num += 1f;
						num2 += heights[i, j];
					}
				}
			}
			return num2 / num;
		}
	}
}
