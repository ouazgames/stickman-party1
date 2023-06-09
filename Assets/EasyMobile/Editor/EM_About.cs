﻿using UnityEngine;
using UnityEditor;
using SgLib.Editor;
using System.Collections;

namespace EasyMobile.Editor
{
    public class EM_About : EditorWindow
    {
        const string MAIN_IMAGE_PATH = EM_Constants.SkinTextureFolder + "/about-image.psd";
        const int WINDOW_WIDTH = 400;
        const int WINDOW_HEIGHT = 200;
        const int IMAGE_WIDTH = 400;
        const int IMAGE_HEIGHT = 160;

        Texture2D mainImage;

        void OnEnable()
        {
            // Set the window title
            #if UNITY_PRE_5_1
            title = "About";
            #else
            titleContent = new GUIContent("About");            
            #endif

            // Load the main image
            mainImage = AssetDatabase.LoadAssetAtPath(MAIN_IMAGE_PATH, typeof(Texture2D)) as Texture2D;

            // Set sizes
            Vector2 fixedSizes = new Vector2(WINDOW_WIDTH, WINDOW_HEIGHT);
            maxSize = fixedSizes;
            minSize = fixedSizes;
        }

        void OnGUI()
        {
            GUILayout.BeginVertical();
            if (mainImage != null)
                GUI.DrawTexture(new Rect(0f, 0f, IMAGE_WIDTH, IMAGE_HEIGHT), mainImage, ScaleMode.ScaleAndCrop);

            GUILayout.FlexibleSpace();
            GUILayout.Label("Version " + EM_Constants.versionString);
            GUILayout.Label(EM_Constants.Copyright);

            GUILayout.EndVertical();
        }
    }
}
