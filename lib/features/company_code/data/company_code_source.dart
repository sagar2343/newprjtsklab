import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:projects/config/routes/api_routes.dart';
import 'package:projects/features/company_code/data/response/CompanyCode.dart';
import 'package:http/http.dart' as http;
import '../../../config/constants/http_constantss.dart';

class GetCompanyCodeData{

  Future<List<CompanyCodeResponse>?> getCompanyCode(String companyName) async {
    try {
      final url = Uri.parse('${HttpConstants.getBaseURL()}$APICompanyCode?ClientCode=$companyName');
      // final url = Uri.parse('http://hrms.thalappakatti.com:4949/MobileAPI/Login/Funpubgetlink?ClientCode=$companyName');

      final response = await http.get (
        url,
        headers: HttpConstants.getHttpHeaders(),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((json) => CompanyCodeResponse.fromJson(json)).toList();
      } else {
        log('Failed to load data');
        // EasyLoading.showError('Failed to load data');
      }
    } catch (error, stacktrace) {
      EasyLoading.showInfo(error.toString());
      debugPrintStack(stackTrace: stacktrace);
    }
    return null;
  }
}