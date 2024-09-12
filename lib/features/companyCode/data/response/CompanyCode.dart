import 'dart:convert';

class CompanyCodeResponse {
  final String proPubStrId;
  final String proPubStrClientDesc;
  final String proPubStrClientCode;
  final String proPubStrLink;
  final String? proPubStrClientImg; // Nullable
  final String proPubStrWebUrl;

  CompanyCodeResponse({
    required this.proPubStrId,
    required this.proPubStrClientDesc,
    required this.proPubStrClientCode,
    required this.proPubStrLink,
    this.proPubStrClientImg,
    required this.proPubStrWebUrl,
  });

  // Factory constructor to create a CompanyCode from JSON
  factory CompanyCodeResponse.fromJson(Map<String, dynamic> json) {
    return CompanyCodeResponse(
      proPubStrId: json['ProPubStrId'],
      proPubStrClientDesc: json['ProPubStrClientDesc'],
      proPubStrClientCode: json['ProPubStrClientCode'],
      proPubStrLink: json['ProPubStrLink'],
      proPubStrClientImg: json['ProPubStrClientImg'],
      proPubStrWebUrl: json['ProPubStrWebUrl'],
    );
  }

  // Method to convert CompanyCode to JSON
  Map<String, dynamic> toJson() {
    return {
      'ProPubStrId': proPubStrId,
      'ProPubStrClientDesc': proPubStrClientDesc,
      'ProPubStrClientCode': proPubStrClientCode,
      'ProPubStrLink': proPubStrLink,
      'ProPubStrClientImg': proPubStrClientImg,
      'ProPubStrWebUrl': proPubStrWebUrl,
    };
  }
}

// Example usage to parse a JSON string
void main() {
  const jsonString = '''
  [
    {
      "ProPubStrId": "17",
      "ProPubStrClientDesc": "Thalappakatti Hotels Pvt Ltd.",
      "ProPubStrClientCode": "THP",
      "ProPubStrLink": "http://hrms.thalappakatti.com:4949/HRISAPI/",
      "ProPubStrClientImg": null,
      "ProPubStrWebUrl": "https://thalappakatti.com"
    },
    {
      "ProPubStrId": "18",
      "ProPubStrClientDesc": "Thalappakatti Hotels Pvt Ltd.",
      "ProPubStrClientCode": "THP",
      "ProPubStrLink": "http://hrms.thalappakatti.com:4949/API/",
      "ProPubStrClientImg": null,
      "ProPubStrWebUrl": "https://thalappakatti.com"
    }
  ]
  ''';

  final List<dynamic> jsonList = json.decode(jsonString);
  final List<CompanyCodeResponse> companyCodes = jsonList.map((json) => CompanyCodeResponse.fromJson(json)).toList();

  // Print the parsed objects
  for (var companyCode in companyCodes) {
    print('ID: ${companyCode.proPubStrId}');
    print('Description: ${companyCode.proPubStrClientDesc}');
    print('Code: ${companyCode.proPubStrClientCode}');
    print('Link: ${companyCode.proPubStrLink}');
    print('Image: ${companyCode.proPubStrClientImg}');
    print('Web URL: ${companyCode.proPubStrWebUrl}');
    print('');
  }
}
