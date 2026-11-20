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
			float value2 = num - circleCutoff;
			Vector2 b = new Vector2(num, num);
			float value3 = minHeight / terrain.terrainData.heightmapScale.y;
			float value4 = maxHeight / terrain.terrainData.heightmapScale.y;
			PerlinHelper perlinHelper = new PerlinHelper(terrain.terrainData.heightmapResolution, terrain.terrainData.heightmapResolution, perlinScale);
			float[,] array = new float[terrain.terrainData.heightmapResolution, terrain.terrainData.heightmapResolution];
			for (int i = 0; i < terrain.terrainData.heightmapResolution; i++)
			{
				for (int j = 0; j < terrain.terrainData.heightmapResolution; j++)
				{
					float value5 = Vector2.Distance(new Vector2(i, j), b);
					float value6 = 0f;
					if (value5 < value2)
					{
						value6 = 1f;
					}
					else if (value5 >= value2 && value5 < num)
					{
						value6 = (value5 - value2) / (num - value2);
						value6 = 1f - value6;
					}
					array[i, j] = value3 + perlinHelper[i, j] * (value4 - value3);
					array[i, j] *= value6;
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
			float value2 = 0f;
			for (int i = x - 1; i <= x + 1; i++)
			{
				for (int j = y - 1; j <= y + 1; j++)
				{
					if (i >= 0 && i < heights.GetLength(0) && j >= 0 && j < heights.GetLength(1))
					{
						num += 1f;
						value2 += heights[i, j];
					}
				}
			}
			return value2 / num;
		}
	}
}
