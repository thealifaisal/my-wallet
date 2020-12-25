import 'package:flutter/material.dart';

class DeviceWidget extends StatefulWidget {
  int date;
  String month, year;
  double income, expense;

  DeviceWidget({this.date, this.month, this.year, this.income, this.expense});

  @override
  DeviceWidgetState createState() => DeviceWidgetState();
}

class DeviceWidgetState extends State<DeviceWidget> {
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
                height: 48,
                decoration: new BoxDecoration(
                  color: Color(0xFFFEAB1B),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "${widget.date}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      height: 1.6,
                      fontWeight: FontWeight.bold),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "${widget.month}, ${widget.year}",
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
//                    color: Colors.grey[100],
                        alignment: Alignment.center,
                        child: Text(
                          "Expense:   ${widget.income}",
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        ),
                      ),
                      Container(
//                      color: Colors.grey[100],
                        alignment: Alignment.center,
                        child: Text(
                          "Income:    ${widget.expense}",
                          style: TextStyle(color: Colors.orange, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
