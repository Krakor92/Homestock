import 'dart:developer';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Container(color: Colors.blue,),
    Container(color: Colors.red,),
    Container(color: Colors.green,),
    Container(color: Colors.grey,),
  ];

  List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.all_inbox),
      label: 'Stock'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.restaurant),
      label: 'Meals'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Shopping'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homestock')
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _barItems,
      ),

    );
  }

  void onTabTapped(int tabIndex) {
    setState(() {
      log(_barItems[_currentIndex].icon.toString());
      if (tabIndex == 1 && _currentIndex == 1)
      {
        //Si l'icone est les couverts:
        if (_barItems[1].icon.toString() == "Icon(IconData(U+0E988))") {
          final barItem = BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Meals'
          );
          _barItems.insert(1, barItem);
        } else {
          final barItem = BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Meals'
          );
          _barItems.insert(1, barItem);
        }
        _barItems.removeAt(2);
      }
      _currentIndex = tabIndex;
    });
  }
}