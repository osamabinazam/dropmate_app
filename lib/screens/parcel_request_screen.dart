  import 'package:flutter/material.dart';
  import '../widgets/custom_textfield.dart';
  import '../widgets/custom_button.dart';

  class ParcelRequestScreen extends StatefulWidget {
    @override
    _ParcelRequestScreenState createState() => _ParcelRequestScreenState();
  }

  class _ParcelRequestScreenState extends State<ParcelRequestScreen> {
    final _formKey = GlobalKey<FormState>();
    String _size = '', _weight = '', _pickupLocation = '', _dropoffLocation = '', _pickupTimeSlot = '', _dropoffTimeSlot = '';

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Request Parcel Delivery'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  labelText: 'Size',
                  onSaved: (value) => _size = value!,
                ),
                CustomTextField(
                  labelText: 'Weight',
                  onSaved: (value) => _weight = value!,
                ),
                CustomTextField(
                  labelText: 'Pickup Location',
                  onSaved: (value) => _pickupLocation = value!,
                ),
                CustomTextField(
                  labelText: 'Dropoff Location',
                  onSaved: (value) => _dropoffLocation = value!,
                ),
                CustomTextField(
                  labelText: 'Pickup Time Slot',
                  onSaved: (value) => _pickupTimeSlot = value!,
                ),
                CustomTextField(
                  labelText: 'Dropoff Time Slot',
                  onSaved: (value) => _dropoffTimeSlot = value!,
                ),
                CustomButton(
                  text: 'Request Delivery',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Handle parcel request logic
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
