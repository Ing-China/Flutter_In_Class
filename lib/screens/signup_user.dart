import 'package:flutter/material.dart';
import 'package:kioway/screens/homework1.dart';
import 'package:kioway/screens/homework2.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up User'),
        ),
        body: ListView(
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
              child: TextField(
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
              child: TextField(
                controller: controllerUsername,
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
              child: TextField(
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
              child: TextField(
                controller: controllerPassword,
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
                  String strName = controllerUsername.text;
                  String strPwd = controllerPassword.text;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("UserName: $strName \nPassword: $strPwd"),
                    ),
                  );
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
                      MaterialPageRoute(builder: (context) => Homework1()),
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
                      MaterialPageRoute(builder: (context) => Homework2()),
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
    );
  }
}
