import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'health_workers/login.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.0),
            Text(
              'General Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32.0),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
