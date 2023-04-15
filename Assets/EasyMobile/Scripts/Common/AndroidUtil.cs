using System.Collections;
using System.Collections.Generic;
using UnityEngine;

#if UNITY_ANDROID
namespace EasyMobile
{
    internal static class AndroidUtil
    {
        internal static void CallJavaStaticMethod(string className, string method, params object[] args)
        {
            AndroidJavaObject activity;
            using (AndroidJavaClass unityCls = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
            { 
                activity = unityCls.GetStatic<AndroidJavaObject>("currentActivity");
            }

            // This calling scheme makes sure it works on Unity version as old as 5.3.5.
            AndroidJavaClass targetClass = new AndroidJavaClass(className);
            activity.Call("runOnUiThread", new AndroidJavaRunnable(() =>
                    {
                        targetClass.CallStatic(method, args);
                        targetClass.Dispose();
                    }));
        }
    }
}
#endif
