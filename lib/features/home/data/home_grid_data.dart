import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../config/constants/http_constantss.dart';
import '../../../config/routes/api_routes.dart';
import 'response/home_grid_response.dart';

class HomeGridApiCall {
  final String apiUrl = '${HttpConstants.getBaseURL()}$APIHomeGridItem';

  // Fetch the modules data from the API
  Future<HomeGridModuleResponse> fetchModules() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // Check if the key "ProPubModule" exists in the response
        if (jsonResponse.containsKey('ProPubModule')) {
          // Convert the response to ModuleResponse model
          return HomeGridModuleResponse.fromJson(jsonResponse);
        } else {
          throw Exception('Invalid response structure');
        }
      } else {
        throw Exception('Failed to load modules with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load modules: $e');
    }
  }
}
