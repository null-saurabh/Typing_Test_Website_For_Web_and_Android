import 'dart:convert';
import 'package:http/http.dart' as http;
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
    print("in api ranking services");
    if (response.statusCode == 200) {
      print("status code");
      return TestRanking.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
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
      // print("passfailo");
      print(response.reasonPhrase);
      return true;
    }

  }
}


// class ApiService {
//   final String baseUrl;
//
//   ApiService({required this.baseUrl});
//
//
//   Future<List<Test>> fetchUpcomingTests() async {
//     try{
//       final response = await http.get(Uri.parse("http://192.168.0.73:5000/api/getData"));
//       // final response = await http.get(Uri.parse("http://127.0.0.1:5000/api/getData"));
//       if (response.statusCode == 200) {
//         Map<String, dynamic> json = jsonDecode(response.body);
//         Iterable iterableData = json["data"]["list"];
//         return iterableData.map((test) => Test.fromJson(test)).toList();
//       } else {
//         // print("API Request failed with status code: ${response.statusCode}");
//         throw Exception('Failed to load tests');
//       }
//     } catch (error){
//       // print("API Request failed with error: $error");
//       rethrow;
//     }
//   }}
// final Map<String, dynamic> body = {
//   'os_version': "10.0.1845 Build 18543",
//   'last_hindi_exercise': "10.0.1845 Build 18543",
//   'english_font_size': "6",
//   'product_id': emailId,
//   'system_date': "2020-6-12",
//   'screen_resolution': "1080p",
//   'system_installation_date': "6",
//   'last_english_exercise': "last eng1",
//   'hindi_font_size': "9",
//   'user_name': userName,
// };
//
// var headers = {
//   'Accept': 'application/json',
//   'Cookie': 'XSRF-TOKEN=eyJpdiI6IkZHYjJZZnJsQzY2dmI1dEZ3alBISEE9PSIsInZhbHVlIjoiUk5MSUtrWE5oUWFtcTVDVjNWVmh3ZEhvMkVNWWU1T090L2RZVkpkQjc4THVudk5FKzR5V3RPZkJHRCt2VitDQ1J0amYzNzU3MTJSYlFweGluVUsvRnQ0RHl5eTRBVWpoSU9rdDhKZGpYS21BTzBQaHJ6OCtFMHZUbEJBN0NMbVIiLCJtYWMiOiIwNjJhZWZmMTU3OTM1YWVlYmU2NzY2ZjNlM2JiMjEzNWZkMjJmOTU0MjFjMzQ4NThlMjUyYjg2MGE2OTdhNjQyIn0%3D; typing_master_session=eyJpdiI6Inl1bS9Ya0dwa0VtRTBJNVQxKzJzb3c9PSIsInZhbHVlIjoidWgxcTZIMXBYcThWcnJYSEJCRHFQK0lZVlFCNm1IeWVDY25DVkNiNitPa3BYRWZpWkxWNlNWelhnWjU1U2c5ZTdJU1dTeFY3eDVaZkFZL3ZKY1BFakl4QWFONWpGM3JRbjB3K0g1SzNmN2hMS05JbFhTd3NJZVZxcWpiVlYyS0QiLCJtYWMiOiJkMGVhMDIxN2Y5ZGExZGU4YzYzNzJhYjJiNzMxNGE4NzA3MGU4ODk3NzUxMDM4N2Y5MDg1NDEzODI1MmE1MTNjIn0%3D'
// };
//
// final response = await http.post(
//   Uri.parse('$baseUrl/users/system-info'),
//   body: json.encode(body),
//   headers: headers,
// );
//
// if (response.statusCode == 200) {
//   // if (response.headers['content-type']?.toLowerCase()?.contains('application/json') == true) {
//   //   // The response is JSON, decode it
//   //   final responseBody = json.decode(response.body);
//   //
//   //   // Now you can access the JSON data
//   //   // For example, check the "message" field
//   //   if (responseBody.containsKey("message")) {
//   //     final message = responseBody["message"] as String;
//   //     return message == "System Info Updated Successfully.";
//   //   } else {
//   //     throw Exception("Invalid response format");
//   //   }
//   // } else {
//   //   throw Exception("Invalid response content type: ${response.headers['content-type']}");
//   // }
//   print("user registered");
//   return true;
// } else {
//   // final responseBody = json.decode(response.body);
//   // if (responseBody.containsKey("errors")) {
//   //   final errors = responseBody["errors"] as Map<String, dynamic>;
//   //   final errorMessages = errors.values
//   //       .map<String>((value) => value[0] as String)
//   //       .toList();
//   //
//   //   final errorMessage = errorMessages.join(", ");
//   //   throw Exception("Registration failed: $errorMessage");
//   // } else if (responseBody.containsKey("message")) {
//   //   final message = responseBody["message"] as String;
//   //   throw Exception("Registration failed: $message");
//   // } else {
//   //   throw Exception("Registration failed with an unknown error");
//   // }
//     throw Exception("Registration failed with an unknown error");
//
// }


