import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_wallet/add-budget-page.dart';
import 'package:my_wallet/class/budget-class.dart';
import 'package:my_wallet/custom_widgets/budget-widget.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {

  // fetch budget
  Future<List<Budget>> fetchBudget() async {
    List<Budget> list = [

      Budget(expense: "1280", budget_amount: "1500", expense_name: "Food"),
      Budget(expense: "900", budget_amount: "1100", expense_name: "Bill"),
      Budget(expense: "400", budget_amount: "500", expense_name: "Shopping"),
    ];

//    for(var device in list){
//
//      list.add(
//        Budget(expense: "1280", budget_amount: "1500", expense_name: "Food"),
//      );
//    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyWallet", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              "Nov 2020",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, color: Colors.white),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  FontAwesomeIcons.calendarDay,
                  color: Colors.white,
                  size: 22.0,
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        children: [
          // Budget List
          FutureBuilder(
            future: fetchBudget(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  print("Error: ${snapshot.error}");
                  return AlertDialog(
                    title: Text(
                      'Budget Cannot Be Loaded',
                      textAlign: TextAlign.center,
                    ),
                    content: Text(
                      'Error: ${snapshot.error}',
                    ),
                  );
                }
                else {
                  return Container(
                    height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height*0.335,
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 6, right: 6),
                        // snapshot.data = list
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(top: 10, bottom: 5),
                            child: BudgetWidget(
                              expense: snapshot.data[index].expense,
                              expense_name: snapshot.data[index].expense_name,
                              budget_amount: snapshot.data[index].budget_amount,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              }
              else {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                );
              }
            },
          ),

          // Add Budget Button
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
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>AddBudgetPage())
                );
              },
              color: Colors.orangeAccent,
              child: Text(
                'Add Budget',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
