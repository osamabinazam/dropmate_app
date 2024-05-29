import 'package:flutter/material.dart';

class UserGreeting extends StatelessWidget {
  final String name;

  UserGreeting({required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              backgroundColor: Colors.blue,
              onBackgroundImageError: (_, __) {
                // Handle image loading error
                // setState(() {});
              },

              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
