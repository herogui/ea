//+------------------------------------------------------------------+
//|                                                        hello.mq4 |
//|                        Copyright 2016, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2016, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
  void OnTick()
  {
 double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL); 
   //Print("Minimum Stop Level=",minstoplevel," points"); 
   double price=Ask; 
//--- calculated SL and TP prices must be normalized 
// double stoploss=NormalizeDouble(Bid-minstoplevel*Point,Digits); 
//  double takeprofit=NormalizeDouble(Bid+minstoplevel*Point,Digits);
  
  double  stoploss = price - 0.009;
  double  takeprofit = price + 0.003;
  
//--- place market order to buy 1 lot 
   //注意  止损  止盈   开仓手数要正确
   int totalOrder = OrdersTotal();int ticket =-2;
   
   if(OrderSelect(0, SELECT_BY_POS)==true)
    ticket=OrderTicket();
  else
   Print("OrderSelect 失败错误代码",GetLastError());
   
   if(totalOrder<1)
   {
   
    ticket=OrderSend(Symbol(),OP_BUY,0.01,price,3,stoploss,takeprofit,"My order",16384,0,clrGreen); 
   if(ticket<0) 
     { 
      // string error = getErrorStr(GetLastError());
     // Print("方法OrderSend错误： ",error); 
     test();
     } 
   else 
      Print("OrderSend placed successfully");   
    }
    else {
    if(OrderSelect(ticket, SELECT_BY_TICKET)==true)
    {
     Print("定单 #12470 开价格", OrderOpenPrice());
     Print("定单 #12470 收盘价格 ", OrderClosePrice());
     bool isClose = OrderClose(ticket,0.01,Ask,5,clrGreen);
     if(isClose) Print("ok");
    }
  else
    Print("OrderSelect 返回的错误 ",GetLastError());
    }
  }
  /*
  string getErrorStr(int errorCode)
  {
      CErrorObj *errorObj = new CErrorObj();
     errorCode.Code = 134;
      errorCode.Tip = "资金不足,请减少开仓手数或增加保证金！";
      if(errorCode == errorCode.Code)
      return errorCode.Tip;
      else return "未知错误！";
  } 
  */
  
  
  class CErrorObj
  {
      public: 
             int Code;
             string Tip;
  };
//+------------------------------------------------------------------+


class CPerson 
  { 
   string            m_first_name;     // First name  
   string            m_second_name;    // Second name 
public: 
   //--- An empty default constructor 
                     CPerson() {Print(__FUNCTION__);}; 
   //--- A parametric constructor 
                     CPerson(string full_name); 
   //--- A constructor with an initialization list 
                     CPerson(string surname,string name): m_second_name(surname), m_first_name(name) {}; 
   void PrintName(){PrintFormat("Name=%s Surname=%s",m_first_name,m_second_name);}; 
  }; 
//+------------------------------------------------------------------+ 
//|                                                                  | 
//+------------------------------------------------------------------+ 
CPerson::CPerson(string full_name) 
  { 
   int pos=StringFind(full_name," "); 
   if(pos>=0) 
     { 
      m_first_name=StringSubstr(full_name,0,pos); 
      m_second_name=StringSubstr(full_name,pos+1); 
     } 
  } 
//+------------------------------------------------------------------+ 
//| Script program start function                                    | 
//+------------------------------------------------------------------+ 
void test() 
  { 
//--- Get an error "default constructor is not defined" 
   CPerson people[5]; 
   CPerson Tom="Tom Sawyer";                       // Tom Sawyer 
   CPerson Huck("Huckleberry","Finn");             // Huckleberry Finn 
   CPerson *Pooh = new CPerson("Winnie","Pooh");  // Winnie the Pooh 
   //--- Output values 
   Tom.PrintName(); 
   Huck.PrintName(); 
   Pooh.PrintName(); 
    
   //--- Delete a dynamically created object 
   delete Pooh; 
  }