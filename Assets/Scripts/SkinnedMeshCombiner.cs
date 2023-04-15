using Anima2D;
using System.Collections.Generic;
using UnityEngine;

public class SkinnedMeshCombiner : MonoBehaviour
{
	[SerializeField]
	private SpriteMeshInstance[] m_SpriteMeshInstances;

	private MaterialPropertyBlock m_MaterialPropertyBlock;

	private SkinnedMeshRenderer m_CachedSkinnedRenderer;

	public SpriteMeshInstance[] spriteMeshInstances
	{
		get
		{
			return m_SpriteMeshInstances;
		}
		set
		{
			m_SpriteMeshInstances = value;
		}
	}

	private MaterialPropertyBlock materialPropertyBlock
	{
		get
		{
			if (m_MaterialPropertyBlock == null)
			{
				m_MaterialPropertyBlock = new MaterialPropertyBlock();
			}
			return m_MaterialPropertyBlock;
		}
	}

	public SkinnedMeshRenderer cachedSkinnedRenderer
	{
		get
		{
			if (!m_CachedSkinnedRenderer)
			{
				m_CachedSkinnedRenderer = GetComponent<SkinnedMeshRenderer>();
			}
			return m_CachedSkinnedRenderer;
		}
	}

	private void Start()
	{
		Vector3 position = base.transform.position;
		Quaternion rotation = base.transform.rotation;
		Vector3 localScale = base.transform.localScale;
		base.transform.position = Vector3.zero;
		base.transform.rotation = Quaternion.identity;
		base.transform.localScale = Vector3.one;
		List<Transform> list = new List<Transform>();
		List<BoneWeight> list2 = new List<BoneWeight>();
		List<CombineInstance> list3 = new List<CombineInstance>();
		int num = 0;
		for (int i = 0; i < spriteMeshInstances.Length; i++)
		{
			SpriteMeshInstance spriteMeshInstance = spriteMeshInstances[i];
			if ((bool)spriteMeshInstance.cachedSkinnedRenderer)
			{
				num += spriteMeshInstance.mesh.subMeshCount;
			}
		}
		int[] array = new int[num];
		int num2 = 0;
		for (int j = 0; j < m_SpriteMeshInstances.Length; j++)
		{
			SpriteMeshInstance spriteMeshInstance2 = spriteMeshInstances[j];
			if ((bool)spriteMeshInstance2.cachedSkinnedRenderer)
			{
				SkinnedMeshRenderer cachedSkinnedRenderer = spriteMeshInstance2.cachedSkinnedRenderer;
				BoneWeight[] boneWeights = spriteMeshInstance2.sharedMesh.boneWeights;
				for (int k = 0; k < boneWeights.Length; k++)
				{
					BoneWeight item = boneWeights[k];
					item.boneIndex0 += num2;
					item.boneIndex1 += num2;
					item.boneIndex2 += num2;
					item.boneIndex3 += num2;
					list2.Add(item);
				}
				num2 += spriteMeshInstance2.bones.Count;
				Transform[] bones = cachedSkinnedRenderer.bones;
				foreach (Transform item2 in bones)
				{
					list.Add(item2);
				}
				CombineInstance item3 = default(CombineInstance);
				Mesh mesh = new Mesh();
				cachedSkinnedRenderer.BakeMesh(mesh);
				mesh.uv = spriteMeshInstance2.spriteMesh.sprite.uv;
				item3.mesh = mesh;
				array[j] = item3.mesh.vertexCount;
				item3.transform = cachedSkinnedRenderer.localToWorldMatrix;
				list3.Add(item3);
				cachedSkinnedRenderer.gameObject.SetActive(value: false);
			}
		}
		List<Matrix4x4> list4 = new List<Matrix4x4>();
		for (int m = 0; m < list.Count; m++)
		{
			list4.Add(list[m].worldToLocalMatrix * base.transform.worldToLocalMatrix);
		}
		SkinnedMeshRenderer skinnedMeshRenderer = base.gameObject.AddComponent<SkinnedMeshRenderer>();
		Mesh mesh2 = new Mesh();
		mesh2.CombineMeshes(list3.ToArray(), mergeSubMeshes: true, useMatrices: true);
		skinnedMeshRenderer.sharedMesh = mesh2;
		skinnedMeshRenderer.bones = list.ToArray();
		skinnedMeshRenderer.sharedMesh.boneWeights = list2.ToArray();
		skinnedMeshRenderer.sharedMesh.bindposes = list4.ToArray();
		skinnedMeshRenderer.sharedMesh.RecalculateBounds();
		skinnedMeshRenderer.materials = spriteMeshInstances[0].sharedMaterials;
		base.transform.position = position;
		base.transform.rotation = rotation;
		base.transform.localScale = localScale;
	}

	private void OnWillRenderObject()
	{
		if ((bool)cachedSkinnedRenderer && materialPropertyBlock != null)
		{
			materialPropertyBlock.SetTexture("_MainTex", spriteMeshInstances[0].spriteMesh.sprite.texture);
			cachedSkinnedRenderer.SetPropertyBlock(materialPropertyBlock);
		}
	}
}
