using System;
using UnityEngine;

namespace UnityMovementAI
{
	[Serializable]
	public class LinePath
	{
		public Vector3[] nodes;

		[NonSerialized]
		public float maxDist;

		[NonSerialized]
		public float[] distances;

		public Vector3 this[int i]
		{
			get
			{
				return nodes[i];
			}
			set
			{
				nodes[i] = value;
			}
		}

		public int Length => nodes.Length;

		public Vector3 EndNode => nodes[nodes.Length - 1];

		public LinePath(Vector3[] nodes)
		{
			this.nodes = nodes;
			CalcDistances();
		}

		public void CalcDistances()
		{
			distances = new float[nodes.Length];
			distances[0] = 0f;
			for (int i = 0; i < nodes.Length - 1; i++)
			{
				distances[i + 1] = distances[i] + Vector3.Distance(nodes[i], nodes[i + 1]);
			}
			maxDist = distances[distances.Length - 1];
		}

		public void Draw()
		{
			for (int i = 0; i < nodes.Length - 1; i++)
			{
				UnityEngine.Debug.DrawLine(nodes[i], nodes[i + 1], Color.cyan, 0f, depthTest: false);
			}
		}

		public float GetParam(Vector3 position, MovementAIRigidbody rb)
		{
			int closestSegment = GetClosestSegment(position);
			return distances[closestSegment] + GetParamForSegment(position, nodes[closestSegment], nodes[closestSegment + 1], rb);
		}

		public int GetClosestSegment(Vector3 position)
		{
			float num = DistToSegment(position, nodes[0], nodes[1]);
			int result = 0;
			for (int i = 1; i < nodes.Length - 1; i++)
			{
				float num2 = DistToSegment(position, nodes[i], nodes[i + 1]);
				if (num2 <= num)
				{
					num = num2;
					result = i;
				}
			}
			return result;
		}

		public Vector3 GetPosition(float param, bool pathLoop = false)
		{
			if (param < 0f)
			{
				param = (pathLoop ? (param + maxDist) : 0f);
			}
			else if (param > maxDist)
			{
				param = (pathLoop ? (param - maxDist) : maxDist);
			}
			int i;
			for (i = 0; i < distances.Length && !(distances[i] > param); i++)
			{
			}
			i = ((i <= distances.Length - 2) ? (i - 1) : (distances.Length - 2));
			float t = (param - distances[i]) / Vector3.Distance(nodes[i], nodes[i + 1]);
			return Vector3.Lerp(nodes[i], nodes[i + 1], t);
		}

		private float DistToSegment(Vector3 p, Vector3 v, Vector3 w)
		{
			Vector3 vector = w - v;
			float num = Vector3.Dot(vector, vector);
			if (num == 0f)
			{
				return Vector3.Distance(p, v);
			}
			float num2 = Vector3.Dot(p - v, vector) / num;
			if (num2 < 0f)
			{
				return Vector3.Distance(p, v);
			}
			if (num2 > 1f)
			{
				return Vector3.Distance(p, w);
			}
			Vector3 b = Vector3.Lerp(v, w, num2);
			return Vector3.Distance(p, b);
		}

		private float GetParamForSegment(Vector3 p, Vector3 v, Vector3 w, MovementAIRigidbody rb)
		{
			Vector3 v2 = w - v;
			v2 = rb.ConvertVector(v2);
			float num = Vector3.Dot(v2, v2);
			if (num == 0f)
			{
				return 0f;
			}
			float num2 = Vector3.Dot(p - v, v2) / num;
			if (num2 < 0f)
			{
				num2 = 0f;
			}
			else if (num2 > 1f)
			{
				num2 = 1f;
			}
			return num2 * (v - w).magnitude;
		}

		public void RemoveNode(int i)
		{
			Vector3[] array = new Vector3[nodes.Length - 1];
			int num = 0;
			for (int j = 0; j < array.Length; j++)
			{
				if (j != i)
				{
					array[num] = nodes[j];
					num++;
				}
			}
			nodes = array;
			CalcDistances();
		}

		public void ReversePath()
		{
			Array.Reverse((Array)nodes);
			CalcDistances();
		}
	}
}
