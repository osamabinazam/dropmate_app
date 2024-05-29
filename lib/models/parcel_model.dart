class ParcelModel {
  final String id;
  final String customerId;
  final String size;
  final double weight;
  final String pickupLocation;
  final String dropoffLocation;
  final String pickupTimeSlot;
  final String dropoffTimeSlot;
  final String status;

  ParcelModel({
    required this.id,
    required this.customerId,
    required this.size,
    required this.weight,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupTimeSlot,
    required this.dropoffTimeSlot,
    required this.status,
  });

  factory ParcelModel.fromJson(Map<String, dynamic> json) {
    return ParcelModel(
      id: json['id'],
      customerId: json['customer_id'],
      size: json['size'],
      weight: json['weight'],
      pickupLocation: json['pickup_location'],
      dropoffLocation: json['dropoff_location'],
      pickupTimeSlot: json['pickup_time_slot'],
      dropoffTimeSlot: json['dropoff_time_slot'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_id': customerId,
      'size': size,
      'weight': weight,
      'pickup_location': pickupLocation,
      'dropoff_location': dropoffLocation,
      'pickup_time_slot': pickupTimeSlot,
      'dropoff_time_slot': dropoffTimeSlot,
      'status': status,
    };
  }
}
