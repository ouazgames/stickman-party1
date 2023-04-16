using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using GameAnalyticsSDK;
// using Facebook.Unity;
/* using FunGames.Sdk.Analytics; */

public class GameAnalytic : MonoBehaviour
{

    public static GameAnalytic Instance;


    [Header("Games Events Names")]

    [SerializeField] private string startTheGameEvent = "startTheGame";
    [SerializeField] private string CompletedEvent = "Completed";
    [SerializeField] private string FaildEvent = "Faild";
    [SerializeField] private string PlayeLevelEvent = "finishedLevel";
    [Header("Sync Settings")]
    [SerializeField] private float Check_UnSended_Events_rateTime = 0.5f;


    static List<LevelProgression> v_LevelsProgressions = new List<LevelProgression>();

    float time;

    private void Awake()
    {
        GameAnalytics.Initialize();
        GameAnalytics.SetCustomId("");
        // FB.Init(() =>
        // {
        //     FB.ActivateApp();
        // });
        Instance = this;
    }

    private void Update()
    {
        time += Time.unscaledDeltaTime;
        if (time > Check_UnSended_Events_rateTime)
        {
            FireAllEvents();
            time = 0;
        }
    }


    private void Start()
    {

        //FunGamesAnalytics.NewProgressionEvent("Start",startTheGameEvent);
        // FB.LogAppEvent(startTheGameEvent);
    }

    public void FireAllEvents()
    {
        foreach (var lp in v_LevelsProgressions)
        {

            //GameAnalytics.NewProgressionEvent(lp.state,lp.v_LevelName,lp.v_Diffeculty,lp.v_LevelTime,lp.v_ClearedArea);
            switch (lp.state)
            {
                case ProgressionStatus.StartLevel:
                    /* FunGamesAnalytics.NewProgressionEvent("Start",lp.v_LevelName); */
                    GameAnalytics.NewProgressionEvent(GAProgressionStatus.Start, lp.v_LevelName);
                    // FB.LogAppEvent(CompletedEvent, null, lp.getDictionaty());
                    break;
                case ProgressionStatus.Completed:
                    /* FunGamesAnalytics.NewProgressionEvent("Complete",lp.v_LevelName); */
                    GameAnalytics.NewProgressionEvent(GAProgressionStatus.Complete, lp.v_LevelName);
                    // FB.LogAppEvent(CompletedEvent, null, lp.getDictionaty());
                    break;
                case ProgressionStatus.Fail:
                    /*  FunGamesAnalytics.NewProgressionEvent("Fail",lp.v_LevelName); */
                    GameAnalytics.NewProgressionEvent(GAProgressionStatus.Fail, lp.v_LevelName);
                    // FB.LogAppEvent(FaildEvent, null, lp.getDictionaty());
                    break;
            }

        }
        v_LevelsProgressions.Clear();
    }

    public static void AddProgression(LevelProgression l)
    {
        v_LevelsProgressions.Add(l);
    }


}

public enum ProgressionStatus
{
    StartLevel, Completed, Fail
}

public class LevelProgression
{
    public ProgressionStatus state;
    public string v_LevelName;
    //public int v_ClearedArea;
    //public string v_Diffeculty;
    //public string v_LevelTime;

    public Dictionary<string, object> getDictionaty()
    {
        var levelProgressionDictionary = new Dictionary<string, object>();
        levelProgressionDictionary.Add("LevelName", v_LevelName);
        //  levelProgressionDictionary.Add("ClearedArea",v_ClearedArea);
        //  levelProgressionDictionary.Add("Diffeculty",v_Diffeculty);
        //  levelProgressionDictionary.Add("LevelTime",v_LevelTime);
        return levelProgressionDictionary;
    }
}
