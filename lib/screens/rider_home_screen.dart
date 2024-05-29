import 'package:dropmate_app/widgets/rider_recent_activities.dart';
import 'package:flutter/material.dart';
import '../widgets/rider_greeting.dart';
import '../widgets/rider_delivery_card.dart';

class RiderHomeContent extends StatelessWidget {
  const RiderHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RiderGreeting(name: 'John Doe'), // Replace with actual rider's name
              Divider(color: Colors.blue),
              SizedBox(height: 20),
              RiderDeliveryCard(),
              Divider(color: Colors.blue),
              SizedBox(height: 20),
              Text(
                'Recent Activities',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              RiderRecentActivitiesCard(),
              Divider(color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
