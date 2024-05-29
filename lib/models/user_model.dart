class UserModel {
  final String userId;
  final String name;
  final String email;
  final String passwordHash;
  final String phoneNumber;
  final String address;
  final String role;
  final String profilePhoto;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.passwordHash,
    required this.phoneNumber,
    required this.address,
    required this.role,
    required this.profilePhoto,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      name: json['name'],
      email: json['email'],
      passwordHash: json['password_hash'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      role: json['role'],
      profilePhoto: json['profile_photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'email': email,
      'password_hash': passwordHash,
      'phone_number': phoneNumber,
      'address': address,
      'role': role,
      'profile_photo': profilePhoto,
    };
  }
}
