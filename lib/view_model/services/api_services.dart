import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:typingtest/model/api_model.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<Test>> fetchUpcomingTests() async {
    final response = await http.get(Uri.parse("http://127.0.0.1:5000/api/getData"));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      // print(response.body);
      Iterable iterableData = json["data"]["list"];
      return iterableData.map((test) => Test.fromJson(test)).toList();
    } else {
      throw Exception('Failed to load tests');
    }
  }
}
