// model_interface.mqh

int ParseModelResponse(string response)
  {
   int action = 0;
   int start = StringFind(response, ":") + 1;
   int end = StringFind(response, "}");
   string value = StringSubstr(response, start, end - start);
   action = StringToInteger(value);
   return action;
  }
