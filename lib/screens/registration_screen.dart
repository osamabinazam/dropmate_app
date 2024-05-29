import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import '../services/auth_service.dart';
import '../routes/app_routes.dart';
import '../utils/validators.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '', _email = '', _password = '', _phoneNumber = '', _address = '', _role = 'customer';
  File? _profilePhoto;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profilePhoto = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/signup_ils.png',
                  height: 150,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Create an Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: 'Name',
                      onSaved: (value) => _name = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Email',
                      onSaved: (value) => _email = value!,
                      validator: (value) => Validators.validateEmail(value),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Password',
                      obscureText: true,
                      onSaved: (value) => _password = value!,
                      validator: (value) => Validators.validatePassword(value),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Phone Number',
                      onSaved: (value) => _phoneNumber = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Address',
                      onSaved: (value) => _address = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    // SizedBox(height: 20),
                    // GestureDetector(
                    //   onTap: _pickImage,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.white.withOpacity(0.3),
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           'Profile Photo',
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //         SizedBox(height: 8),
                    //         _profilePhoto == null
                    //             ? Text(
                    //                 'No photo selected',
                    //                 style: TextStyle(color: Colors.white),
                    //               )
                    //             : Image.file(
                    //                 _profilePhoto!,
                    //                 height: 100,
                    //                 width: 100,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    
                    
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Role',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'customer',
                                groupValue: _role,
                                onChanged: (value) {
                                  setState(() {
                                    _role = value!;
                                  });
                                },
                              ),
                              Text(
                                'Customer',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 20),
                              Radio<String>(
                                value: 'rider',
                                groupValue: _role,
                                onChanged: (value) {
                                  setState(() {
                                    _role = value!;
                                  });
                                },
                              ),
                              Text(
                                'Rider',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      text: 'Register',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          AuthService.register(
                            _name,
                            _email,
                            _password,
                            _phoneNumber,
                            _address,
                            _role,
                            _profilePhoto,
                          ).then((user) {
                            if (user != null) {
                              Navigator.pushReplacementNamed(context, AppRoutes.login);
                            } else {
                              // Handle registration error
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Registration failed. Please try again.')),
                              );
                            }
                          });
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.login);
                      },
                      child: Text(
                        'Already have an account? Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
