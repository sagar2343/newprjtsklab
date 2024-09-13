import 'package:flutter/material.dart';

import '../../companyCode/controller/companycode_controller.dart';
import '../data/login_data.dart';

class LoginController {
  bool isPasswordVisible = false;
  bool isButtonEnabled = false;

  final TextEditingController companyCodeController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? companyName;

  void initListeners(void Function() updateState, CompanyCodeController companyCodeControllerLogic) {
    companyCodeController.addListener(() {
      companyCodeControllerLogic.onCompanyCodeChanged(
        companyCodeController,
            (name) {
          companyName = name;
          updateState(); // Calling setState or state update from UI
        },
      );
    });
    usernameController.addListener(updateState);
    passwordController.addListener(updateState);
  }

  void dispose() {
    companyCodeController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  void validateButtonState(void Function() updateState) {
    final username = usernameController.text;
    final password = passwordController.text;
    final companyCode = companyCodeController.text;

    isButtonEnabled = username.isNotEmpty &&
        password.isNotEmpty &&
        companyCode.isNotEmpty &&
        companyName != null &&
        companyName != "Company not found";
    updateState(); // Trigger UI update
  }

  void validateAndLogin(BuildContext context, LoginData loginController) {
    final username = usernameController.text;
    final password = passwordController.text;
    final companyCode = companyCodeController.text;

    if (username.isEmpty || password.isEmpty || companyCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 700),
        ),
      );
    } else if (companyName == null || companyName == "Company not found") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid Company Code!'),
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 700),
        ),
      );
    } else {
      loginController.loginUser(
        context,
        username,
        password,
        "ABCD1234", // Example token
        "ABCD1234", // Example deviceId
      );
    }
  }
}
