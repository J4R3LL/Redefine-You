import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/custom_button.dart';

class socialScreen extends StatefulWidget {
  const socialScreen({super.key, String? username, });
  @override
  State<socialScreen> createState() => Socialpage();
}

class Socialpage extends State<socialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social'),
      ),
      body: Center(
        child: Text('Bottom App Bar with Multiple Buttons'),
      ),
      bottomNavigationBar: bottomNavigationBar()
    );
  }
}