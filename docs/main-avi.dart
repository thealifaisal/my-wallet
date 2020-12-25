import 'package:Wallet/dashboard-page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MainDashboard());
}

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  var _curNavIndex = 0;

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
                  Icons.calendar_today,
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
                  size: 25.0,
                ),
              ))
        ],
        bottom: TabBar(
          indicatorColor: Colors.orangeAccent,
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (_itemIndex) {
          setState(() {
            _curNavIndex = _itemIndex;
          });
        },
        currentIndex: _curNavIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.orange,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Text('TRANS.'),
            icon: Icon(
              Icons.access_alarm,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
              title: Text('STATS'),
              icon: Icon(
                Icons.accessible_forward,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              title: Text('BUDGETS'),
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              title: Text('SETTINGS'),
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
              )),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: null,
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: DashboardPage(),
    );
  }
}
