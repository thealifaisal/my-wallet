import 'package:flutter/material.dart';
import 'package:my_wallet/custom_widgets/transaction-widget.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                child: Icon(Icons.arrow_back, color: Colors.white,),
                onTap: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.orangeAccent,
              title: Text("Transactions", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),),
              bottom: TabBar(
                indicatorColor: Colors.orangeAccent,
                indicatorWeight: 2.5,
                unselectedLabelColor: Colors.white70,
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text(
                      "Income",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Expense",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [

                // Income
                ListView(
                  padding: EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
                  children: [

                    TransactionWidget(leading_icon: Icons.monetization_on_outlined, amount: '10000', name: 'Salary',),

                    SizedBox(
                      height: 10,
                    ),

                    TransactionWidget(leading_icon: Icons.monetization_on_outlined, amount: '7200', name: 'Allowance',),

                    SizedBox(
                      height: 10,
                    ),

                    TransactionWidget(leading_icon: Icons.monetization_on_outlined, amount: '20000', name: 'Investment',),

                  ],
                ),

                // Expense
                ListView(
                  padding: EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
                  children: [

                    TransactionWidget(leading_icon: Icons.local_fire_department_outlined, amount: '9000', name: 'Food',),

                    SizedBox(
                      height: 10,
                    ),

                    TransactionWidget(leading_icon: Icons.local_fire_department_outlined, amount: '8000', name: 'Transport',),

                    SizedBox(
                      height: 10,
                    ),

                    TransactionWidget(leading_icon: Icons.local_fire_department_outlined, amount: '7200', name: 'Stationary',)
                  ],
                ),
              ],
            ),
        ),
    );
  }
}
