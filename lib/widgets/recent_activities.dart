import 'package:flutter/material.dart';

class RecentActivitiesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivered by Rider: Jane Smith',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Delivery Time: 1:00 PM',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Status: Delivered',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
