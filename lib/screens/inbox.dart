import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/custom_button.dart';

class inboxScreen extends StatefulWidget {
  const inboxScreen({super.key, String? username, });
  @override
  State<inboxScreen> createState() => Inboxpage();
}

class Inboxpage extends State<inboxScreen> {
   final List<String> friends = [
      'Friend 1',
      'Friend 2',
      'Friend 3',
      'Friend 4',
      'Friend 5',
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
      ),
       body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(friends[index]),
          );
        },
      ),
      bottomNavigationBar: bottomNavigationBar()
    );
  }
}