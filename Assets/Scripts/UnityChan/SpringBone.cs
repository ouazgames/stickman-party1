using Anima2D;
using UnityEngine;

namespace UnityChan
{
	[RequireComponent(typeof(Bone2D))]
	public class SpringBone : MonoBehaviour
	{
		public float radius = 0.05f;

		public bool isUseEachBoneForceSettings;

		public float stiffnessForce = 0.01f;

		public float dragForce = 0.4f;

		public Vector3 springForce = new Vector3(0f, -0.0001f, 0f);

		public SpringCollider[] colliders;

		public float threshold = 0.01f;

		public bool isAnimated;

		private float springLength;

		private Quaternion localRotation;

		private Transform trs;

		private Vector3 currTipPos;

		private Vector3 prevTipPos;

		private Transform org;

		private SpringManager managerRef;

		private Bone2D m_Bone;

		private void Awake()
		{
			m_Bone = GetComponent<Bone2D>();
			trs = base.transform;
			localRotation = base.transform.localRotation;
			managerRef = GetParentSpringManager(base.transform);
		}

		private SpringManager GetParentSpringManager(Transform t)
		{
			SpringManager component = t.GetComponent<SpringManager>();
			if (component != null)
			{
				return component;
			}
			if (t.parent != null)
			{
				return GetParentSpringManager(t.parent);
			}
			return null;
		}

		private void Start()
		{
			springLength = Vector3.Distance(trs.position, m_Bone.endPosition);
			currTipPos = m_Bone.endPosition;
			prevTipPos = m_Bone.endPosition;
		}

		public void UpdateSpring()
		{
			org = trs;
			if (!isAnimated)
			{
				trs.localRotation = Quaternion.identity * localRotation;
			}
			float d = Time.deltaTime * Time.deltaTime;
			Vector3 a = trs.rotation * (Vector3.right * stiffnessForce) / d;
			a += (prevTipPos - currTipPos) * dragForce / d;
			a += springForce / d;
			Vector3 vector = currTipPos;
			currTipPos = currTipPos - prevTipPos + currTipPos + a * d;
			currTipPos = (currTipPos - trs.position).normalized * springLength + trs.position;
			for (int i = 0; i < colliders.Length; i++)
			{
				if (Vector3.Distance(currTipPos, colliders[i].transform.position) <= radius + colliders[i].radius)
				{
					Vector3 normalized = (currTipPos - colliders[i].transform.position).normalized;
					currTipPos = colliders[i].transform.position + normalized * (radius + colliders[i].radius);
					currTipPos = (currTipPos - trs.position).normalized * springLength + trs.position;
				}
			}
			prevTipPos = vector;
			Quaternion b = Quaternion.FromToRotation(trs.TransformDirection(Vector3.right), currTipPos - trs.position) * trs.rotation;
			trs.rotation = Quaternion.Lerp(org.rotation, b, managerRef.dynamicRatio);
		}
	}
}
