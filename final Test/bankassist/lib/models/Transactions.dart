

// Data Model 
class Transactions {

   String  date;
   String  purpose;
   String amount;


  Transactions(this.date,{this.amount,this.purpose});
  Transactions.fromMap(Map map) :
    this.date = map['date'],
    this.amount = map['amount'],

    this.purpose=map['purpose'];

  Map toMap(){
    return {
      'date': this.date,
      'amount': this.amount,
      'purpose': this.purpose
    };
  }
  

  
}


