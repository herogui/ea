#property version   "1.00"
#property strict
#include "CErrorObj.mqh"
class CError
  {
       
public:
       CErrorObj* ErrorObjList[28];
       
       CError();      
       int Print();
       ~CError();
  };

CError::CError()
  {
      CErrorObj *errorObj0 =  new CErrorObj(2,"一般错误");
      ErrorObjList[0] = errorObj0;
      
      CErrorObj *errorObj1 =  new CErrorObj(3,"无效的交易参数");
      ErrorObjList[1] = errorObj1;
      
      CErrorObj *errorObj2 =  new CErrorObj(4,"交易服务器繁忙");
      ErrorObjList[2] = errorObj2;
      
      CErrorObj *errorObj3 =  new CErrorObj(5,"MT4版本太旧");
      ErrorObjList[3] = errorObj3;
      
      CErrorObj *errorObj4 =  new CErrorObj(6,"没有连接服务器");
      ErrorObjList[4] = errorObj4;
      
      CErrorObj *errorObj5 =  new CErrorObj(7,"没有足够权限进行相应操作");
      ErrorObjList[5] = errorObj5;
      
      CErrorObj *errorObj6 =  new CErrorObj(8,"请求过于频繁");
      ErrorObjList[6] = errorObj6;
      
      CErrorObj *errorObj7 =  new CErrorObj(9,"交易运行故障");
      ErrorObjList[7] = errorObj7;
      
      CErrorObj *errorObj8 =  new CErrorObj(64,"账户被禁止");
      ErrorObjList[8] = errorObj8;
      
      CErrorObj *errorObj9 =  new CErrorObj(65,"无效的账户");
      ErrorObjList[9] = errorObj9;
      
      CErrorObj *errorObj10 =  new CErrorObj(128,"交易超时");
      ErrorObjList[10] = errorObj10;
      
      CErrorObj *errorObj11 =  new CErrorObj(129,"无效价格");
      ErrorObjList[11] = errorObj11;
      
      CErrorObj *errorObj12 =  new CErrorObj(130,"无效的止损价格");
      ErrorObjList[12] = errorObj12;
      
      CErrorObj *errorObj13 =  new CErrorObj(131,"无效的下单量");
      ErrorObjList[13] = errorObj13;
      
      CErrorObj *errorObj14 =  new CErrorObj(132,"市场关闭");
      ErrorObjList[14] = errorObj14;
      
      CErrorObj *errorObj15 =  new CErrorObj(133,"交易被禁止");
      ErrorObjList[15] = errorObj15;
      
      CErrorObj *errorObj16 =  new CErrorObj(134,"资金不足");
      ErrorObjList[16] = errorObj16;
      
      CErrorObj *errorObj17 =  new CErrorObj(135,"价格改变");
      ErrorObjList[17] = errorObj17;
      
      CErrorObj *errorObj18 =  new CErrorObj(136,"开价");
      ErrorObjList[18] = errorObj18;
      
      CErrorObj *errorObj19 =  new CErrorObj(137,"经纪繁忙");
      ErrorObjList[19] = errorObj19;
      
      CErrorObj *errorObj20 =  new CErrorObj(138,"重新开价");
      ErrorObjList[20] = errorObj20;
      
      CErrorObj *errorObj21 =  new CErrorObj(139,"定单被锁定");
      ErrorObjList[21] = errorObj21;
      
      CErrorObj *errorObj22 =  new CErrorObj(140,"只允许开多仓");
      ErrorObjList[22] = errorObj22;
      
      CErrorObj *errorObj23 =  new CErrorObj(141,"过多请求");
      ErrorObjList[23] = errorObj23;
      
      CErrorObj *errorObj24 =  new CErrorObj(145,"因为价格过于接近市价，所以操作被拒绝");
      ErrorObjList[24] = errorObj24;
      
      CErrorObj *errorObj25 =  new CErrorObj(146,"交易文本已满");
      ErrorObjList[25] = errorObj25;
      
      CErrorObj *errorObj26 =  new CErrorObj(147,"服务器禁止设定过期时间");
      ErrorObjList[26] = errorObj26;
      
      CErrorObj *errorObj27 =  new CErrorObj(148,"开单和挂单总数已被经纪限定");
      ErrorObjList[27] = errorObj27;
  } 
  
  int CError::Print()
  {
     int code = GetLastError();
     string tip =IntegerToString(code);
     int dim_size=ArrayRange(this.ErrorObjList, 0);
     for(int i = 0;i<dim_size;i++)
     { 
        if(this.ErrorObjList[i].Code == code)
        {
           tip = this.ErrorObjList[i].Tip;
           break;
        }
     }
     Print("错误:" +tip);
     return code;
  }

  CError::~CError()
  {
     
  }

