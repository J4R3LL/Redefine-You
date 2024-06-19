import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/custom_button.dart';
import '../screens/settings.dart';


class accountScreen extends StatefulWidget {
  const accountScreen({super.key, String? username, });
  @override
  State<accountScreen> createState() => Accountpage();
}

class Accountpage extends State<accountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // User's profile picture
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _bioController,
              decoration: InputDecoration(
                labelText: 'Bio',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to save profile changes
                setState(() {
                  // Update the UI or save the changes to a backend
                });
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
       bottomNavigationBar:bottomNavigationBar()
    );
  }
}