import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class ParcelRequestDialog extends StatefulWidget {
  @override
  _ParcelRequestDialogState createState() => _ParcelRequestDialogState();
}

class _ParcelRequestDialogState extends State<ParcelRequestDialog> {
  final _formKey = GlobalKey<FormState>();
  String _size = '', _weight = '', _pickupLocation = '', _dropoffLocation = '', _pickupTimeSlot = '', _dropoffTimeSlot = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Set the rounded corners here
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), // Apply the same border radius here
          color: Colors.blue
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Request Parcel Delivery',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Update to match your app's primary color
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Size',
                onSaved: (value) => _size = value!,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Weight',
                onSaved: (value) => _weight = value!,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Pickup Location',
                onSaved: (value) => _pickupLocation = value!,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Dropoff Location',
                onSaved: (value) => _dropoffLocation = value!,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Pickup Time Slot',
                onSaved: (value) => _pickupTimeSlot = value!,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Dropoff Time Slot',
                onSaved: (value) => _dropoffTimeSlot = value!,
              ),
              SizedBox(height: 20),
    
              CustomButton(
                text: 'Request Delivery',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle parcel request logic
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
