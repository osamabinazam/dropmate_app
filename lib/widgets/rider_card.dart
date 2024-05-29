import 'package:flutter/material.dart';

class RiderCard extends StatelessWidget {
  final String riderName;
  final String riderDetails;
  final String? riderPhoto;
  final VoidCallback onBook;

  RiderCard({
    required this.riderName,
    required this.riderDetails,
    this.riderPhoto,
    required this.onBook,
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
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: riderPhoto != null
                  ? NetworkImage(riderPhoto!)
                  : null,
              child: riderPhoto == null
                  ? Icon(Icons.person, size: 30, color: Colors.white)
                  : null,
              backgroundColor: riderPhoto == null ? Colors.blue : null,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    riderName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    riderDetails,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: onBook,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Book Rider'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
