import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/custom_button.dart';


class accountScreen extends StatefulWidget {
  const accountScreen({super.key, String? username, });
  @override
  State<accountScreen> createState() => Accountpage();
}

class Accountpage extends State<accountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Center(
        child: Text('Bottom App Bar with Multiple Buttons'),
      ),
      bottomNavigationBar: bottomNavigationBar()
    );
  }
}