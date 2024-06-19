import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/custom_button.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Account Settings Section
          ListTile(
            title: Text('Account Settings'),
            subtitle: Text('Change your account details'),
            leading: Icon(Icons.account_circle),
            onTap: () {
              // Navigate to account settings page
            },
          ),
          Divider(),
          
          // Notifications Settings Section
          ListTile(
            title: Text('Notifications'),
            subtitle: Text('Manage your notification preferences'),
            leading: Icon(Icons.notifications),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          Divider(),
          
          // Privacy Settings Section
          ListTile(
            title: Text('Privacy'),
            subtitle: Text('Manage your privacy settings'),
            leading: Icon(Icons.lock),
            onTap: () {
              // Navigate to privacy settings page
            },
          ),
          Divider(),
          
          // App Preferences Section
          ListTile(
            title: Text('Dark Mode'),
            subtitle: Text('Enable or disable dark mode'),
            leading: Icon(Icons.brightness_6),
            trailing: Switch(
              value: _darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _darkModeEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Language'),
            subtitle: Text('Select your preferred language'),
            leading: Icon(Icons.language),
            onTap: () {
              // Show language selection dialog
            },
          ),
          Divider(),
          
          // Support and About Section
          ListTile(
            title: Text('Help & Feedback'),
            subtitle: Text('Get help or provide feedback'),
            leading: Icon(Icons.help),
            onTap: () {
              // Navigate to help and feedback page
            },
          ),
          ListTile(
            title: Text('About'),
            subtitle: Text('Learn more about the app'),
            leading: Icon(Icons.info),
            onTap: () {
              // Navigate to about page
            },
          ),
        ],
      ),
     bottomNavigationBar:bottomNavigationBar()   
    );
  }
}
