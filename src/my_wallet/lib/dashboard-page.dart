import 'package:my_wallet/transactions-page.dart';
import 'package:my_wallet/custom_widgets/daily-widget.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/add-transaction-page.dart';
import 'package:my_wallet/class/device.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_wallet/custom_widgets/monthly-widget.dart';
import 'package:my_wallet/custom_widgets/weekly-widget.dart';
import 'package:my_wallet/custom_widgets/yearly-widget.dart';

// This page shows daily transactions
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // fetch daily transactions
  Future<List<Device>> fetchDevices() async {
    List<Device> list = [
      Device(
        date: 1,
        month: "January",
        year: "2019",
        income: 1000,
        expense: 400,
      ),
      Device(
        date: 2,
        month: "January",
        year: "2019",
        income: 2000,
        expense: 300,
      ),
      Device(
        date: 3,
        month: "January",
        year: "2019",
        income: 4000,
        expense: 600,
      ),
      Device(
        date: 4,
        month: "January",
        year: "2019",
        income: 500,
        expense: 200,
      ),
      Device(
        date: 8,
        month: "February",
        year: "2019",
        income: 500,
        expense: 200,
      )
    ];

    // for (var Device in list) {
    //   list.add(Device(
    //     date: Device["date"],
    //     month: Device["month"],
    //     year: Device["year"],
    //     income: Device["income"],
    //     expense: Device["expense"],
    //   ));
    // }

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
        bottom: TabBar(
          indicatorColor: Colors.orangeAccent,
          indicatorWeight: 2.5,
          unselectedLabelColor: Colors.white70,
          labelColor: Colors.white,
          tabs: [
            Tab(
              child: Text(
                "Daily",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "Weekly",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "Monthly",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "Yearly",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        // add button for transaction
        child: new Icon(
          Icons.add,
          color: Colors.white,
          size: 26,
        ),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddTransaction()));
        },
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: TabBarView(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: fetchDevices(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print("Error: ${snapshot.error}");
                    return AlertDialog(
                      title: Text(
                        'Devices Cannot Be Loaded',
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        'Error: ${snapshot.error}',
                      ),
                    );
                  } else {
                    return GridView.builder(
                      itemCount: snapshot.data.length, // itemcount
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            child: DailyWidget(
                              date: snapshot.data[index].date,
                              month: snapshot.data[index].month,
                              year: snapshot.data[index].year,
                              income: snapshot.data[index].income,
                              expense: snapshot.data[index].expense,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TransactionsPage()));
                            }
                          );
                      },
                    );
                  }
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  );
                }
              },
            ),
          ),
          // for weekly
          Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: fetchDevices(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print("Error: ${snapshot.error}");
                    return AlertDialog(
                      title: Text(
                        'Devices Cannot Be Loaded',
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        'Error: ${snapshot.error}',
                      ),
                    );
                  } else {
                    return GridView.builder(
                      itemCount: snapshot.data.length, // itemcount
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: WeeklyWidget(
                            date: snapshot.data[index].date,
                            month: snapshot.data[index].month,
                            year: snapshot.data[index].year,
                            income: snapshot.data[index].income,
                            expense: snapshot.data[index].expense,
                          ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TransactionsPage()));
                            }
                        );
                      },
                    );
                  }
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                }
              },
            ),
          ),
          // for monthly
          Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: fetchDevices(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print("Error: ${snapshot.error}");
                    return AlertDialog(
                      title: Text(
                        'Devices Cannot Be Loaded',
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        'Error: ${snapshot.error}',
                      ),
                    );
                  } else {
                    return GridView.builder(
                      itemCount: snapshot.data.length, // itemcount
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: MonthlyWidget(
                            date: snapshot.data[index].date,
                            month: snapshot.data[index].month,
                            year: snapshot.data[index].year,
                            income: snapshot.data[index].income,
                            expense: snapshot.data[index].expense,
                          ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TransactionsPage()));
                            }
                        );
                      },
                    );
                  }
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: fetchDevices(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print("Error: ${snapshot.error}");
                    return AlertDialog(
                      title: Text(
                        'Devices Cannot Be Loaded',
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        'Error: ${snapshot.error}',
                      ),
                    );
                  } else {
                    return GridView.builder(
                      itemCount: snapshot.data.length, // itemcount
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: YearlyWidget(
                            date: snapshot.data[index].date,
                            month: snapshot.data[index].month,
                            year: snapshot.data[index].year,
                            income: snapshot.data[index].income,
                            expense: snapshot.data[index].expense,
                          ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TransactionsPage()));
                            }
                        );
                      },
                    );
                  }
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
