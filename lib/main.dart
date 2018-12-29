import 'package:flutter/material.dart';
import 'app_screens/home_screen.dart';

void main() => runApp(CampusEvents());

class CampusEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "Campus Events",
    home: homeScreen(),
  );
  }
}
