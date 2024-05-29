import 'package:flutter/material.dart';

class DeliveryRequestCard extends StatelessWidget {
  final String parcelId;
  final String status;
  final String pickupLocation;
  final String dropoffLocation;
  final String customerName;
  final bool isRequest;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  DeliveryRequestCard({ 
    required this.parcelId,
    required this.status,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.customerName,
    this.isRequest = false,
    this.onAccept,
    this.onReject,
  });

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer: $customerName',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Status: $status', style: TextStyle(fontSize: 16)),
                  Text('From: $pickupLocation', style: TextStyle(fontSize: 16)),
                  Text('To: $dropoffLocation', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            if (isRequest) ...[
              ElevatedButton(
                onPressed: onAccept,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Accept'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: onReject,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Reject'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
