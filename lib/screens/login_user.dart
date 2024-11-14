import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kioway/app_url.dart';
import 'package:kioway/screens/home.dart';
import 'package:kioway/screens/homework3.dart';
import 'package:kioway/screens/signup_user.dart';
import 'package:http/http.dart' as http;

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  bool ispassword = true;
  final txt = FocusNode();
  void togglePassword() {
    setState(() {
      ispassword = !ispassword;
      if (txt.hasPrimaryFocus) return;
      txt.canRequestFocus = false;
    });
  }

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  Future<void> loginUser(String userName, String password) async {
    var uri = Uri.parse("${AppUrl.url}login_user.php");
    EasyLoading.instance
      ..backgroundColor = Colors.black
      ..textColor = Colors.white;
    EasyLoading.show(status: 'loading...');
    await Future.delayed(const Duration(seconds: 2));
    final response = await http.post(uri, body: {
      'UsernameLogin': userName,
      'PasswordLogin': password,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 1) {
        //save user login info
        // you can sheredpreferences
        EasyLoading.instance
          ..backgroundColor = Colors.green
          ..textColor = Colors.white;
        EasyLoading.showSuccess("${data['msg_success']}");
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
            (route) => false);
      } else {
        EasyLoading.instance
          ..backgroundColor = Colors.red
          ..textColor = Colors.white;
        EasyLoading.showError("${data['msg_error']}");
      }
    } else {
      EasyLoading.instance
        ..backgroundColor = Colors.red
        ..textColor = Colors.white;
      EasyLoading.showError("Failed to send data.");
    }
  }

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login User'),
        ),
        body: Form(
          key: _keyForm,
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                child: Image.asset(
                  'assets/images/person.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Username';
                    }
                    return null;
                  },
                  controller: controllerUsername,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    prefixIcon: Icon(
                      Icons.person,
                      size: 32,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Password';
                    }
                    return null;
                  },
                  controller: controllerPassword,
                  obscureText: ispassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      size: 32,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: GestureDetector(
                        onTap: togglePassword,
                        child: Icon(
                          ispassword
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 56,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    if (_keyForm.currentState!.validate()) {
                      String strName =
                          controllerUsername.text.toString().trim();
                      String strPwd = controllerPassword.text.toString().trim();
                      loginUser(strName, strPwd);
                    }
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 56,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homework3(),
                        ),
                        (route) => false);
                  },
                  child: const Text(
                    'Homework 3',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 56,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Forget Password',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Does not have an account?'),
                  const SizedBox(width: 10),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupUser(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
