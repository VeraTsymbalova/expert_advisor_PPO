// utils.mqh

string FormatMarketDataToJson()
  {
   double price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   string json = "{\"price\": " + DoubleToString(price, 5) + "}";
   return json;
  }

void ExecuteTradeAction(int action)
  {
   CTrade trade;
   if (action == 1)
      trade.Buy(0.1, NULL, 0, 0, 0);
   else if (action == 2)
      trade.Sell(0.1, NULL, 0, 0, 0);
   else
      Print("Hold position");
  }
