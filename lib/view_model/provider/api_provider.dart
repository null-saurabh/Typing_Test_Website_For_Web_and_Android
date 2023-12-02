
import 'package:flutter/foundation.dart';
import 'package:typingtest/model/create_order_modal.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/model/ranking_modal.dart';
import 'package:typingtest/model/result_api_modal.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';
import 'package:typingtest/view_model/services/api_services.dart';

class ApiProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  LiveTest? _liveTests;
  LiveTest? _practiceTests;
  String? userEmail;

  final LoginUserProvider _userProvider;

  ApiProvider(this._userProvider);

  LiveTest? get liveTests => _liveTests;
  LiveTest? get practiceTests => _practiceTests;


  Future<void> fetchLiveTest() async {
    final userEmail = _userProvider.userEmail;

    if (userEmail == null) {
      // print("useremail is null");
      throw Exception('User is not logged in');
    }

    try {
      // print("in try of provider live tests");
      final response = await apiService.liveTestData(userEmail);
      _liveTests = response;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchPracticeTest() async {
    final userEmail = _userProvider.userEmail;
    // print(userEmail);
    if (userEmail == null) {
      // print("useremail is null");
      throw Exception('User is not logged in');
    }
    try {
      // print("trying practice in provider");
      final response = await apiService.practiceTestData(userEmail);
      _practiceTests = response;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ResultData>> fetchOneResult(int testId) async {
    final userEmail = _userProvider.userEmail;
    if (userEmail == null) {
      // print("useremail is null");
      throw Exception('User is not logged in');
    }
    try {
      // print("trying practice in provider");
      final response = await apiService.oneResult(userEmail,testId);
      return response.data!;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RankingData>> fetchRanking(int testId) async {
    final userEmail = _userProvider.userEmail;
    if (userEmail == null) {
      throw Exception('User is not logged in');
    }
    try {
      final response = await apiService.rankingLeaderBoard(userEmail,testId);
      print("trying ranking in provider");
      return response.data!;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> saveResult(
      String timeTaken,
      String speed,
      String backspaceCount,
      String accuracy,
      String wordsTyped,
      String correctWords,
      String incorrectWords,
      String fullMistake,
      String halfMistake,
      String testId,
      ) async {

    print('data $timeTaken,$speed,$accuracy,$correctWords,$testId');
    final userEmail = _userProvider.userEmail;

    if (userEmail == null) {
      throw Exception('User is not logged in');
    }

    try {
      print("in provider");

      final response = await apiService.saveResult(
        userEmail,
        timeTaken,
        speed,
        backspaceCount,
        accuracy,
        wordsTyped,
        correctWords,
        incorrectWords,
        fullMistake,
        halfMistake,
        testId,
      );

      // Do something with the result if needed
      return response;
    } catch (e) {
      print("Error saving result: $e");
      return false;
    }
  }

  Future<OrderResponse> createOrder(int price) async {
    try {
      return await apiService.createOrder(price);
    } catch (error) {
      notifyListeners();
      rethrow;
    }
  }

}


