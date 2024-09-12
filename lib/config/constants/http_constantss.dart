import 'package:flutter/foundation.dart';

class HttpConstants {
  static String getBaseURL(){
    if(kReleaseMode) {
      return 'http://hrms.thalappakatti.com:4949';
    } else {
      return 'http://hrms.thalappakatti.com:4949';
    }
  }

  static Map<String, String> getHttpHeaders() {
    return {
      'content-Type': 'application/json',
      // 'access_key': 'PMAT-01J7GAQ65DH84XNVN5FDZMTS1M'
    };
  }
}

