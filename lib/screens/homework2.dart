import 'package:flutter/material.dart';

class Homework2 extends StatefulWidget {
  const Homework2({super.key});

  @override
  State<Homework2> createState() => _Homework2State();
}

class _Homework2State extends State<Homework2> {
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController input3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset(
                  'assets/images/person.png',
                  height: 170,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: TextField(
              controller: input1,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 233, 233, 233),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  labelText: 'Full Name',
                  labelStyle: TextStyle(fontSize: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: TextField(
              controller: input2,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 233, 233, 233),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                labelText: 'Email Address',
                labelStyle: TextStyle(fontSize: 15),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: TextField(
              controller: input3,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 233, 233, 233),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
          ),
          Container(
            height: 56,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                String name = input1.text;
                String email = input2.text;
                String password = input3.text;

                if (name.isEmpty || email.isEmpty || password.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Validation Error'),
                        content: const Text('Please fill out all fields.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Name: $name \nEmail: $email \nPassword: $password"),
                    ),
                  );
                }
              },
              child: const Text(
                'CREATE ACCOUNT',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 5),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding:
                        WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    overlayColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: const Text(
                    'Already Have Account?',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: const Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "OR",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/google.png',
                  width: 30.0,
                  height: 30.0,
                ),
                label: const Text(
                  'Login with Google',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 140, 255),
                  ),
                ),
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                  overlayColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                ),
              )
            ],
          ),
          Column(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.facebook, // Use the Google icon from Material Icons
                  color: Color.fromARGB(255, 0, 140, 255),
                  size: 37.0,
                ),
                label: const Text(
                  'Login with Facebook',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 140, 255),
                  ),
                ),
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                  overlayColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
