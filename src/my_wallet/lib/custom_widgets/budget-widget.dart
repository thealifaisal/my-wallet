import 'package:flutter/material.dart';
import 'package:my_wallet/edit-budget-page.dart';

class BudgetWidget extends StatefulWidget {
  String expense_name;
  String expense;
  String budget_amount;

  BudgetWidget({this.expense, this.budget_amount, this.expense_name});

  @override
  _BudgetWidgetState createState() => _BudgetWidgetState();
}

class _BudgetWidgetState extends State<BudgetWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.orangeAccent.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.orangeAccent.withOpacity(0.4)
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ExpansionTile(
          title: Text(
            widget.expense_name,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          leading: InkWell(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>EditBudgetPage())
              );
            },
            child: Icon(
              Icons.edit,
              color: Colors.orangeAccent,
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_down),
          children: [

            ListTile(
              leading: Text(
                'Expense',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange
                ),
              ),
              trailing: Text(
                "\$ ${widget.expense}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              dense: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),

            ListTile(
              leading: Text(
                'Income',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),
              ),
              dense: true,
              trailing: Text(
                "\$ ${widget.budget_amount}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ]
      ),
    );
  }
}
