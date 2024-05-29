class CustomerModel {
  final String id;
  final String userId;
  final String defaultPickupLocation;
  final String defaultDropoffLocation;

  CustomerModel({
    required this.id,
    required this.userId,
    required this.defaultPickupLocation,
    required this.defaultDropoffLocation,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      userId: json['user_id'],
      defaultPickupLocation: json['default_pickup_location'],
      defaultDropoffLocation: json['default_dropoff_location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'default_pickup_location': defaultPickupLocation,
      'default_dropoff_location': defaultDropoffLocation,
    };
  }
}
