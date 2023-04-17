using System.Collections.Generic;
using UnityEngine;
using System;
using System.IO; 

namespace FunGames.Sdk.Analytics.Funnel
{
    public class Funnel
    {
        public List<FunnelVar> funnelVars = new List<FunnelVar>();
        public string ts;
    }
    
    public class FunnelVar
    {
        public string varName;
        public string varValue;
        public string ts;
    }

    internal class FunGamesFunnel
    {
        internal static Funnel _FunnelData = new Funnel();

        internal static void Initialize()
        {
            LoadFunnel();
        }

        internal static void ParseFunnel(string response)
        {
            try
            {
                string varName = response.Split(':')[0];
                string varValue = response.Split(':')[1];
                bool toAdd = true;
                foreach (FunnelVar v in  _FunnelData.funnelVars)
                {
                    if ((v.varName == varName) & (v.varValue == varValue))
                    {
                        toAdd = false;
                        break;
                    }
                } 
                if (toAdd)
                {
                    FunnelVar v = new FunnelVar();
                    v.varName = varName;
                    v.varValue = varValue;
                    _FunnelData.funnelVars.Add(v);
                    SaveFunnel();
                }
            }
            catch
            {

            }
        }

        internal static string GetValue(string varName)
        {
            string res  = "null";
            foreach (FunnelVar v in _FunnelData.funnelVars)
            {
                if ((v.varName == varName))
                {
                    res = v.varValue;
                }
            } 
            return res;
        }

        internal static void SaveFunnel()
        {
            string funnel = JsonUtility.ToJson(_FunnelData);
            System.IO.File.WriteAllText(Application.persistentDataPath + "/Funnel.json", funnel);
        }
        internal static void LoadFunnel()
        {
            string filePath = Path.Combine(Application.persistentDataPath,  "/Funnel.json");
            if(File.Exists(filePath))
            {
                _FunnelData = JsonUtility.FromJson<Funnel>( File.ReadAllText(filePath));
            }
            else
            {
                _FunnelData = new Funnel();
            }
        }
    }
}

