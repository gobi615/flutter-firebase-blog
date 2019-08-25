import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Provider.dart';

class Login extends StatelessWidget {

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: Provider.of(context).auth.email,
              initialData: 'email',
              builder: (context, AsyncSnapshot<String> snapshot){
                return TextField(
                  onChanged: Provider.of(context).auth.changeEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'email',
                      errorText: snapshot.error
                  ),
                );
              },
            ),
            StreamBuilder(
              stream: Provider.of(context).auth.password,
              initialData: 'pass',
              builder: (context,AsyncSnapshot<String> snapshot){
                return TextField(
                  onChanged: Provider.of(context).auth.changePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password',
                    errorText: snapshot.error
                  ),
                );
              },
            ),
            SizedBox(height: 25,),
            StreamBuilder(
              stream: Provider.of(context).auth.submitValid,
              builder: (context,AsyncSnapshot<bool> snapshot){
                return RaisedButton(
                  color: Colors.blue,
                  onPressed: (snapshot.data != null && snapshot.data ) ? (() async {
                    var auth = Provider.of(context).auth ;
                    String uid = await auth.submit();
                    if(uid!=null) {
                      Navigator.pushReplacementNamed(context, '/blog');
                      auth.email;
                      auth.password;
                    }
                  }) : null ,
                  child: Text('Submit'),
                );
              },
            ),
            SizedBox(height: 50,),
            StreamBuilder(
              stream: Provider.of(context).auth.response,
              builder: (context,AsyncSnapshot snapshot) {
                if(snapshot.hasData)
                 return Container(
                    child: Text('Email and Password is wrong',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0
                      ),),
                  );
                return Container();
              }
            ),
          ],
        ),
      ),

    );
  }


}
