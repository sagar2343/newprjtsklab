import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:projects/config/constants/http_constantss.dart';
import 'package:projects/config/routes/api_routes.dart';
import '../../home/pages/Home_screen.dart';
import '../data/response/login_response_model.dart';
import '../models/login_request_model.dart';

class LoginData {


  Future<void> loginUser(BuildContext context,String username, String password, String token, String deviceId) async{
    EasyLoading.show(status: 'Logging in...');

    final loginRequest = LoginRequest(
      username: username,
      password: password,
      token: token,
      deviceId: deviceId,
      // token: "ABCD1234",
      // deviceId: "ABCD1234",
    );

    List<LoginResponse>? response = await loginApi(loginRequest);

    if(response != null && response.isNotEmpty) {
      EasyLoading.showSuccess('Login successful!!!');
      print('Login successfully: ${response[0].name}');
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
    } else{
      EasyLoading.showError('Login failed. Please check your credentials.');
      print('Login Failed');
    }
    EasyLoading.dismiss();
  }




  // Function to login the user
  Future<List<LoginResponse>?> loginApi(LoginRequest request) async {
    try {
      final url = Uri.parse('${HttpConstants.getBaseURL()}$APIRouteLogin');

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of LoginResponse
        List<LoginResponse> loginResponse = (jsonDecode(response.body) as List)
            .map((data) => LoginResponse.fromJson(data))
            .toList();
        return loginResponse;
      } else {
        // Handle errors if the status code is not 200
        print('Login failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred during login: $e');
      return null;
    }
  }
}
