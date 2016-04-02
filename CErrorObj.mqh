
#property version   "1.00"
#property strict

class CErrorObj
  {
         public:
          int Code;
         string Tip;
         CErrorObj(int code,string tip);
        CErrorObj();
        ~CErrorObj();
  };
CErrorObj::CErrorObj()
  {
  }
CErrorObj::CErrorObj(int code,string tip)
  {
      this.Code = code;
      this.Tip = tip;
  }
CErrorObj::~CErrorObj()
  {
  }

