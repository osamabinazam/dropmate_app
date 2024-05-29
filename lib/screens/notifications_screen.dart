import 'package:dropmate_app/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final String role;

  NotificationScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    // Sample data
    final List<Map<String, dynamic>> notifications = [
      {
        'profilePhoto': '',
        'title': 'Customer Alice requested a pickup.',
        'subtitle': 'Location: Location A',
        'time': '2 hours ago',
        'isRequest': true,
        'isRead': false,
        'role': 'rider',
      },
      {
        'profilePhoto': '',
        'title': 'Rider John Doe picked up your parcel.',
        'subtitle': 'Pickup Time: 2:00 PM',
        'time': 'about an hour ago',
        'isRequest': false,
        'isRead': false,
        'role': 'customer',
      },
      {
        'profilePhoto': '',
        'title': 'Rider John Doe delivered your parcel.',
        'subtitle': 'Delivery Time: 4:00 PM',
        'time': '30 minutes ago',
        'isRequest': false,
        'isRead': false,
        'role': 'customer',
      },
      // Add more notifications here
    ];

    final filteredNotifications = notifications.where((notification) {
      return notification['role'] == role;
    }).toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: filteredNotifications.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              NotificationCard(
                profilePhoto: filteredNotifications[index]['profilePhoto'],
                title: filteredNotifications[index]['title'],
                subtitle: filteredNotifications[index]['subtitle'],
                time: filteredNotifications[index]['time'],
                isRequest: filteredNotifications[index]['isRequest'],
                isRead: filteredNotifications[index]['isRead'],
                onAccept: filteredNotifications[index]['isRequest']
                    ? () {
                        // Handle accept action
                      }
                    : null,
                onReject: filteredNotifications[index]['isRequest']
                    ? () {
                        // Handle reject action
                      }
                    : null,
              ),
              Divider(color: Colors.grey),
            ],
          );
        },
      ),
    );
  }
}
