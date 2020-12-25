import 'package:flutter/material.dart';

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
                child: Icon(Icons.arrow_back),
                onTap: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.orangeAccent,
              title: Text('Transactions'),
              bottom: TabBar(
                indicatorColor: Colors.orangeAccent,
                indicatorWeight: 2.5,
                tabs: [
                  Tab(
                    child: Text(
                      "Income",
                      style: TextStyle(fontSize: 12.5),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Expense",
                      style: TextStyle(fontSize: 12.5),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              ListView(
                // for income
                padding:
                    EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
                children: [
                  Material(
                    shadowColor: Colors.orangeAccent.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(
                        color: Colors.orangeAccent.withOpacity(0.4),
                        width: 2,
                      ),
                    ),
                    elevation: 8,
                    child: InkWell(
                      //onTap: null,
                      child: Container(
                        height: 60,
                        //padding: EdgeInsets.all(4),
                        child: ListTile(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          leading: Icon(
                            Icons.food_bank,
                            size: 35,
                            color: Colors.orange,
                          ),
                          title: Text(
                            "Salary",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Text(
                            "RS 10000",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    shadowColor: Colors.orangeAccent.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(
                        color: Colors.orangeAccent.withOpacity(0.4),
                        width: 2,
                      ),
                    ),
                    elevation: 8,
                    child: InkWell(
                      //onTap: null,
                      child: Container(
                        height: 60,
                        //padding: EdgeInsets.all(4),
                        child: ListTile(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          leading: Icon(
                            Icons.food_bank,
                            size: 35,
                            color: Colors.orange,
                          ),
                          title: Text(
                            "Allowance",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Text(
                            "RS 7200",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    shadowColor: Colors.orangeAccent.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(
                        color: Colors.orangeAccent.withOpacity(0.4),
                        width: 2,
                      ),
                    ),
                    elevation: 8,
                    child: InkWell(
                      //onTap: null,
                      child: Container(
                        height: 60,
                        //padding: EdgeInsets.all(4),
                        child: ListTile(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          leading: Icon(
                            Icons.food_bank,
                            size: 35,
                            color: Colors.orange,
                          ),
                          title: Text(
                            "Investment",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Text(
                            "RS 20000",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ListView(
                // for Expense
                padding:
                    EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
                children: [
                  Material(
                    shadowColor: Colors.orangeAccent.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(
                        color: Colors.orangeAccent.withOpacity(0.4),
                        width: 2,
                      ),
                    ),
                    elevation: 8,
                    child: InkWell(
                      //onTap: null,
                      child: Container(
                        height: 60,
                        //padding: EdgeInsets.all(4),
                        child: ListTile(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          leading: Icon(
                            Icons.food_bank,
                            size: 35,
                            color: Colors.orange,
                          ),
                          title: Text(
                            "Food",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Text(
                            "RS 7200",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    shadowColor: Colors.orangeAccent.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(
                        color: Colors.orangeAccent.withOpacity(0.4),
                        width: 2,
                      ),
                    ),
                    elevation: 8,
                    child: InkWell(
                      //onTap: null,
                      child: Container(
                        height: 60,
                        //padding: EdgeInsets.all(4),
                        child: ListTile(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          leading: Icon(
                            Icons.food_bank,
                            size: 35,
                            color: Colors.orange,
                          ),
                          title: Text(
                            "Transport",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Text(
                            "RS 8000",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    shadowColor: Colors.orangeAccent.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(
                        color: Colors.orangeAccent.withOpacity(0.4),
                        width: 2,
                      ),
                    ),
                    elevation: 8,
                    child: InkWell(
                      //onTap: null,
                      child: Container(
                        height: 60,
                        //padding: EdgeInsets.all(4),
                        child: ListTile(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          leading: Icon(
                            Icons.food_bank,
                            size: 35,
                            color: Colors.orange,
                          ),
                          title: Text(
                            "Stationary",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Text(
                            "RS 7200",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ])));
  }
}
