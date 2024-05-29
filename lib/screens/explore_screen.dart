import 'package:dropmate_app/widgets/parcel_dialog.dart';
import 'package:dropmate_app/widgets/rider_card.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for riders',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            RiderCard(
              riderName: 'John Doe',
              riderDetails: 'Rating: 4.5\nLocation: Downtown',
              // riderPhoto: '',
              onBook: () {
                      _showParcelRequestDialog(context);
                },
            ),
            Divider(color: Colors.blue),
          ],
        ),
      ),
    );


  }


  void _showParcelRequestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ParcelRequestDialog();
      },
    );
  }
}