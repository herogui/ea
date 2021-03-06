
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CTrade
  {
private:
              int OpenTrade(int sellOrBuy);                            
                     
public:
                     string symbol;                                          
                     double   volume;
                     double   price;
                     int slippage;
                     double   stoplossNum;
                     double   takeprofitNum;
                     
                     int buy();
                     int sell();
                     int CloseAll();
                     int CloseAll(int slippage);
                     CTrade();
                    ~CTrade();
  };

  CTrade::CTrade()
  {
      this.volume = 1;//默认下单数为1手
      this.symbol = "EURUSD";
      this.price = Ask;
      this.slippage = 5;//默认的滑点为5个
      this.stoplossNum = 40/10000;//默认止损为40个点
      this.takeprofitNum = 50/10000;//默认止盈位50个点
  }
  
  int CTrade::buy()
  {
     return this.OpenTrade(1);
  }
  
  int CTrade::sell()
  {
    return this.OpenTrade(0);
  }
  
  //sell = 0;  buy = 1;
  int CTrade::OpenTrade(int sellOrBuy)
  {   
    this.price = Ask;//注意  这里的赋值不能上  因为价格随时变化
    double  stoplossPrice;
    double  takeprofitPrice; 
    int  orderType = OP_SELL;;
    
    if(sellOrBuy == 1)//买
    { 
        stoplossPrice = price - this.stoplossNum;
        takeprofitPrice = price + this.takeprofitNum;
        orderType = OP_BUY;
    }
    else
    {
        stoplossPrice = price + this.stoplossNum;
        takeprofitPrice = price - this.takeprofitNum;
        orderType = OP_SELL;
    }   

    //注意  止损  止盈   开仓手数要正确    
    int ticket=OrderSend(this.symbol,orderType,this.volume,this.price,this.slippage,stoplossPrice,takeprofitPrice,
                           "My order",16384,0,clrGreen); 
    return ticket; 
  } 
  
   int  CTrade::CloseAll()
   {
      return  this.CloseAll(this.slippage);       
   }
  
  int  CTrade::CloseAll(int slip)
  {
     int total = OrdersTotal();
     
     int sucNum = 0;
     for(int i = total -1;i>-1;i--)
     {
         if(OrderSelect(i, SELECT_BY_POS)==true)
         {
            int  ticket=OrderTicket();         
            bool isSuc =  OrderClose(ticket,OrderLots(),Ask,slip,clrBlueViolet);
            if(isSuc)
            {
               sucNum ++;
            }
         }
     }
     
     return sucNum;
  } 
  

CTrade::~CTrade()
  {
  }
//+------------------------------------------------------------------+
