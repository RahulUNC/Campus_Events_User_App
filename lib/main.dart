import 'package:flutter/material.dart';
import 'app_screens/home_screen.dart';
import './app_screens/organization.dart';
import './app_screens/bottom_nav.dart';
import './app_screens/search_screen.dart';
import './app_screens/all_organization_screen.dart';

void main() => runApp(campusRunner());

class campusRunner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CampusEvent();
  } 
}

class CampusEvent extends State<campusRunner> {
  int selectedPage = 0;
  final pageOptions = [
    organizationBuilder(),
    allOrganizations(),
    Text('test3')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "Campus Events",
    home:  Scaffold(
    appBar: AppBar(
      title: Text('Campus Events'),
      backgroundColor: Colors.red,
      ),
      body: pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
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
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
        ],
      )
  ),);
  }
}
