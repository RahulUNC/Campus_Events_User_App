import 'package:flutter/material.dart';
import './organization.dart';

class bottomNavBar extends StatelessWidget {
  
  int curIndex;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new BottomNavigationBar(
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(            
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Organizations'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
        ],
      );
  }
}