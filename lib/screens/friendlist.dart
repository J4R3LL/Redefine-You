import 'package:flutter/material.dart';

class FriendsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy list of friends for illustration purposes
    final List<String> friends = [
      'Friend 1',
      'Friend 2',
      'Friend 3',
      'Friend 4',
      'Friend 5',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Friends List'),
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(friends[index]),
          );
        },
      ),
    );
  }
}
