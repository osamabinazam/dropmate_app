import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/delivery_request_model.dart';
import 'api_service.dart';

class DeliveryService {
  static Future<List<DeliveryRequestModel>> getDeliveryRequests() async {
    final response = await ApiService.get('delivery-requests/');

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<DeliveryRequestModel> requests = body.map((dynamic item) => DeliveryRequestModel.fromJson(item)).toList();
      return requests;
    } else {
      // Handle error
      return [];
    }
  }

  static Future<DeliveryRequestModel?> createDeliveryRequest(DeliveryRequestModel request) async {
    final response = await ApiService.post('delivery-requests/', request.toJson());

    if (response.statusCode == 201) {
      return DeliveryRequestModel.fromJson(json.decode(response.body));
    } else {
      // Handle error
      return null;
    }
  }
}
