import 'package:flutter/material.dart';

class DeliveryRequestListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data
    final List<Map<String, String>> deliveryRequests = [
      {
        'parcelId': '1',
        'status': 'Pending',
        'pickupLocation': 'Location A',
        'dropoffLocation': 'Location B',
      },
      // Add more delivery requests here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Requests'),
      ),
      body: ListView.builder(
        itemCount: deliveryRequests.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Parcel ID: ${deliveryRequests[index]['parcelId']}'),
            subtitle: Text('Status: ${deliveryRequests[index]['status']}'),
            trailing: Text('From: ${deliveryRequests[index]['pickupLocation']} To: ${deliveryRequests[index]['dropoffLocation']}'),
          );
        },
      ),
    );
  }
}
