import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import 'api_service.dart';

class AuthService {
  static final List<UserModel> _dummyUsers = [
    UserModel(
      userId: '1',
      name: 'Customer User',
      email: 'customer@example.com',
      passwordHash: 'password123',
      phoneNumber: '1234567890',
      address: 'Customer Address',
      role: 'customer',
      profilePhoto: '',
    ),
    UserModel(
      userId: '2',
      name: 'Rider User',
      email: 'rider@example.com',
      passwordHash: 'password123',
      phoneNumber: '0987654321',
      address: 'Rider Address',
      role: 'rider',
      profilePhoto: '',
    ),
  ];

  static Future<UserModel?> register(
      String name, String email, String password, String phoneNumber, String address, String role, File? profilePhoto) async {
    var request = http.MultipartRequest('POST', Uri.parse(''));

    request.fields['username'] = email;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['phone_number'] = phoneNumber;
    request.fields['address'] = address;
    request.fields['role'] = role;
    request.fields['name'] = name;

    if (profilePhoto != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'profile_photo',
          profilePhoto.path,
        ),
      );
    }

    var response = await request.send();

    if (response.statusCode == 201) {
      var responseData = await http.Response.fromStream(response);
      return UserModel.fromJson(jsonDecode(responseData.body));
    } else {
      return null;
    }
  }

  static Future<UserModel?> login(String email, String password) async {
    // Simulate login with dummy data
    final user = _dummyUsers.firstWhere(
        (user) => user.email == email && user.passwordHash == password,
        orElse: () => UserModel(
              userId: '',
              name: '',
              email: '',
              passwordHash: '',
              phoneNumber: '',
              address: '',
              role: '',
              profilePhoto: '',
            ));

    if (user != null) {
      return Future.value(user);
    } else {
      return Future.value(null);
    }
  }
}
