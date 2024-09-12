class LoginRequest {
  final String username;
  final String password;
  final String token;
  final String deviceId;

  LoginRequest({
    required this.username,
    required this.password,
    required this.token,
    required this.deviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      "ProPubStrUsername": username,
      "ProPubStrPassword": password,
      "ProPubToken": token,
      "ProPubStrDeviceid": deviceId,
    };
  }
}
