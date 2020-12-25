import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum TransType { expense, income}

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction>{

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TransType suit = TransType.expense;

  List<String> ecategory_list = ['Food', 'Social Life', 'Transportation'];
  List<String> icategory_list = ['Allowance', 'Salary', 'Investment'];
  String category;

  List<String> selected_cat_list;

  List<String> currency_list = ['PKR', 'USD', 'EURO'];
  String currency;

  var amount;
  var note;

  TextEditingController amountControl = TextEditingController();
  TextEditingController catControl = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String f_date = new DateFormat.yMMMd().format(DateTime.now());

  @override
  void initState() {
    selected_cat_list = ecategory_list;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return (
        new Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
              "Add Transaction",
              style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.orange,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_outlined, color: Colors.white,),
            ),
          ),
          body: ListView(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              children: <Widget> [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.fromLTRB(0, 0, 120, 0),
                      child: Text("Date",
                        style: TextStyle(
                            fontSize: 19
                        ),
                      ),
                    ),

                    Material(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.orangeAccent)
                      ),
                      child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width/2.3,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: InkWell(
                            onTap: (){
                              showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2120),
                              ).then((date) {
                                setState(() {
                                  selectedDate = date;
                                  f_date = new DateFormat.yMMMd().format(selectedDate);
                                }
                                );
                              }
                              );
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      '$f_date',
                                      style: TextStyle(
                                          fontSize: 17
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.date_range,
                                    size: 25,
                                    color: Colors.orange,
                                  ),

                                ]
                            ),
                          )
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 20,),

                Row(
                    children: <Widget> [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                        child: Text("Type",
                          style: TextStyle(
                              fontSize: 19
                          ),
                        ),
                      ),
                      Radio(
                          value: TransType.expense,
                          activeColor: Colors.orange,
                          groupValue: suit,
                          onChanged: (TransType value){
                            setState(() {
                              if(this.category!=null)
                              {
                                this.category = ecategory_list[0];
                              }
                              suit = value;
                              selected_cat_list = ecategory_list;
                            });
                          }
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text("Expense",
                          style: TextStyle(
                              fontSize: 17
                          ),
                        ),
                      ),
                      Radio(
                          value: TransType.income,
                          groupValue: suit,
                          activeColor: Colors.orange,
                          onChanged: (TransType value){
                            setState(() {
                              if(this.category!=null)
                                {
                                  this.category = icategory_list[0];
                                }
                              suit = value;
                              selected_cat_list = icategory_list;
                              //this.category = null;
                            });
                          }
                      ),
                      Text(
                        "Income",
                        style: TextStyle(
                            fontSize: 17
                        ),
                      ),
                    ]
                ),

                SizedBox(height: 20,),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Container(
                        //margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
                        child: Text("Category",
                          style: TextStyle(
                              fontSize: 19
                          ),
                        ),
                      ),

                      Material(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.orangeAccent)),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width/2.3,
                          child: DropdownButtonFormField(
                            value: this.category,
                            onChanged: (val) => this.category = val,
                            onSaved: (val) => this.category = val,
                            items: selected_cat_list
                                .map((val) => DropdownMenuItem(
                              value: val,
                              child: Text(val),
                            ))
                                .toList(),
                            isExpanded: true,
                            // makes the dropdown of it's parent size. e.g: Container
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                hintText: 'Select',
                                labelStyle: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey
                                ),
                                filled: true,
                                fillColor: Colors.white70
                            ),
                            isDense: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),

                    ]
                ),

                SizedBox(height: 20,),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Container(
                        //margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
                        child: Text("Currency",
                          style: TextStyle(
                              fontSize: 19
                          ),
                        ),
                      ),

                      Material(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.orangeAccent)),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width/2.3,
                          child: DropdownButtonFormField(
                            value: this.currency,
                            onChanged: (val) => this.currency = val,
                            onSaved: (val) => this.currency = val,
                            items: currency_list
                                .map((val) => DropdownMenuItem(
                              value: val,
                              child: Text(val),
                            ))
                                .toList(),
                            isExpanded: true,
                            // makes the dropdown of it's parent size. e.g: Container
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                hintText: 'Select',
                                labelStyle: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey
                                ),
                                filled: true,
                                fillColor: Colors.white70
                            ),
                            isDense: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),


                    ]
                ),

                SizedBox(height: 35,),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Amount",
                          style: TextStyle(fontSize: 19),
                        ),
                      ),

                      SizedBox(height: 18,),

                      TextFormField(
                        onSaved: (val){
                          this.amount = val;
                        },
                        validator: (val){
                          if(val.isEmpty){
                            return 'Amount cannot be empty.';
                          }
                          else{
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.attach_money_sharp,
                            color: Colors.orange,
                          ),
                          hintText: 'Enter Amount',
                          focusColor: Colors.orange,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.orange)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.orange)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Note ',
                                style: TextStyle(fontSize: 19),
                              ),
                              TextSpan(
                                text: '(optional)',
                                style: TextStyle(fontSize: 14),
                              ),
                            ]
                          ),
                        ),
                      ),

                      SizedBox(height: 18,),

                      TextFormField(
                        onSaved: (val){
                          this.note = val;
                        },
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.note_add,
                            color: Colors.orange,
                          ),
                          hintText: 'Enter Note',
                          focusColor: Colors.orange,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.orange)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.orange)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)
                          ),
                        ),
                      ),

                    ],
                  ),
                ),


                SizedBox(height: 180,),

                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 50,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  elevation: 1,
                  splashColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                      side: BorderSide(color: Colors.orangeAccent)
                  ),
                  onPressed: () {
                    if(_formKey.currentState.validate() && this.category != null && this.currency!= null){
                      _formKey.currentState.save();
                      String content;
                      double eamount;
                      if(suit == TransType.expense)
                        {
                          eamount = double.parse(this.amount) - 70; //this.amount - 70;
                          content = "Your expense on ${this.category} in Oct' 20 was ${eamount}, lower then current expense.";
                          showAlertDialog(context,"Expense",this.currency,content);
                        }
                      else
                        {
                          eamount = double.parse(this.amount);
                          content = "Your income ${this.currency} $eamount from ${this.category}.";
                          showAlertDialog(context,"Income",this.currency,content);
                        }
                    }
                    else{
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Category, Currency or Amount might be empty.')));
                    }
                  },
                  color: Colors.orange,
                  child: Text(
                    'Save Transaction',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ]
          ),
        )

    );
  }
}

void showAlertDialog(BuildContext context, String category, String currency, String content) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context,rootNavigator: true).pop();
    },
  );
  Widget continueButton = MaterialButton(
    color: Colors.orange,
    child: Text("Save", style: TextStyle(color: Colors.white),),
    onPressed: () {
      Navigator.of(context,rootNavigator: true).pop();
      Navigator.of(context).pop();

    },
  ); // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Save $category?"),
    content: Text(content),
    actions: [
      continueButton,
      cancelButton,
    ],
  ); // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
