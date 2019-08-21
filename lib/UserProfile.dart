import 'package:flutter/material.dart';
import 'GlobalData.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var user = GlobalData.fireService.getUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Head'),
      ),
      body: FutureBuilder<FirebaseUser>(
          future: user,
          builder: (context, snapshot){
            return Container(
              alignment: Alignment.center,
              height: 300,
              width: MediaQuery.of(context).size.width,

              child: Text('Welcome ${snapshot.data.displayName}'),
            );
          })


    );
  }


}
