import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kioway/app_url.dart';
import 'package:kioway/screens/homework1.dart';
import 'package:kioway/screens/homework2.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignupUser extends StatefulWidget {
  const SignupUser({super.key});

  @override
  State<SignupUser> createState() => _SignupUserState();
}

class _SignupUserState extends State<SignupUser> {
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
  TextEditingController controllerFullname = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();

  final _keyForm = GlobalKey<FormState>();

  String? _password;
  String? _confirmPassword;

  Future<void> registerUser(
      String name, String fullName, String password) async {
    var uri = Uri.parse("${AppUrl.url}register_user.php");
    EasyLoading.show(status: 'loading...');
    await Future.delayed(const Duration(seconds: 1));
    final response = await http.post(uri, body: {
      'full_name': fullName,
      'name': name,
      'password': password,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 1) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${data['msg_success']}"),
          ),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${data['msg_error']}"),
          ),
        );
      }
    }
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up User'),
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
                      return 'Full Name is required';
                    }
                    return null;
                  },
                  controller: controllerUsername,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
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
                      return 'User Name is required';
                    }
                    return null;
                  },
                  controller: controllerFullname,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
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
                  onChanged: (value) {
                    _password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
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
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) {
                    _confirmPassword = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password is required';
                    }
                    if (_confirmPassword != _password) {
                      return 'Confirm Password does not match brothers';
                    }
                    return null;
                  },
                  controller: controllerConfirmPassword,
                  obscureText: ispassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Confirm Password',
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
                      String strFullName =
                          controllerFullname.text.toString().trim();

                      registerUser(
                        strFullName,
                        strName,
                        strPwd,
                      );
                    }
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 56,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                            builder: (context) => const Homework1()),
                        (route) => false);
                  },
                  child: const Text(
                    'Homework 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 56,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                            builder: (context) => const Homework2()),
                        (route) => false);
                  },
                  child: const Text(
                    'Homework 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
