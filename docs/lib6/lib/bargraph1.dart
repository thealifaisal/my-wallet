import 'package:flutter/material.dart';
//import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

var exp = [1500, 2500];
var inc = [2000, 3000];

class BarGraphPage extends StatefulWidget {
  @override
  _BarGraphPageState createState() => _BarGraphPageState();
}

class _BarGraphPageState extends State<BarGraphPage> {
  double balance = 50740;
  List<String> currency_list = ['PKR', 'USD', 'EURO'];
  String currency;
  String curr_cur = 'PKR';

  var pkrusd = 160.63;
  var pkreuro = 195.31;
  var usdeuro = 1.22;

  List<charts.Series<Task, String>> barData;
  _generateData() {
    var data1 = [
      new Task("Income", "Oct", inc[0], Colors.orange),
      new Task("Income", "Nov", inc[1], Colors.orange)
    ];
    var data2 = [
      new Task("Expense", "Nov", exp[0], Colors.blue),
      new Task("Expense", "Oct", exp[1], Colors.blue)
    ];

    barData.add(charts.Series(
      domainFn: (Task task, _) => task.month,
      measureFn: (Task task, _) => task.amount,
      id: "Income",
      colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.colval),
      data: data1,
    ));

    barData.add(charts.Series(
      domainFn: (Task task, _) => task.month,
      measureFn: (Task task, _) => task.amount,
      id: "Expense",
      colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.colval),
      data: data2,
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    barData = List<charts.Series<Task, String>>();
    _generateData();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return (new Scaffold(
        appBar: AppBar(
          title: Text("MyWallet"),
          backgroundColor: Colors.orange,
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "Nov 2020",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            IconButton(
                icon: Icon(Icons.calendar_today),
                color: Colors.white,
                onPressed: null),
            IconButton(
                icon: Icon(Icons.access_alarm),
                color: Colors.white,
                onPressed: null)
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 14, 0, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                    child: Text(
                      "Balance",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                            onChanged: (String val) {
                              setState(() {
                                balance = convert(balance, curr_cur, val);
                                curr_cur = val;
                                this.currency = val;
                              });
                            },
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
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 24, 0, 20),
              child: Text(
                "$curr_cur \t${balance.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 30, color: Colors.orange),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 40, 0, 10),
              child: Text(
                "Income & Expense in PKR",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 30),
              child: Row(children: <Widget>[
                Container(
                  height: 10,
                  width: 10,
                  color: Colors.orange,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text("Income"),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  height: 10,
                  width: 10,
                  color: Colors.blue,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text("Expense"),
                )
              ]),
            ),
            Container(
              height: 300,
              child: Expanded(
                child: charts.BarChart(
                  barData,
                  animate: true,
                  barGroupingType: charts.BarGroupingType.grouped,
                  animationDuration: Duration(seconds: 1),
                ),
              ),
            )
          ],
        )));
  }
}

class Task {
  String month;
  String inexp;
  int amount;
  Color colval;

  Task(this.inexp, this.month, this.amount, this.colval);
}

double convert(double bal, String precur, String newcur) {
  double pkrusd = 160.63;
  double pkreuro = 195.31;
  double usdeuro = 0.82;

  double res;

  if (precur == 'PKR' && newcur == 'USD') {
    bal = bal / pkrusd;
  } else if (precur == 'USD' && newcur == 'PKR') {
    bal = bal * pkrusd;
  } else if (precur == 'USD' && newcur == 'EURO') {
    bal = bal * usdeuro;
  } else if (precur == 'EURO' && newcur == 'USD') {
    bal = bal / usdeuro;
  } else if (precur == 'EURO' && newcur == 'PKR') {
    bal = bal * pkreuro;
  } else if (precur == 'PKR' && newcur == 'EURO') {
    bal = bal / pkreuro;
  }
  print("$bal");
  return bal;
}
