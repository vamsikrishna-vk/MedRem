import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'emergency.dart';
import 'profile.dart';

var currDt = DateTime.now();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedRem',
      home: Home1(),
    );
  }
}

class Home1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home1> {
  int _index = 0;
  final List<Widget> _children = [
    Home(),
    Emergency(),
    Profile(),
  ];
  Widget build(BuildContext context1) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6200EE),
        title: Text("MEDREM"),
        centerTitle: true,
      ),
      body: _children[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: onTabTapped,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Emergency'),
            icon: Icon(Icons.warning),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    ));
  }

  void onTabTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
