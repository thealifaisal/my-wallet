import 'package:flutter/material.dart';
import 'package:my_wallet/add-budget-page.dart';
import 'package:my_wallet/budget-page.dart';
import 'package:my_wallet/edit-budget-page.dart';
import 'package:my_wallet/main-dash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyWallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainDashboard(),
    );
  }
}