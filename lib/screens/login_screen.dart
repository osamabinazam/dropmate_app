import 'package:dropmate_app/utils/validators.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import '../services/auth_service.dart';
import '../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';

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
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(12), // Adjust the value as needed
                child: Image.asset(
                  'assets/images/login_ils.jpeg',
                  height: 250,
                  width: 300,
                  fit: BoxFit
                      .cover, // This ensures the image covers the entire area
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Welcome Back!',
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
                    SizedBox(height: 30),
                    CustomButton(
                      text: 'Login',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          AuthService.login(_email, _password).then((user) {
                            if (user != null) {
                              if (user.role == 'customer') {
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.home,
                                    arguments: user);
                              } else if (user.role == 'rider') {
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.home,
                                    arguments: user);
                              }
                            } else {
                              // Handle login error
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Login failed. Please try again.')),
                              );
                            }
                          });
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.register);
                      },
                      child: Text(
                        'Don\'t have an account? Register',
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
