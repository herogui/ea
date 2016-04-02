
#property version   "1.00"
#property strict
#include "CErrorObj.mqh"

int OnInit()
  {

   CErrorObj *error = new CErrorObj(130,"999dddd999999");
   
   Print(error.Tip);
  
   delete error; 

   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {

   
  }

  void OnTick()
  {
  
     //CloseAllOrder();
     
     //openSell();
     
    //openBuy();
  }
  int lotnum1 = 4;
  int num = 0;
  void openBuy()
  {
  double price = Ask;
      double  stoploss = price - 0.002;
    double  takeprofit = price + 0.002;
  
//--- place market order to buy 1 lot 
   //注意  止损  止盈   开仓手数要正确
     if((num++)<lotnum1)
     {
    int ticket=OrderSend("EURUSD",OP_BUY,0.01,price,10,stoploss,takeprofit,"My order",16384,0,clrGreen); 
    if(ticket<0) 
     { 
      Print("OrderSend failed with error2 #",GetLastError()); 
     } 
    else 
      Print("OrderSend placed successfully");   
     }
     
  }
   int num2 = 0;
   int lotnun2 = 4;
  void openSell()
  {
  double price = Ask;
      double  takeprofit = price - 0.002;
    double  stoploss = price + 0.002;
  
//--- place market order to buy 1 lot 
   //注意  止损  止盈   开仓手数要正确
     if((num2++)<lotnun2)
     {
    int ticket=OrderSend("EURUSD",OP_SELL,0.01,price,10,stoploss,takeprofit,"My order",16384,0,clrGreen); 
    if(ticket<0) 
     { 
      Print("OrderSend failed with error2 #",GetLastError()); 
     } 
    else 
      Print("OrderSend placed successfully");   
     }
     
  }
  
  void CloseAllOrder()
  {
     int total = OrdersTotal();
     
     for(int i = total -1;i>-1;i--)
     {
         if(OrderSelect(i, SELECT_BY_POS)==true)
         {
         int  ticket2=OrderTicket();
         //Print("ticketNum:"+IntegerToString(ticket2));
              OrderClose(ticket2,OrderLots(),Ask,5,clrBlueViolet);
         }
     }
  } 
