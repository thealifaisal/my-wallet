import 'package:flutter/material.dart';

class EditBudgetPage extends StatefulWidget {
  @override
  _EditBudgetPageState createState() => _EditBudgetPageState();
}

class _EditBudgetPageState extends State<EditBudgetPage> {

  final _formFieldKey = GlobalKey<FormFieldState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String amount;
  String expense_category;
  String month;
  DateTime selectedDate;
  List<String> expense_category_list = ['Food', 'Social Life', 'Transportation'];
  List<String> months = ['January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December'];

  @override
  void initState() {
    this.selectedDate = DateTime.now();
    this.month = months[this.selectedDate.month-1];
    super.initState();
  }

  void changeBudgetAlertDialogBox(){
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text('Save Changes?'),
          content: Text("Do you want to save changes to your Budget?"),
          actions: [
            MaterialButton(
              onPressed: (){
                Navigator.of(context, rootNavigator: true).pop(); // closes alert dialog
                Navigator.of(context).pop(); // returns to budget page
                _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Budget changed.')));
              },
              child: Text('Yes', style: TextStyle(color: Colors.white),),
              color: Colors.orange,
            ),
            FlatButton(
              onPressed: (){
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text('No'),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            changeBudgetAlertDialogBox();
          },
          child: Icon(Icons.arrow_back_outlined, color: Colors.white,),
        ),
        title: Text(
          "Edit Budget",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
        actions: [

          InkWell(
            child: Material(
              color: Colors.white,
              shape: CircleBorder(
                side: BorderSide(color: Colors.white)
              ),
              child: Icon(
                Icons.delete,
                color: Colors.red,
                size: 28,
              ),
            ),
            onTap: (){
              showDialog(
                  context: context,
                  builder: (context)=>AlertDialog(
                    title: Text('Delete Budget?'),
                    content: Text("Do you want to delete this Budget?"),
                    actions: [
                      MaterialButton(
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop(); // closes alert dialog
                          Navigator.of(context).pop(); // returns to budget page
                          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Budget deleted.')));
                        },
                        child: Text('Yes'),
                        color: Colors.red,
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Text('No'),
                      ),
                    ],
                  )
              );
            },
          ),

          SizedBox(width: 10,),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 13, right: 13, top: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          children: [

            Column(
              children: [

                // DatePicker
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Month',
                      style: TextStyle(fontSize: 19),
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
                          width: MediaQuery.of(context).size.width/2.5,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$month',
                                style: TextStyle(
                                    fontSize: 17
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: selectedDate,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2120),
                                  ).then((date) {
                                    setState(() {
                                      selectedDate = date;
                                      month = months[date.month-1];
                                    });
                                  });
                                },
                                child: Icon(
                                  Icons.date_range,
                                  size: 25,
                                  color: Colors.orange,
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25,),


                // Expense Category Dropdown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Expense Category',
                      style: TextStyle(fontSize: 19),
                    ),
                    Material(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.orangeAccent)),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width/2.5,
                        child: DropdownButtonFormField(
                          value: this.expense_category,
                          onChanged: (val) => this.expense_category = val,
                          onSaved: (val) => this.expense_category = val,
                          items: expense_category_list
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
                  ],
                ),

                SizedBox(height: 5,),

                // Amount Text
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "Amount",
                    style: TextStyle(fontSize: 19),
                  ),
                ),

                SizedBox(height: 18,),

                TextFormField(
                  key: _formFieldKey,
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
                      color: Colors.orangeAccent,
                    ),
                    hintText: 'Enter Amount',
                    focusColor: Colors.orange,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.orangeAccent)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.orangeAccent)
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

            Container(
              margin: EdgeInsets.only(top: 20),
              child: MaterialButton(
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
                  if(_formFieldKey.currentState.validate() && this.expense_category != null){
                    _formFieldKey.currentState.save();
                    changeBudgetAlertDialogBox();
                  }
                  else{
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Expense Category or Amount might be empty.')));
                  }
                },
                color: Colors.orangeAccent,
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),

          ]
        ),
      ),
    );
  }
}
