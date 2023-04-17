using System.Collections.Generic;
using FunGames.Sdk.RemoteConfig;
using UnityEngine;

public class ExampleRemoteConfigABtests : MonoBehaviour
{
    private void Start()
    {
        // Define the variables you want to remotely configure
        
        var values = new Dictionary<string, object>
        {
            {"param0", "client"},
            {"param1", 111},
            {"param2", 222},
            {"param3", "client3"},
            {"ball_speed", 10}
        };

        // Set those variables as default in the SDK
        
        FunGamesRemoteConfig.SetDefaultValues(values);

        // Fetch the values of your variables that are defined on our API
        
        FunGamesRemoteConfig.FetchValues(FetchComplete);
    }

    // Callback for FetchValues

    private static void FetchComplete()
    {
        // Get a dictionary of all the variables known by the SDK, with their correct value
        
        var values = FunGamesRemoteConfig.GetValuesDictionary();

        foreach (var variable in values)
        {
            Debug.Log(variable.Key + " : " + variable.Value);
        }

        // Get a variable by its key, with its correct value

        var param0 = FunGamesRemoteConfig.GetValueByKey("param0");
        
        Debug.Log("param0 :: " + param0);
    }
}