import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {

  String name, amount;
  IconData leading_icon;

  TransactionWidget({@required this.name, @required this.amount, @required this.leading_icon});

  @override
  Widget build(BuildContext context) {
    return Material(
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
              this.leading_icon,
              size: 35,
              color: Colors.orange,
            ),
            title: Text(
              this.name,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: Text(
              "\$ "+this.amount,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
