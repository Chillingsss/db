import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Dashboard!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Card(
              elevation: 5.0,
              child: ListTile(
                title: Text('Feature 1'),
                subtitle: Text('Description of Feature 1'),
                leading: Icon(
                    Icons.featured_play_list), // Replace with the actual icon
                onTap: () {
                  // Handle the tap on Feature 1
                },
              ),
            ),
            SizedBox(height: 10.0),
            Card(
              elevation: 5.0,
              child: ListTile(
                title: Text('Feature 2'),
                subtitle: Text('Description of Feature 2'),
                leading: Icon(Icons
                    .featured_play_list_rounded), // Replace with the actual icon
                onTap: () {
                  // Handle the tap on Feature 2
                },
              ),
            ),
            // Add more cards for additional features
          ],
        ),
      ),
    );
  }
}
