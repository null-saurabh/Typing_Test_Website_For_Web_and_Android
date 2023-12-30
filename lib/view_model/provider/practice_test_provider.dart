import 'package:flutter/material.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';
import 'package:typingtest/view_model/services/api_services.dart';
class PracticeProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  final LoginUserProvider _userProvider;

  PracticeProvider(this._userProvider);

  LiveTest? get practiceTests => _practiceTests;

  LiveTest? _practiceTests;


  Future<LiveTest> fetchPracticeTest() async {
    final userEmail = _userProvider.user?.email;
    if (userEmail == null) {
      throw Exception('User is not logged in');
    }
    try {
      final response = await apiService.practiceTestData(userEmail);
      _practiceTests = response;
      notifyListeners();
      return response;
    } catch (e) {
      rethrow;
    }
  }


  void refresh() {
    _practiceTests = null;
    notifyListeners();
    fetchPracticeTest();
  }

}