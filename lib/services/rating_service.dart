import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rating_model.dart';
import 'api_service.dart';

class RatingService {
  static Future<List<RatingModel>> getRatings() async {
    final response = await ApiService.get('ratings/');

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<RatingModel> ratings = body.map((dynamic item) => RatingModel.fromJson(item)).toList();
      return ratings;
    } else {
      // Handle error
      return [];
    }
  }

  static Future<RatingModel?> createRating(RatingModel rating) async {
    final response = await ApiService.post('ratings/', rating.toJson());

    if (response.statusCode == 201) {
      return RatingModel.fromJson(json.decode(response.body));
    } else {
      // Handle error
      return null;
    }
  }
}
