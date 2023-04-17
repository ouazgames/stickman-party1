using System;
using System.Collections.Generic;

namespace FunGamesSdk.FunGames.Analytics.Helpers
{
    [Serializable]
    public class FunGamesTracking
    {
        public string idfa;
        public string bundle_id;
        public string session_id;
        public string os;
        public string build;
        public List<Metrics> metrics;
    }

    [Serializable]
    public class Metrics
    {
        public string evt;
        public string value;
        public string ts;
    }
}

