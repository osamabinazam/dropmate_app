class RatingModel {
  final String id;
  final String riderId;
  final String customerId;
  final double rating;
  final String review;

  RatingModel({
    required this.id,
    required this.riderId,
    required this.customerId,
    required this.rating,
    required this.review,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      id: json['id'],
      riderId: json['rider_id'],
      customerId: json['customer_id'],
      rating: json['rating'],
      review: json['review'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rider_id': riderId,
      'customer_id': customerId,
      'rating': rating,
      'review': review,
    };
  }
}
