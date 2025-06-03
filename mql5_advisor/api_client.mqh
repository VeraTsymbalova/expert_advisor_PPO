// api_client.mqh
#include <Wininet.dll>

string SendPredictionRequest(string url, string jsonBody)
  {
   char post[];
   StringToCharArray(jsonBody, post);

   char result[2048];
   int res_len = WebRequest(
                  "POST",
                  url,
                  "Content-Type: application/json\r\n",
                  NULL,
                  10,
                  post,
                  result,
                  NULL
                 );

   if (res_len <= 0)
     {
      Print("[ERROR] Request failed: ", GetLastError());
      return "{}";
     }

   string response;
   CharArrayToString(result, response);
   return response;
  }
