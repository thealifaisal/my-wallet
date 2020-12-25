import 'package:flutter/material.dart';

class MonthlyWidget extends StatefulWidget {
  int date;
  String month, year;
  double income, expense;
  List months = [];
  MonthlyWidget({this.date, this.month, this.year, this.income, this.expense});

  @override
  MonthlyWidgetState createState() => MonthlyWidgetState();
}

class MonthlyWidgetState extends State<MonthlyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
        child: Material(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.black12,
            ),
          ),
          type: MaterialType.card,
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: GridTile(
                header: Container(
                  height: 50,
                  decoration: new BoxDecoration(
                    color: Color(0xFFFEAB1B),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "${widget.month[0] + widget.month[1] + widget.month[2]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.8,
                    ),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "${widget.year}",
                    style: TextStyle(fontSize: 17),
                  ),
                  color: Colors.white,
                  height: 65,
                  width: 65,
                ),
                footer: Container(
                  color: Colors.grey[100],
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text(
                            "Expense:   ${widget.income}",
                            style: TextStyle(color: Colors.blue, fontSize: 14),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text(
                            "Income:    ${widget.expense}",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }
}
