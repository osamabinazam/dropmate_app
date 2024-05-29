import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/notification_model.dart';
import 'api_service.dart';

class NotificationService {
  static Future<List<NotificationModel>> getNotifications() async {
    final response = await ApiService.get('notifications/');

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<NotificationModel> notifications = body.map((dynamic item) => NotificationModel.fromJson(item)).toList();
      return notifications;
    } else {
      // Handle error
      return [];
    }
  }
}
