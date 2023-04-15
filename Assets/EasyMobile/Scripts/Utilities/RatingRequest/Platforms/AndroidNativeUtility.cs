using System.Collections;
using System.Collections.Generic;
using UnityEngine;

#if UNITY_ANDROID
namespace EasyMobile
{
    internal static class AndroidNativeUtility
    {
        private static readonly string ANDROID_JAVA_UTILITY_CLASS = "com.sglib.easymobile.androidnative.EMUtility";

        internal static void RequestRating(RatingDialogContent content, RatingRequestSettings settings)
        {
            AndroidUtil.CallJavaStaticMethod(ANDROID_JAVA_UTILITY_CLASS, "RequestReview",
                content.Title,
                content.Message,
                content.LowRatingMessage,
                content.HighRatingMessage,
                content.PostponeButtonText,
                content.RefuseButtonText,
                content.CancelButtonText,
                content.FeedbackButtonText,
                content.RateButtonText,
                settings.MinimumAcceptedStars.ToString()
            );
        }
    }
}
#endif