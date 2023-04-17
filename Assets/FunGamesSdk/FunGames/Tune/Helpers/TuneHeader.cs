using JetBrains.Annotations;
using SimpleJSON;

namespace FunGames.Sdk.Tune.Helpers
{
    public class TuneHeader
    {
        public string bundle_id;
        public string user_id;
        public string idfa;
        public JSONNode questionsNode;

        public JSONObject ToJson()
        {
            var dest = new JSONObject();

            dest.Add("bundle_id", bundle_id);
            dest.Add("user_id", user_id);
            dest.Add("idfa", idfa);
            dest.Add("questions", questionsNode);
            
            return dest;
        }
        
    }
}