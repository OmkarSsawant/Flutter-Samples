class Transactions{

 String _amount;
 bool _wORd;
 String _date;
 int _id;
 Transactions(this._amount,this._date,this._wORd);
 Transactions.withId(this._id,this._amount,this._date,this._wORd);
String get amount =>_amount;
 bool get wORd =>_wORd;
 String get date  =>_date;
 int get  id =>_id;
 set amount(String amt){
   amount=amt;
 }
set wORd(bool b){
  wORd=b;
}
set date(String d_ate){
  date=d_ate;
}
Map<String,dynamic> toMap(){
var map=Map<String,dynamic>();
if(id==null){
  map['id']=_id;
}
map['amount']=_amount;
map['wORd']=_wORd.toString();
map['date']=_date;
return map;
}
Transactions.fromMapObject(Map<String,dynamic> map){
this._date=map['date'];
this._wORd= toBool(map['wORs']);
this._amount=map['amount'];

}
bool toBool(String b){
  if(b=="true"){
    return true;
  }
  else{
    return false;
  }
}
}