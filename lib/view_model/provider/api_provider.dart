
import 'package:flutter/foundation.dart';
import 'package:typingtest/model/api_model.dart';
import 'package:typingtest/view_model/services/api_services.dart';

class TestProvider with ChangeNotifier {
  final ApiService apiService;
  List<Test>? _tests;

  TestProvider({required this.apiService}) {
    _initialFetch();
  }

  List<Test>? get tests => _tests;

  void _initialFetch() async {
    try {
      _tests = await apiService.fetchUpcomingTests();
      print("1");
      notifyListeners();
    } catch (error) {
      // Handle errors if needed, for example, by setting an error state
      // print(error);
      rethrow;
      // Optionally notify listeners here if you want to reflect an error state in the UI
    }
  }

  Future<void> refreshTests() async {
    _tests = await apiService.fetchUpcomingTests();
    notifyListeners();
  }
}







// import 'package:flutter/foundation.dart';
// import 'package:typingtest/model/api_model.dart';
// import 'package:typingtest/view_model/services/api_services.dart';
//
// class TestProvider with ChangeNotifier {
//   final ApiService apiService;
//
//   TestProvider({required this.apiService});
//
//   List<Test>? _tests;
//
//   List<Test>? get tests => _tests;
//
//   fetchUpcomingTests() async {
//     _tests = await apiService.fetchUpcomingTests();
//     notifyListeners();
//   }
// }

