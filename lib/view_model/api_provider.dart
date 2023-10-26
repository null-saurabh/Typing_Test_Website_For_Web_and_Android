import 'package:flutter/foundation.dart';
import 'package:typingtest/model/api_model.dart';
import 'package:typingtest/view_model/services/api_services.dart';

class TestProvider with ChangeNotifier {
  final ApiService apiService;

  TestProvider({required this.apiService});

  List<Test>? _tests;

  List<Test>? get tests => _tests;

  fetchUpcomingTests() async {
    _tests = await apiService.fetchUpcomingTests();
    notifyListeners();
  }
}
