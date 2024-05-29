import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/parcel_model.dart';
import 'api_service.dart';

class ParcelService {
  static Future<List<ParcelModel>> getParcels() async {
    final response = await ApiService.get('parcels/');

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<ParcelModel> parcels = body.map((dynamic item) => ParcelModel.fromJson(item)).toList();
      return parcels;
    } else {
      // Handle error
      return [];
    }
  }

  static Future<ParcelModel?> createParcel(ParcelModel parcel) async {
    final response = await ApiService.post('parcels/', parcel.toJson());

    if (response.statusCode == 201) {
      return ParcelModel.fromJson(json.decode(response.body));
    } else {
      // Handle error
      return null;
    }
  }
}
