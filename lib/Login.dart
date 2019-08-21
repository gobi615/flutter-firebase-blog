import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'GlobalData.dart';

var fireService = GlobalData.fireService;
Future<AuthResult> authResult;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }

}

class _LoginState extends State<Login> {
  String email;
  String password;
  bool remember;

  bool isCreFails = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Column(
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
            SizedBox(height: 25,),
            RaisedButton(
              onPressed: () {
                print(email);
                print(password);
                authResult = fireService.signInWithEmailAndPass(email, password);
                authResult.then(
                        (onValue){
                          print('onValue then ${onValue.user}');
                          if(onValue.user != null){
                            Navigator.pushReplacementNamed(context, '/blog');
                          }
                        },
                    onError : (err){
                          print('onError Executed $err');
                      setState(() {
                        isCreFails = true;
                      });
                    }

                    );
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 50,),
            getSignInFailMsg(),
          ],
      ),

    );
  }

  getSignInFailMsg() {
  if(isCreFails)
    return Container(
      child: Text('Email and Password is wrong',
        style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            fontSize: 22.0
          ),),
    );
    return Container();
  }
}
