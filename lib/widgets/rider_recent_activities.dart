
import 'package:flutter/material.dart';

class RiderRecentActivitiesCard extends StatelessWidget {
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
            
            SizedBox(height: 10),
            Text(
              'Delivered Parcel ID: 67890',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Delivery Time: 1:00 PM',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Drop-off Location: Location D',
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
