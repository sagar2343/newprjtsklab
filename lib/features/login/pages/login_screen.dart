import 'package:flutter/material.dart';
import 'package:projects/features/widgets/custom_appbar.dart';
import '../../companyCode/controller/companycode_controller.dart';
import '../controller/login_controller.dart';
import '../data/login_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = LoginController();
  final CompanyCodeController _companyCodeControllerLogic = CompanyCodeController();
  final LoginData _loginData = LoginData();

  @override
  void initState() {
    super.initState();
    _loginController.initListeners(() {
      setState(() {
        _loginController.validateButtonState(() => setState(() {}));
      });
    }, _companyCodeControllerLogic);
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Login',
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

              Center(
                  child: Text(_loginController.companyName != null
                      ? '( ${_loginController.companyName} )'
                      : '',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))),
              SizedBox(height: h * 0.03),

              TextField(
                controller: _loginController.companyCodeController,
                decoration: InputDecoration(
                  labelText: 'Company Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.business, color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: h * 0.02),

              TextField(
                controller: _loginController.usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: h * 0.02),

              TextField(
                controller: _loginController.passwordController,
                obscureText: !_loginController.isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red)),
                  prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _loginController.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey[700],
                    ),
                    onPressed: () {
                      setState(() {
                        _loginController.togglePasswordVisibility();
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),

              ElevatedButton(
                onPressed: _loginController.isButtonEnabled
                    ? () {
                  _loginController.validateAndLogin(context, _loginData);
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: _loginController.isButtonEnabled
                      ? Colors.blue[700]
                      : Colors.grey[600],
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: h * 0.04),

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
}
