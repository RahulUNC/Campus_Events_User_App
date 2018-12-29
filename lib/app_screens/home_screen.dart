import 'package:flutter/material.dart';
import './organization.dart';
import './bottom_nav.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus Events'),
        backgroundColor: Colors.red,
        ),
      body: organizationBuilder(),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}