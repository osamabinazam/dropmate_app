import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String profilePhoto;
  final String title;
  final String subtitle;
  final String time;
  final bool isRequest;
  final bool isRead;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  NotificationCard({
    required this.profilePhoto,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isRequest = false,
    this.isRead = false,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isRead ? Colors.grey[300] : Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(5),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(profilePhoto),
          radius: 40,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.black)),
            SizedBox(height: 3 ),
            Text(time, style: TextStyle(fontSize: 12, color: Colors.blue)),
          ],
        ),
        trailing: isRequest
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: onAccept,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          textStyle: TextStyle(fontSize: 12),
                        ),
                        child: Text('Accept'),
                      ),
                      SizedBox(width: 4),
                      ElevatedButton(
                        onPressed: onReject,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          textStyle: TextStyle(fontSize: 12),
                        ),
                        child: Text('Reject'),
                      ),
                    ],
                  ),
                ],
              )
            : Icon(
                Icons.circle,
                color: isRead ? Colors.grey : Colors.blue,
                size: 10,
              ),
      ),
    );
  }
}
