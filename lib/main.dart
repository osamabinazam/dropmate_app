import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/parcel_request_screen.dart';
import 'screens/delivery_request_list_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/ratings_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/home_screen.dart';
import 'routes/app_routes.dart';
import 'models/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DropMate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => SplashScreen(),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.register: (context) => RegistrationScreen(),
        AppRoutes.parcelRequest: (context) => ParcelRequestScreen(),
        AppRoutes.deliveryRequests: (context) => DeliveryRequestListScreen(),
        AppRoutes.notifications: (context) => NotificationScreen(role: 'customer'),
        AppRoutes.ratings: (context) => RatingsScreen(),
        AppRoutes.profile: (context) => ProfileScreen(
          user: ModalRoute.of(context)!.settings.arguments as UserModel,
        ),
        AppRoutes.home: (context) {
          final user = ModalRoute.of(context)!.settings.arguments as UserModel;
          return HomeScreen(name: user.name, role: user.role);
        },
      },
    );
  }
}
