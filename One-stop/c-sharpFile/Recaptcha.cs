using System;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace One_stop.c_sharpFile
{
    public class Recaptcha
    {
        [JsonProperty("success")] public string Success { get; set; }

        [JsonProperty("error-codes")] public List<string> ErrorCodes { get; set; }

        public static string Validate(string EncodedResponse)
        {
            var client = new WebClient();

            var PrivateKey = "6LdL85wUAAAAAJ4_YE5A5YS-6sWfUPUxx70YAMwz";

            var GoogleReply = client.DownloadString(string.Format(
                "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", PrivateKey,
                EncodedResponse));

            var captchaResponse = JsonConvert.DeserializeObject<Recaptcha>(GoogleReply);

            return captchaResponse.Success.ToLower();
        }
    }
}