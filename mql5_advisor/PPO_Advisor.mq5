//+------------------------------------------------------------------+
//|                                             PPO_Advisor.mq5      |
//|      Expert Advisor using PPO model predictions via REST API     |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
#include "api_client.mqh"
#include "model_interface.mqh"
#include "utils.mqh"

input string api_url = "http://localhost:8000/predict";
input int    prediction_interval = 60;

int last_prediction_time = 0;
CTrade trade;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Print("PPO Advisor Initialized");
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if (TimeCurrent() - last_prediction_time < prediction_interval)
      return;

   string json = FormatMarketDataToJson();
   string response = SendPredictionRequest(api_url, json);
   int action = ParseModelResponse(response);

   ExecuteTradeAction(action);

   last_prediction_time = TimeCurrent();
  }

//+------------------------------------------------------------------+
