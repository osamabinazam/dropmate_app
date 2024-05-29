class RiderModel {
  final String id;
  final String userId;
  final String vehicleType;
  final String licensePlateNumber;
  final bool availabilityStatus;
  final double ratings;

  RiderModel({
    required this.id,
    required this.userId,
    required this.vehicleType,
    required this.licensePlateNumber,
    required this.availabilityStatus,
    required this.ratings,
  });

  factory RiderModel.fromJson(Map<String, dynamic> json) {
    return RiderModel(
      id: json['id'],
      userId: json['user_id'],
      vehicleType: json['vehicle_type'],
      licensePlateNumber: json['license_plate_number'],
      availabilityStatus: json['availability_status'],
      ratings: json['ratings'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'vehicle_type': vehicleType,
      'license_plate_number': licensePlateNumber,
      'availability_status': availabilityStatus,
      'ratings': ratings,
    };
  }
}
