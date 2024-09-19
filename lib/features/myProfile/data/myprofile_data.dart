import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projects/features/myProfile/data/response/myprofile_response_model.dart';
import '../../../config/constants/http_constantss.dart';
import '../../../config/routes/api_routes.dart';

class MyProfileApiCall {
  Future<EmployeeResponse> fetchEmployeeDetails(String strRollCd, String strEmpCd) async {
    try {
      // Construct the API URL with query parameters
      final String apiUrl = '${HttpConstants.getBaseURL()}$APIMyProfile?StrRollCd=$strRollCd&StrEmpCd=$strEmpCd';
      // const String apiUrl = 'http://hrms.thalappakatti.com:4949/HRISAPI/Einfo/FunPubFetchEnfoDetails?StrRollCd=01&StrEmpCd=D027673';
      final Uri uri = Uri.parse(apiUrl);

      // Perform the GET request
      final response = await http.get(uri);

      // Check if the response is successful
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print("response====> $responseData");

        // Parse the JSON into your model
        return EmployeeResponse.fromJson(responseData);
      } else {
        // Throw an exception if the response is not successful
        throw Exception('Failed to load employee details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions and errors
      throw Exception('Failed to fetch data: $e');
    }
  }
}
