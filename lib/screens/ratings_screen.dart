import 'package:flutter/material.dart';

class RatingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data
    final List<Map<String, String>> ratings = [
      {'rider': 'Rider A', 'rating': '4.5', 'review': 'Great service!'},
      {'rider': 'Rider B', 'rating': '3.0', 'review': 'Average experience.'},
      // Add more ratings here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Ratings'),
      ),
      body: ListView.builder(
        itemCount: ratings.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Rider: ${ratings[index]['rider']}'),
            subtitle: Text('Rating: ${ratings[index]['rating']}'),
            trailing: Text(ratings[index]['review']!),
          );
        },
      ),
    );
  }
}
