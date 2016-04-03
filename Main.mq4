
#property version   "1.00"
#property strict

#include "CError.mqh"
#include "CTrade.mqh"
 CError *Error;
 CTrade *Trade;
int OnInit()
  {
    Error = new CError();  
    Trade = new CTrade();
    
    int res = Trade.sell();
    Error.Print();
   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {     
     delete Trade;
     
     int dim_size=ArrayRange(Error.ErrorObjList, 0);
     for(int i = 0;i<dim_size;i++)
     { 
        delete Error.ErrorObjList[i];
     }
     
     delete Error;
  }

  void OnTick()
  {  
     //CloseAllOrder();
     
     //openSell();
     
    //openBuy();
  }
 
