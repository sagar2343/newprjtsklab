import 'dart:async';

import 'package:flutter/material.dart';
import '../../company_code/controller/companycode_controller.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false; // For password visibility toggle
  bool _isButtonEnabled = false;

  final TextEditingController _companyCodeController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final CompanyCodeController _companyCodeControllerLogic = CompanyCodeController();

  final LoginController _loginController = LoginController();

  String? _companyName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _companyCodeController.addListener(() {
      _companyCodeControllerLogic.onCompanyCodeChanged(
          _companyCodeController, (companyName) {
        setState(() {
          _companyName = companyName;
          _validateButtonState();
        });
      });
    });
    _usernameController.addListener(_validateButtonState);
    _passwordController.addListener(_validateButtonState);
  }

  @override
  void dispose() {
    _companyCodeController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: Image.asset('assets/images/logo.png', width: w * 0.5)),

              // Text of company
              Center(
                  child: Text(_companyName != null ? '( $_companyName )' : '',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))),
              SizedBox(height: h * 0.03),

              // Company Code Field
              TextField(
                controller: _companyCodeController,
                decoration: InputDecoration(
                  labelText: 'Company Code',
                  // border: const UnderlineInputBorder(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.business, color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: h * 0.02),

              // Username Field
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: h * 0.02),

              // Password Field
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red)),
                  prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey[700],
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),

              // Sign In Button
              ElevatedButton(
                onPressed: () {
                  _isButtonEnabled ? _validateAndLogin() : null ;
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: _isButtonEnabled ? Colors.blue[700] : Colors.grey[600],
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: h * 0.04),

              // Help Row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Need Help? Click here!',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(width: 7),
                  InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.chat_bubble, color: Colors.yellow),
                    ),
                  )
                ],
              ),
              SizedBox(height: h * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  void _validateButtonState() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final companyCode = _companyCodeController.text;

    setState(() {
      _isButtonEnabled = username.isNotEmpty &&
          password.isNotEmpty &&
          companyCode.isNotEmpty &&
          _companyName != null &&
          _companyName != "Company not found";
    });
  }

  void _validateAndLogin() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final companyCode = _companyCodeController.text;

    if (username.isEmpty || password.isEmpty || companyCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 700),
        ),
      );
    } else {
      if(_companyName == null || _companyName == "Company not found"){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('please enter valid Company Code !'),
              backgroundColor: Colors.red,
              duration: Duration(milliseconds: 700),
            ),
        );
      } else {
        _loginController.loginUser(
          context,
          username,
          password,
          "ABCD1234", // Example token
          "ABCD1234", // Example deviceId
        );
      }
    }
  }

}
