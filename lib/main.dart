import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user_provider.dart';
import 'screens/startup.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageUtil.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp>{
  var dateStored = LocalStorageUtil.loadData('date');
  var dateNow = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toString();
  var homeFunc;
  
  @override
  void initState() {
    super.initState();
    if (dateNow == dateStored) {
      homeFunc = homeScreen();
    } else {
      homeFunc = StartupScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homeFunc,
    );
  }

}