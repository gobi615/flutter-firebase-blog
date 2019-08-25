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

  bool isCredientilFails = false;
  bool isLoginSuccess = false;
  bool isFieldFilled = true;

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
                if(email == null || password == null || email.isEmpty || password.isEmpty)
                  setState(() {
                    isLoginSuccess = false;
                    isCredientilFails = false;
                    isFieldFilled = false;
                  });
                  else{
                    authResult = fireService.signInWithEmailAndPass(email.trim(), password);
                    authResult.then(
                          (onValue){
                            print('onValue then ${onValue.user}');
                            if(onValue.user != null){
                              setState(() {
                                isLoginSuccess = true;
                                isCredientilFails = false;
                                isFieldFilled = true;
                              });
                              Navigator.pushReplacementNamed(context, '/blog');
                            }
                          },
                        onError : (err){
                              print('onError Executed $err');
                          setState(() {
                            isLoginSuccess = false;
                            isCredientilFails = true;
                            isFieldFilled = true;
                          });
                        }

                        );
                  }
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
  if(isCredientilFails)
    return Container(
      child: Text('Email and Password is wrong',
        style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            fontSize: 18.0
          ),),
    );
    if(isLoginSuccess)
      return Container(
        child: Text('Login Successful',
          style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),),
    );
    if(!isFieldFilled)
      return Container(
        child: Text('Any field should not be empty',
          style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),),
      );
    return Container();
  }
}
