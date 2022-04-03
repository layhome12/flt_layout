import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:layout_basic/models/tourism_model.dart';

class ApiService {
  static const String _baseUrl = 'http://192.168.0.2/trunk/public/';

  Future<TourismResult> getTourismList() async {
    final response = await http.get(Uri.parse(_baseUrl + 'api/public/wisata'));

    if (response.statusCode == 200) {
      return TourismResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Cannot Connect Server !');
    }
  }
}
