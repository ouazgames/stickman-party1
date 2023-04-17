using System.Text;
using UnityEngine;
using System;
using System.Security.Cryptography;
using UnityEngine.Networking;

namespace FunGames.Sdk.Ads.Crosspromo
{
    public class ApiRequest : MonoBehaviour
    {
        public static UnityWebRequest sendUrlsRequest(string url)
        {
            char[] array1 = { '\u0074','\u0061','\u0070','\u006E','\u0061','\u0074','\u0069','\u006F','\u006E','\u002D','\u0073','\u0065','\u0063','\u0072','\u0065','\u0074' };
            var myString = new string(array1);

            string hash = CreateToken(url,myString);
            hash = hash.Remove(hash.Length-1);

            MD5 md5Hash = MD5.Create();
            byte [] result = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(myString));
            string bitString = BitConverter.ToString(result).Replace("-","").ToLower();
            
            UnityWebRequest www = UnityWebRequest.Get(url);
            
            Debug.Log("Sending API request for Urls...");
            
            www.SetRequestHeader ("Authorization", "hmac " + bitString + " " + hash);

            return www;
        }
    
        internal static string CreateToken(string message, string secret)
        {
            secret = secret ?? "";
            var encoding = new System.Text.ASCIIEncoding();
            byte[] keyByte = encoding.GetBytes(secret);
            byte[] messageBytes = encoding.GetBytes(message);
            using (var hmacsha256 = new HMACSHA256(keyByte))
            {
                byte[] hashmessage = hmacsha256.ComputeHash(messageBytes);
                return Convert.ToBase64String(hashmessage);
            }
        }
    }

}
