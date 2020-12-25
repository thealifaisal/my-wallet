import 'package:Wallet/TransactionsPage.dart';
import 'package:Wallet/custom_widgets/device-widget.dart'; // make custom widget folder in lib
import 'package:flutter/material.dart';
import 'addTransaction.dart';
import 'classes/device.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_widgets/monthly-widget.dart';
import 'custom_widgets/weekly_widget.dart';
import 'custom_widgets/yearly-widget.dart';

// This page shows devices connected
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // fetch devices
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
        backgroundColor: Colors.orangeAccent,
        title: Text('MyWallet'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  FontAwesomeIcons.calendarDay,
                  color: Colors.white,
                  size: 25.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 28,
                ),
              ))
        ],
        bottom: TabBar(
          indicatorColor: Colors.orangeAccent,
          indicatorWeight: 2.5,
          tabs: [
            Tab(
              child: Text(
                "DAILY",
                style: TextStyle(fontSize: 12.5),
              ),
            ),
            Tab(
              child: Text(
                "WEEKLY",
                style: TextStyle(fontSize: 12.5),
              ),
            ),
            Tab(
              child: Text(
                "MONTHLY",
                style: TextStyle(fontSize: 12.5),
              ),
            ),
            Tab(
              child: Text(
                "YEARLY",
                style: TextStyle(fontSize: 12.5),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        // add button for transaction

        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
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
                            child: DeviceWidget(
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
                            });
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
                        return WeeklyWidget(
                          date: snapshot.data[index].date,
                          month: snapshot.data[index].month,
                          year: snapshot.data[index].year,
                          income: snapshot.data[index].income,
                          expense: snapshot.data[index].expense,
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
                        return MonthlyWidget(
                          date: snapshot.data[index].date,
                          month: snapshot.data[index].month,
                          year: snapshot.data[index].year,
                          income: snapshot.data[index].income,
                          expense: snapshot.data[index].expense,
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
                        return YearlyWidget(
                          date: snapshot.data[index].date,
                          month: snapshot.data[index].month,
                          year: snapshot.data[index].year,
                          income: snapshot.data[index].income,
                          expense: snapshot.data[index].expense,
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
      ), // tabbarview
    );
  }
}
