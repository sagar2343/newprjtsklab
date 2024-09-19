import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projects/config/constants/http_constantss.dart';
import 'package:projects/config/routes/api_routes.dart';
import 'package:projects/features/leave/data/response/leave_status_response.dart';


class LeaveApiCall{

  Future<List<LeaveMonthYear>> fetchLeaveMonths(String strRollCd, String strEmpCd) async {
    final response = await http.get(Uri.parse('${HttpConstants.getBaseURL()}$APILeaveStatusDate?StrRollcd=$strRollCd&StrEmpcd=$strEmpCd'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => LeaveMonthYear.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load leave months');
    }
  }


}
