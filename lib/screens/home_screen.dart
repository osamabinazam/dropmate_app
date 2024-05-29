import 'package:dropmate_app/screens/explore_screen.dart';
import 'package:dropmate_app/screens/notifications_screen.dart';
import 'package:dropmate_app/screens/rider_home_screen.dart';
import 'package:dropmate_app/widgets/recent_activities.dart';
import 'package:flutter/material.dart';
import '../widgets/user_greeting.dart';
import '../widgets/delivery_card.dart';
import '../routes/app_routes.dart';
import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final String role;

  HomeScreen({required this.name, required this.role});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<String> _titlesForCustomer = [
    'Home',
    'Explore',
    'Notifications',
    'Settings',
  ];

  static const List<String> _titlesForRider = [
    'Home',
    'Notifications',
    'Settings',
  ];

  List<Widget> _widgetOptionsForCustomer(String role) => <Widget>[
        HomeContent(),
        ExploreScreen(),
        NotificationScreen(role: role),
        SettingsContent(),
      ];

  List<Widget> _widgetOptionsForRider(String role) => <Widget>[
        RiderHomeContent(),
        NotificationScreen(role: role),
        SettingsContent(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleMenuItem(String value) {
    final user = UserModel(
      userId: '1', // Dummy data, replace with actual data
      name: widget.name,
      email: 'example@example.com',
      passwordHash: '',
      phoneNumber: '1234567890',
      address: '123 Main St',
      role: widget.role,
      profilePhoto: '',
    );

    switch (value) {
      case 'Profile':
        Navigator.pushNamed(context, AppRoutes.profile, arguments: user);
        break;
      case 'Settings':
        setState(() {
          _selectedIndex = 2;
        });
        break;
      case 'Logout':
        Navigator.pushReplacementNamed(context, AppRoutes.login);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRider = widget.role == 'rider';
    final _widgetOptions = isRider
        ? _widgetOptionsForRider(widget.role)
        : _widgetOptionsForCustomer(widget.role);
    final _titles = isRider ? _titlesForRider : _titlesForCustomer;
    final _navigationItems = isRider
        ? [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Colors.white),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              label: 'Settings',
            ),
          ]
        : [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore, color: Colors.white),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Colors.white),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              label: 'Settings',
            ),
          ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 28),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: _handleMenuItem,
            color: Colors.blue, // Set the background color to blue
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Settings', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Row(
                    children: [
                      Icon(
                        choice == 'Profile'
                            ? Icons.person
                            : choice == 'Settings'
                                ? Icons.settings
                                : Icons.logout,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        choice,
                        style: TextStyle(
                            color: Colors.white), // Set text color to white
                      ),
                    ],
                  ),
                );
              }).toList();
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
        backgroundColor: Colors.blue,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserGreeting(name: 'John Doe'),
              Divider(color: Colors.blue),
              SizedBox(height: 20),
              DeliveryCard(),
              Divider(color: Colors.blue),
              SizedBox(height: 20),
              Text(
                'Recent Activities',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              RecentActivitiesCard(),
              Divider(color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
