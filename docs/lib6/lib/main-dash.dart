import 'package:Wallet/dashboard-page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bargraph1.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  var _curNavIndex = 0;
  var bottomNavbarPages = [
    DashboardPage(),
    BarGraphPage(),
    DashboardPage(),
    DashboardPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (_itemIndex) {
            setState(() {
              _curNavIndex = _itemIndex;
            });
          },
          currentIndex: _curNavIndex,
          iconSize: 20,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.orange,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              title: Text(
                'Transaction',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              icon: Icon(
                FontAwesomeIcons.book,
              ),
            ),
            BottomNavigationBarItem(
                title: Text(
                  'Statistics',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                icon: Icon(
                  FontAwesomeIcons.chartBar,
                )),
            BottomNavigationBarItem(
                title: Text('Budget',
                    style: TextStyle(
                      fontSize: 13,
                    )),
                icon: Icon(
                  Icons.library_add,
                )),
            BottomNavigationBarItem(
                title: Text('Settings',
                    style: TextStyle(
                      fontSize: 13,
                    )),
                icon: Icon(
                  Icons.settings,
                )),
          ],
        ),
        body: bottomNavbarPages[_curNavIndex],
      ),
    ));
  }
}
