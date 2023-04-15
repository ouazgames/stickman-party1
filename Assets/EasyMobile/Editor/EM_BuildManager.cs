#if UNITY_5_6_OR_NEWER && (UNITY_ANDROID || UNITY_IOS)
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEditor.Build;

namespace EasyMobile.Editor
{
    public class EM_BuildManager : IPreprocessBuild
    {
        public int callbackOrder { get { return 0; } }

        public void OnPreprocessBuild(BuildTarget target, string path)
        {
            // Search through all enabled scenes in the BuildSettings to find the EasyMobile prefab instance.
            // Warn the user if none was found.
            GameObject prefab = EM_EditorUtil.GetMainPrefab();

            if (prefab != null)
            {
                string[] enabledScenePaths = EM_EditorUtil.GetScenePathInBuildSettings(true);
                if (!EM_EditorUtil.IsPrefabInstanceFoundInScenes(prefab, enabledScenePaths))
                {
                    EM_EditorUtil.Alert("EasyMobile Instance Missing", "No root-level instance of the EasyMobile prefab was found in the enabled scene(s). " +
                        "Please add one to the first scene of your game for the plugin to function properly.");
                }
            }
        }
    }
}
#endif