import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';
import '../models/user_provider.dart';

class StartupScreen extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  var username = 'john';//readData('username');
  var date = LocalStorageUtil.loadData('date');
  String dateNow = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toString();
  

  @override
  void initState() {
    super.initState();
    LocalStorageUtil.saveData('date', dateNow);
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Welcome back $username',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Today is $dateNow',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ]
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => homeScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
