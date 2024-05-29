class DeliveryRequestModel {
  final String id;
  final String parcelId;
  final String customerId;
  final String riderId;
  final String pickupTime;
  final String dropoffTime;
  final String status;

  DeliveryRequestModel({
    required this.id,
    required this.parcelId,
    required this.customerId,
    required this.riderId,
    required this.pickupTime,
    required this.dropoffTime,
    required this.status,
  });

  factory DeliveryRequestModel.fromJson(Map<String, dynamic> json) {
    return DeliveryRequestModel(
      id: json['id'],
      parcelId: json['parcel_id'],
      customerId: json['customer_id'],
      riderId: json['rider_id'],
      pickupTime: json['pickup_time'],
      dropoffTime: json['dropoff_time'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parcel_id': parcelId,
      'customer_id': customerId,
      'rider_id': riderId,
      'pickup_time': pickupTime,
      'dropoff_time': dropoffTime,
      'status': status,
    };
  }
}
