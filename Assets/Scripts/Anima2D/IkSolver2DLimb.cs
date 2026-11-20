using System;
using UnityEngine;

namespace Anima2D
{
	[Serializable]
	public class IkSolver2DLimb : IkSolver2D
	{
		public bool flip;

		protected override void DoSolverUpdate()
		{
			if ((bool)base.rootBone && base.solverPoses.Count == 2)
			{
				SolverPose solverPose = base.solverPoses[0];
				SolverPose solverPose2 = base.solverPoses[1];
				Vector3 vector = targetPosition - base.rootBone.transform.position;
				vector.z = 0f;
				float magnitude = vector.magnitude;
				float num = 0f;
				float value2 = 0f;
				float sqrMagnitude = vector.sqrMagnitude;
				float value3 = solverPose.bone.length * solverPose.bone.length;
				float value4 = solverPose2.bone.length * solverPose2.bone.length;
				float value5 = (sqrMagnitude + value3 - value4) / (2f * solverPose.bone.length * magnitude);
				float value6 = (sqrMagnitude - value3 - value4) / (2f * solverPose.bone.length * solverPose2.bone.length);
				if (value5 >= -1f && value5 <= 1f && value6 >= -1f && value6 <= 1f)
				{
					num = Mathf.Acos(value5) * 57.29578f;
					value2 = Mathf.Acos(value6) * 57.29578f;
				}
				float value7 = flip ? (-1f) : 1f;
				Vector3 vector2 = Vector3.ProjectOnPlane(targetPosition - base.rootBone.transform.position, base.rootBone.transform.forward);
				if ((bool)base.rootBone.transform.parent)
				{
					vector2 = base.rootBone.transform.parent.InverseTransformDirection(vector2);
				}
				float value8 = Mathf.Atan2(vector2.y, vector2.x) * 57.29578f;
				solverPose.solverRotation = Quaternion.Euler(0f, 0f, value8 - value7 * num);
				solverPose2.solverRotation = Quaternion.Euler(0f, 0f, value7 * value2);
			}
		}
	}
}
