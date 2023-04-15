using UnityEngine;

public class Water2D : MonoBehaviour
{
	private struct WaterColumn
	{
		public float TargetHeight;

		public float Height;

		public float Speed;

		public float lastHeight;

		public bool splashNow;

		public Water2D water;

		public int index;

		public bool enableSplash;

		private bool hasToSplash;

		public void Update(float dampening, float tension)
		{
			float num = TargetHeight - Height;
			Speed += tension * num - Speed * dampening;
			Height += Speed;
			if (Height > TargetHeight + water.heightLimitToSplashParticles)
			{
				hasToSplash = true;
			}
			else
			{
				hasToSplash = false;
			}
			if (enableSplash && hasToSplash && Height < lastHeight)
			{
				water.SplashParticles(index);
				enableSplash = false;
			}
			lastHeight = Height;
		}
	}

	public float width = 100f;

	public float height = 100f;

	public int waterSubdivisions = 1;

	public float Tension = 0.025f;

	public float Dampening = 0.025f;

	public float Spread = 0.25f;

	public float objectSizeDampening = 1f;

	public int neighbours = 8;

	public Material waterMaterial;

	public Vector2 uvAnimationSpeed = new Vector2(1f, 0f);

	public GameObject waterSplash;

	public GameObject afterPeakwaterSplash;

	public float heightLimitToSplashParticles = 10f;

	public AudioClip[] splashSounds;

	public float idleFactor;

	public float idleWavesSpeed;

	public Color deepColor = new Color(0.2f, 0.2f, 0.2f, 1f);

	public Color surfaceColor = new Color(1f, 1f, 1f, 1f);

	public float surfaceLineWidth = 1f;

	public Material surfaceLineMaterial;

	public Color surfaceLineColor = new Color(0f, 0f, 0.8f, 0.5f);

	public bool createCollider = true;

	public float colliderZsize = 100f;

	public float maxWaterForceApplied = 50f;

	private WaterColumn[] columns;

	private Mesh proceduralMesh;

	private Vector3[] meshVertices;

	private Mesh myMesh;

	private int firstUpVertex;

	private ParticleSystem instantiatedWaterSplash;

	private ParticleSystem instantiatedAfterPeakwaterSplash;

	private Transform myTransform;

	private BoxCollider myCollider;

	private LineRenderer surfaceLineRenderer;

	private float idleWaveCounter;

	private int lastIdleWaveColumn = -1;

	private Material myMaterial;

	private void Awake()
	{
		if (GetComponent<MeshFilter>() == null)
		{
			CreateWaterPlane();
		}
		InitializeWater();
		myTransform = base.transform;
	}

	public void CreateWaterPlane()
	{
		int num = waterSubdivisions;
		int num2 = 1;
		MeshFilter component = GetComponent<MeshFilter>();
		if (Application.isEditor)
		{
			DestroyWater();
		}
		if (component != null)
		{
			UnityEngine.Object.DestroyImmediate(component);
		}
		if (GetComponent<Renderer>() != null)
		{
			UnityEngine.Object.DestroyImmediate(GetComponent<Renderer>());
		}
		proceduralMesh = new Mesh();
		proceduralMesh.name = "Water plane";
		int num3 = num + 1;
		int num4 = num2 + 1;
		int num5 = num * num2 * 6;
		int num6 = num3 * num4;
		Vector3[] array = new Vector3[num6];
		Vector2[] array2 = new Vector2[num6];
		int[] array3 = new int[num5];
		int num7 = 0;
		float num8 = 1f / (float)num;
		float num9 = 1f / (float)num2;
		float num10 = width / (float)num;
		float num11 = height / (float)num2;
		for (float num12 = 0f; num12 < (float)num4; num12 += 1f)
		{
			for (float num13 = 0f; num13 < (float)num3; num13 += 1f)
			{
				array[num7] = new Vector3(num13 * num10 - width / 2f, num12 * num11 - height / 2f, 0f);
				array2[num7++] = new Vector2(num13 * num8, num12 * num9);
			}
		}
		num7 = 0;
		for (int i = 0; i < num2; i++)
		{
			for (int j = 0; j < num; j++)
			{
				array3[num7] = i * num3 + j;
				array3[num7 + 1] = (i + 1) * num3 + j;
				array3[num7 + 2] = i * num3 + j + 1;
				array3[num7 + 3] = (i + 1) * num3 + j;
				array3[num7 + 4] = (i + 1) * num3 + j + 1;
				array3[num7 + 5] = i * num3 + j + 1;
				num7 += 6;
			}
		}
		Color[] array4 = new Color[array.Length];
		for (int k = 0; k < (int)((float)array.Length * 0.5f); k++)
		{
			array4[k] = deepColor;
		}
		for (int l = (int)((float)array.Length * 0.5f); l < array.Length; l++)
		{
			array4[l] = surfaceColor;
		}
		proceduralMesh.vertices = array;
		proceduralMesh.triangles = array3;
		proceduralMesh.uv = array2;
		proceduralMesh.colors = array4;
		base.gameObject.AddComponent<MeshFilter>().mesh = proceduralMesh;
		base.gameObject.AddComponent<MeshRenderer>();
		if (surfaceLineWidth > 0f)
		{
			surfaceLineRenderer = base.gameObject.AddComponent<LineRenderer>();
			surfaceLineRenderer.SetWidth(surfaceLineWidth, surfaceLineWidth);
			surfaceLineRenderer.SetColors(surfaceLineColor, surfaceLineColor);
			surfaceLineRenderer.SetVertexCount(waterSubdivisions + 1);
			surfaceLineRenderer.sharedMaterial = surfaceLineMaterial;
			UpdateSurfaceLinePosition();
		}
		GetComponent<Renderer>().sharedMaterial = waterMaterial;
	}

	public void DestroyWater()
	{
		UnityEngine.Object.DestroyImmediate(GetComponent<Renderer>());
		UnityEngine.Object.DestroyImmediate(GetComponent<Collider>());
		UnityEngine.Object.DestroyImmediate(GetComponent<MeshFilter>());
		UnityEngine.Object.DestroyImmediate(GetComponent<LineRenderer>());
	}

	private void InitializeWater()
	{
		myMesh = GetComponent<MeshFilter>().mesh;
		myMesh.MarkDynamic();
		myMaterial = GetComponent<Renderer>().material;
		surfaceLineRenderer = GetComponent<LineRenderer>();
		meshVertices = myMesh.vertices;
		firstUpVertex = (int)((float)meshVertices.Length * 0.5f);
		columns = new WaterColumn[waterSubdivisions + 1];
		float y = meshVertices[meshVertices.Length - 1].y;
		for (int i = 0; i < columns.Length; i++)
		{
			columns[i].Height = y;
			columns[i].TargetHeight = y;
			columns[i].Speed = 0f;
			columns[i].lastHeight = y;
			columns[i].water = this;
			columns[i].index = i;
		}
		GameObject gameObject = UnityEngine.Object.Instantiate(waterSplash);
		instantiatedWaterSplash = gameObject.GetComponent<ParticleSystem>();
		gameObject = UnityEngine.Object.Instantiate(afterPeakwaterSplash);
		instantiatedAfterPeakwaterSplash = gameObject.GetComponent<ParticleSystem>();
	}

	private void Update()
	{
		for (int i = 0; i < columns.Length; i++)
		{
			columns[i].Update(Dampening, Tension);
		}
		float[] array = new float[columns.Length];
		float[] array2 = new float[columns.Length];
		for (int j = 0; j < neighbours; j++)
		{
			for (int k = 0; k < columns.Length; k++)
			{
				if (k > 0)
				{
					array[k] = Spread * (columns[k].Height - columns[k - 1].Height);
					columns[k - 1].Speed += array[k];
				}
				if (k < columns.Length - 1)
				{
					array2[k] = Spread * (columns[k].Height - columns[k + 1].Height);
					columns[k + 1].Speed += array2[k];
				}
			}
			for (int l = 0; l < columns.Length; l++)
			{
				if (l > 0)
				{
					columns[l - 1].Height += array[l];
				}
				if (l < columns.Length - 1)
				{
					columns[l + 1].Height += array2[l];
				}
			}
		}
		int num = 0;
		for (int m = firstUpVertex; m < meshVertices.Length; m++)
		{
			meshVertices[m].y = columns[num].Height;
			num++;
		}
		myMesh.vertices = meshVertices;
		if (idleFactor > 0f)
		{
			idleWaveCounter = Mathf.MoveTowards(idleWaveCounter, columns.Length - 1, Time.deltaTime * idleWavesSpeed);
			if ((int)idleWaveCounter != lastIdleWaveColumn)
			{
				MoveSpring((int)idleWaveCounter, idleFactor);
				lastIdleWaveColumn = (int)idleWaveCounter;
			}
			if (idleWaveCounter == (float)(columns.Length - 1))
			{
				idleWaveCounter = 0f;
			}
		}
		if (surfaceLineWidth > 0f)
		{
			UpdateSurfaceLinePosition();
		}
		if (uvAnimationSpeed.sqrMagnitude != 0f)
		{
			myMaterial.mainTextureOffset = uvAnimationSpeed * Time.timeSinceLevelLoad;
		}
	}

	public void ObjectEnteredWater(Vector3 _position, float _speed, float _size, bool _emitParticles)
	{
		float num = float.MaxValue;
		int num2 = 0;
		int num3 = 0;
		for (int i = firstUpVertex; i < meshVertices.Length; i++)
		{
			float sqrMagnitude = (myTransform.TransformPoint(meshVertices[i]) - _position).sqrMagnitude;
			if (sqrMagnitude < num)
			{
				num = sqrMagnitude;
				num2 = i;
				num3 = i - firstUpVertex;
			}
		}
		columns[num3].Speed += _speed;
		columns[num3].enableSplash = true;
		float num4 = width / (float)waterSubdivisions;
		int num5 = Mathf.Clamp(Mathf.FloorToInt(_size / num4), 0, columns.Length - 1);
		for (int j = 1; j < num5; j++)
		{
			if (num3 + j < columns.Length)
			{
				columns[num3 + j].Speed = _speed / (objectSizeDampening * (float)(j + 1));
			}
			if (num3 - j >= 0)
			{
				columns[num3 - j].Speed = _speed / (objectSizeDampening * (float)(j + 1));
			}
		}
		if (_emitParticles)
		{
			instantiatedWaterSplash.transform.position = myTransform.TransformPoint(meshVertices[num2]);
			instantiatedWaterSplash.Emit(UnityEngine.Random.Range(10, 20));
		}
		GetComponent<AudioSource>().PlayOneShot(splashSounds[Random.Range(0, splashSounds.Length)]);
	}

	public void ObjectEnteredWater(Vector3 _position, float _speed, Bounds _size, bool _emitParticles)
	{
		ObjectEnteredWater(_position, _speed, _size.extents.x, _emitParticles);
	}

	public void SetHeight(float _newHeight)
	{
		for (int i = 0; i < columns.Length; i++)
		{
			columns[i].TargetHeight = _newHeight;
		}
		Vector3 size = myCollider.size;
		size.x = width;
		size.y = height * 0.5f + _newHeight;
		myCollider.size = size;
		myCollider.center = new Vector3(0f, (0f - height) * 0.25f + _newHeight * 0.5f, 0f);
	}

	private void MoveSpring(int _springIndex, float _speed)
	{
		columns[_springIndex].Speed += _speed;
	}

	private void SplashParticles(int _column)
	{
		instantiatedAfterPeakwaterSplash.transform.position = myTransform.TransformPoint(meshVertices[_column + firstUpVertex]);
		instantiatedAfterPeakwaterSplash.Emit(UnityEngine.Random.Range(5, 9));
	}

	private void UpdateSurfaceLinePosition()
	{
		if (meshVertices == null)
		{
			meshVertices = GetComponent<MeshFilter>().sharedMesh.vertices;
			firstUpVertex = (int)((float)meshVertices.Length * 0.5f);
		}
		for (int i = 0; i < meshVertices.Length - firstUpVertex; i++)
		{
			if (myTransform == null)
			{
				myTransform = base.transform;
			}
			surfaceLineRenderer.SetPosition(i, myTransform.TransformPoint(meshVertices[i + firstUpVertex]));
		}
	}

	private void OnTriggerEnter(Collider _collider)
	{
		Vector3 position = _collider.ClosestPointOnBounds(_collider.transform.position);
		Vector3 velocity = _collider.GetComponent<Rigidbody>().velocity;
		ObjectEnteredWater(position, Mathf.Clamp(velocity.y, 0f - maxWaterForceApplied, maxWaterForceApplied), _collider.bounds, _emitParticles: true);
	}

	private void OnTriggerExit(Collider _collider)
	{
		Vector3 position = _collider.ClosestPointOnBounds(_collider.transform.position);
		Vector3 velocity = _collider.GetComponent<Rigidbody>().velocity;
		ObjectEnteredWater(position, Mathf.Clamp(velocity.y, 0f - maxWaterForceApplied, maxWaterForceApplied), _collider.bounds, _emitParticles: true);
	}

	private void OnDrawGizmosSelected()
	{
		Gizmos.color = Color.blue;
		Gizmos.DrawWireCube(base.transform.position, new Vector3(width, height, 0f));
		Gizmos.color = Color.red;
		Vector3 start = new Vector3(base.transform.position.x - width * 0.5f, base.transform.position.y + height * 0.5f + heightLimitToSplashParticles, base.transform.position.z);
		Vector3 end = new Vector3(base.transform.position.x + width * 0.5f, base.transform.position.y + height * 0.5f + heightLimitToSplashParticles, base.transform.position.z);
		UnityEngine.Debug.DrawLine(start, end, Color.red);
		MeshFilter component = GetComponent<MeshFilter>();
		if (component != null)
		{
			Mesh sharedMesh = component.sharedMesh;
			for (int i = (int)((float)sharedMesh.vertices.Length * 0.5f); i < sharedMesh.vertices.Length; i++)
			{
				Gizmos.DrawCube(base.transform.TransformPoint(sharedMesh.vertices[i]), new Vector3(1f, 1f, 0f) * surfaceLineWidth);
			}
		}
	}
}
