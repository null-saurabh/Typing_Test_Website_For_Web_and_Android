import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:typingtest/model/create_order_modal.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/model/ranking_modal.dart';
import 'package:typingtest/model/result_api_modal.dart';

class ApiService {

  static const baseUrl = 'https://www.a1typing.in/api/public/api/v1';

  Future<LiveTest> liveTestData(String userEmail) async {
    // print("$baseUrl/$userEmail/steno-tests/testschedule?type=LIVE");
    final response = await http.get(Uri.parse('$baseUrl/$userEmail/steno-tests/testschedule?type=LIVE'));

    if (response.statusCode == 200) {
      print("got live test response");
      return LiveTest.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<LiveTest> practiceTestData(String userEmail) async {
    final headers = {
      'Accept': 'application/json',
      'Cookie': 'XSRF-TOKEN=eyJpdiI6IkZHYjJZZnJsQzY2dmI1dEZ3alBISEE9PSIsInZhbHVlIjoiUk5MSUtrWE5oUWFtcTVDVjNWVmh3ZEhvMkVNWWU1T090L2RZVkpkQjc4THVudk5FKzR5V3RPZkJHRCt2VitDQ1J0amYzNzU3MTJSYlFweGluVUsvRnQ0RHl5eTRBVWpoSU9rdDhKZGpYS21BTzBQaHJ6OCtFMHZUbEJBN0NMbVIiLCJtYWMiOiIwNjJhZWZmMTU3OTM1YWVlYmU2NzY2ZjNlM2JiMjEzNWZkMjJmOTU0MjFjMzQ4NThlMjUyYjg2MGE2OTdhNjQyIn0%3D; typing_master_session=eyJpdiI6Inl1bS9Ya0dwa0VtRTBJNVQxKzJzb3c9PSIsInZhbHVlIjoidWgxcTZIMXBYcThWcnJYSEJCRHFQK0lZVlFCNm1IeWVDY25DVkNiNitPa3BYRWZpWkxWNlNWelhnWjU1U2c5ZTdJU1dTeFY3eDVaZkFZL3ZKY1BFakl4QWFONWpGM3JRbjB3K0g1SzNmN2hMS05JbFhTd3NJZVZxcWpiVlYyS0QiLCJtYWMiOiJkMGVhMDIxN2Y5ZGExZGU4YzYzNzJhYjJiNzMxNGE4NzA3MGU4ODk3NzUxMDM4N2Y5MDg1NDEzODI1MmE1MTNjIn0%3D',
    };

    final response = await http.get(Uri.parse('$baseUrl/$userEmail/test/list?type=PRACTICE'),headers: headers,);
    // print("in api services");

    if (response.statusCode == 200) {
      // print("status code");
      return LiveTest.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<TestResult> oneResult(String userEmail, int testId) async {
    final headers = {
      // 'Accept': 'application/json',
      'Cookie': 'XSRF-TOKEN=eyJpdiI6IkZHYjJZZnJsQzY2dmI1dEZ3alBISEE9PSIsInZhbHVlIjoiUk5MSUtrWE5oUWFtcTVDVjNWVmh3ZEhvMkVNWWU1T090L2RZVkpkQjc4THVudk5FKzR5V3RPZkJHRCt2VitDQ1J0amYzNzU3MTJSYlFweGluVUsvRnQ0RHl5eTRBVWpoSU9rdDhKZGpYS21BTzBQaHJ6OCtFMHZUbEJBN0NMbVIiLCJtYWMiOiIwNjJhZWZmMTU3OTM1YWVlYmU2NzY2ZjNlM2JiMjEzNWZkMjJmOTU0MjFjMzQ4NThlMjUyYjg2MGE2OTdhNjQyIn0%3D; typing_master_session=eyJpdiI6Inl1bS9Ya0dwa0VtRTBJNVQxKzJzb3c9PSIsInZhbHVlIjoidWgxcTZIMXBYcThWcnJYSEJCRHFQK0lZVlFCNm1IeWVDY25DVkNiNitPa3BYRWZpWkxWNlNWelhnWjU1U2c5ZTdJU1dTeFY3eDVaZkFZL3ZKY1BFakl4QWFONWpGM3JRbjB3K0g1SzNmN2hMS05JbFhTd3NJZVZxcWpiVlYyS0QiLCJtYWMiOiJkMGVhMDIxN2Y5ZGExZGU4YzYzNzJhYjJiNzMxNGE4NzA3MGU4ODk3NzUxMDM4N2Y5MDg1NDEzODI1MmE1MTNjIn0%3D',
    };
    final response = await http.get(Uri.parse('$baseUrl/$userEmail/result/$testId'),headers: headers,);
    // print("in api services");
    if (response.statusCode == 200) {
      // print("status code");
      return TestResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<TestRanking> rankingLeaderBoard(String userEmail, int testId) async {
    final headers = {
      'Accept': 'application/json',
      'Cookie': 'XSRF-TOKEN=eyJpdiI6IkZHYjJZZnJsQzY2dmI1dEZ3alBISEE9PSIsInZhbHVlIjoiUk5MSUtrWE5oUWFtcTVDVjNWVmh3ZEhvMkVNWWU1T090L2RZVkpkQjc4THVudk5FKzR5V3RPZkJHRCt2VitDQ1J0amYzNzU3MTJSYlFweGluVUsvRnQ0RHl5eTRBVWpoSU9rdDhKZGpYS21BTzBQaHJ6OCtFMHZUbEJBN0NMbVIiLCJtYWMiOiIwNjJhZWZmMTU3OTM1YWVlYmU2NzY2ZjNlM2JiMjEzNWZkMjJmOTU0MjFjMzQ4NThlMjUyYjg2MGE2OTdhNjQyIn0%3D; typing_master_session=eyJpdiI6Inl1bS9Ya0dwa0VtRTBJNVQxKzJzb3c9PSIsInZhbHVlIjoidWgxcTZIMXBYcThWcnJYSEJCRHFQK0lZVlFCNm1IeWVDY25DVkNiNitPa3BYRWZpWkxWNlNWelhnWjU1U2c5ZTdJU1dTeFY3eDVaZkFZL3ZKY1BFakl4QWFONWpGM3JRbjB3K0g1SzNmN2hMS05JbFhTd3NJZVZxcWpiVlYyS0QiLCJtYWMiOiJkMGVhMDIxN2Y5ZGExZGU4YzYzNzJhYjJiNzMxNGE4NzA3MGU4ODk3NzUxMDM4N2Y5MDg1NDEzODI1MmE1MTNjIn0%3D',
    };
    final response = await http.get(Uri.parse('$baseUrl/$userEmail/leaderboard/$testId/20'),headers: headers,);
    if (response.statusCode == 200) {
      print("status code");
      return TestRanking.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> saveResult(String emailId, String timeTaken, String speed, String backspaceCount, String accuracy, String wordsTyped, String correctWords, String incorrectWords, String fullMistake, String halfMistake,String testId ) async {
    var headers = {
      'Accept': 'application/json',
      'Cookie': 'XSRF-TOKEN=eyJpdiI6IkZHYjJZZnJsQzY2dmI1dEZ3alBISEE9PSIsInZhbHVlIjoiUk5MSUtrWE5oUWFtcTVDVjNWVmh3ZEhvMkVNWWU1T090L2RZVkpkQjc4THVudk5FKzR5V3RPZkJHRCt2VitDQ1J0amYzNzU3MTJSYlFweGluVUsvRnQ0RHl5eTRBVWpoSU9rdDhKZGpYS21BTzBQaHJ6OCtFMHZUbEJBN0NMbVIiLCJtYWMiOiIwNjJhZWZmMTU3OTM1YWVlYmU2NzY2ZjNlM2JiMjEzNWZkMjJmOTU0MjFjMzQ4NThlMjUyYjg2MGE2OTdhNjQyIn0%3D; typing_master_session=eyJpdiI6Inl1bS9Ya0dwa0VtRTBJNVQxKzJzb3c9PSIsInZhbHVlIjoidWgxcTZIMXBYcThWcnJYSEJCRHFQK0lZVlFCNm1IeWVDY25DVkNiNitPa3BYRWZpWkxWNlNWelhnWjU1U2c5ZTdJU1dTeFY3eDVaZkFZL3ZKY1BFakl4QWFONWpGM3JRbjB3K0g1SzNmN2hMS05JbFhTd3NJZVZxcWpiVlYyS0QiLCJtYWMiOiJkMGVhMDIxN2Y5ZGExZGU4YzYzNzJhYjJiNzMxNGE4NzA3MGU4ODk3NzUxMDM4N2Y5MDg1NDEzODI1MmE1MTNjIn0%3D'
    };

    var request = http.MultipartRequest('POST', Uri.parse('https://www.a1typing.in/api/public/api/v1/result'));
    request.fields.addAll({
      'time_taken': timeTaken,
      'marks_obtained': '0',
      'nwpm': speed,
      'ncpm': '0',
      'gwpm': '0',
      'gcpm': '0',
      'backspace_count': backspaceCount,
      'accuracy': accuracy,
      'words_typed': wordsTyped,
      'words_correct': correctWords,
      'word_incorrect': incorrectWords,
      'full_mistakes': fullMistake,
      'half_mistakes': halfMistake,
      'product_id': emailId,
      'test_id': testId
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      print("save result api final");
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print("failed");
      print(response.reasonPhrase);
      return true;
    }
  }


  Future<bool> registerUser(String emailId, String userName) async {

    var headers = {
      'Accept': 'application/json',
      'Cookie': 'XSRF-TOKEN=eyJpdiI6IkZHYjJZZnJsQzY2dmI1dEZ3alBISEE9PSIsInZhbHVlIjoiUk5MSUtrWE5oUWFtcTVDVjNWVmh3ZEhvMkVNWWU1T090L2RZVkpkQjc4THVudk5FKzR5V3RPZkJHRCt2VitDQ1J0amYzNzU3MTJSYlFweGluVUsvRnQ0RHl5eTRBVWpoSU9rdDhKZGpYS21BTzBQaHJ6OCtFMHZUbEJBN0NMbVIiLCJtYWMiOiIwNjJhZWZmMTU3OTM1YWVlYmU2NzY2ZjNlM2JiMjEzNWZkMjJmOTU0MjFjMzQ4NThlMjUyYjg2MGE2OTdhNjQyIn0%3D; typing_master_session=eyJpdiI6Inl1bS9Ya0dwa0VtRTBJNVQxKzJzb3c9PSIsInZhbHVlIjoidWgxcTZIMXBYcThWcnJYSEJCRHFQK0lZVlFCNm1IeWVDY25DVkNiNitPa3BYRWZpWkxWNlNWelhnWjU1U2c5ZTdJU1dTeFY3eDVaZkFZL3ZKY1BFakl4QWFONWpGM3JRbjB3K0g1SzNmN2hMS05JbFhTd3NJZVZxcWpiVlYyS0QiLCJtYWMiOiJkMGVhMDIxN2Y5ZGExZGU4YzYzNzJhYjJiNzMxNGE4NzA3MGU4ODk3NzUxMDM4N2Y5MDg1NDEzODI1MmE1MTNjIn0%3D'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://www.a1typing.in/api/public/api/v1/users/system-info'));
    request.fields.addAll({
      'os_version': '10.0.1845 Build 18543',
      'last_hindi_exercise': 'typ hindi 123',
      'english_font_size': '6',
      'product_id': emailId,
      'system_date': '2020-6-12',
      'screen_resolution': '1080p',
      'system_installation_date': '2020-6-12',
      'last_english_exercise': 'last eng1',
      'hindi_font_size': '9',
      'user_name': userName,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print("pass");
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return true;
    }

  }


  Future<OrderResponse> createOrder(int price) async {
    final response = await http.post(
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/order/create-order'),
      body: json.encode({
        "person_id": "656b782b7ab1e09d356369b5",
        "amount": price,
      }),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NmI3NmVkN2FiMWUwOWQzNTYzNjlhMyIsInBob25lX251bWJlciI6Ijg1Mjk2MzE0NTgiLCJyb2xlIjoidXNlciIsImlhdCI6MTcwMTU0MTYyMCwiZXhwIjoxNzAyMTQ2NDIwfQ.oIbW4VZwhLGpUx6xle0nyv76LJWLyb1vWq96HtgKCpQ",
      },
    );

    if (response.statusCode == 200) {
      return OrderResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create order");
    }
  }
}



