import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projects/config/constants/http_constantss.dart';
import 'package:projects/config/routes/api_routes.dart';
import 'package:projects/features/attendance/data/response/attendance_response_model.dart';

class AttendanceApi {
  static const String baseUrl = 'YOUR_API_URL'; // Replace with your actual API URL

  Future<List<Attendance>> fetchAttendance(String year, String month, String username) async {
    final response = await http.get(
      // Uri.parse('$baseUrl?year=$year&month=$month&username=$username'),
      Uri.parse('${HttpConstants.getBaseURL()}$APIAttendance?StrYear=$year&StrUsername=$username&StrMonth=8'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Attendance.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load attendance');
    }
  }
}
