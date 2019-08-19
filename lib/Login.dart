import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  String email;
  String password;
  bool remember;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Center(
        child :Column(
          children: <Widget>[
            TextField(
              onChanged: (value) => email = value,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'email'
              ),
            ),
            TextField(
              onChanged: (value) => password = value,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'password'
              ),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/blog'),
              child: Text('Submit'),
            )
          ],
      ),
      ),
    );
  }
}
