
import 'package:flutter/material.dart';

import '../utils/firebase.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: txtemail,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: txtpassword,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  String msg =
                  await loginemailpass(txtemail.text, txtpassword.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("$msg"),
                    ),
                  );
                  if (msg == "Success") {
                    Navigator.pushReplacementNamed(context, '/nav');
                  }
                },
                child: Text("Signin"),
              ),
              TextButton(
                onPressed: () async {
                  bool msg = await googlelogin();

                  if (msg) {
                    Navigator.pushReplacementNamed(context, '/nav');
                  }
                },
                child: Text("Login With Google"),
              ),
              SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: () {
                },
                child: Text("Create Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}