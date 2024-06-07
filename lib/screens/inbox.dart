import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/custom_button.dart';

class inboxScreen extends StatefulWidget {
  const inboxScreen({super.key, String? username, });
  @override
  State<inboxScreen> createState() => Inboxpage();
}

class Inboxpage extends State<inboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
      ),
      body: Center(
        child: Text('Bottom App Bar with Multiple Buttons'),
      ),
      bottomNavigationBar: bottomNavigationBar()
    );
  }
}