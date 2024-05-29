import 'package:flutter/material.dart';

class DeliveryCard extends StatelessWidget {
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
              'Your Current Delivery',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Rider: John Doe',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Pickup Time: 2:00 PM',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Status: In Transit',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
