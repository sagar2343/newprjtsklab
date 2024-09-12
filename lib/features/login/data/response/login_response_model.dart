class LoginResponse {
  final String username;
  final String rights;
  final String authRequired;
  final String name;
  final String roleCode;
  final String categoryCode;
  final String priorityCode;
  final String category;
  final String location;
  final String employeePhoto;
  final String employeeCode;
  final String status;
  final String statusId;

  LoginResponse({
    required this.username,
    required this.rights,
    required this.authRequired,
    required this.name,
    required this.roleCode,
    required this.categoryCode,
    required this.priorityCode,
    required this.category,
    required this.location,
    required this.employeePhoto,
    required this.employeeCode,
    required this.status,
    required this.statusId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      username: json['ProPubStrUsername'],
      rights: json['ProPubStrRights'],
      authRequired: json['ProPubStrAuthn_Recq'],
      name: json['ProPubStrName'],
      roleCode: json['ProPubStrRollCd'],
      categoryCode: json['ProPubStrCatgCd'],
      priorityCode: json['ProPubStrPrtyCd'],
      category: json['ProPubStrCategory'],
      location: json['ProPubStrLocation'],
      employeePhoto: json['ProPubStrEmpPhoto'],
      employeeCode: json['ProPubStrEmpCd'],
      status: json['ProPubStrStatus'],
      statusId: json['ProPubStrStatusId'],
    );
  }
}
