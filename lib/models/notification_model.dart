class NotificationModel {
  final String id;
  final String userId;
  final String message;
  final String type;
  final String status;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.message,
    required this.type,
    required this.status,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      userId: json['user_id'],
      message: json['message'],
      type: json['type'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'message': message,
      'type': type,
      'status': status,
    };
  }
}
