import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Blog.dart';
import 'Login.dart';
import 'Provider.dart';
import 'auth.dart';
import 'news-by-category.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

var fs = Firestore.instance ;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: Auth(),
      child:  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {'/login' : (BuildContext context)=> Login(),
          '/blog' : (BuildContext context) => Blog(),
          '/article' : (BuildContext context) => Article(),
          '/bycategory' : (BuildContext context) => ByCategory(),
        },
        home: MyHomePage(),
      ),
    );


  }
}

class MyHomePage extends StatelessWidget{

  Widget build(context){
    final auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot snapshot){
        return snapshot.hasData ? UserProfile() : LoginPage();
      },
    );
  }
}

class UserProfile extends StatelessWidget{
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
          FlatButton(
            child: Text('SignOut'),
            onPressed: () async {
              try{
                var auth = Provider.of(context).auth;
                await auth.signOut();
                print('soignout');
              }catch(e){
                print(e);
              }
            },
          ),

        ],
      ),
      body: FutureBuilder(
        future: Provider.of(context).auth.currentUser(),
        builder: (context,AsyncSnapshot<FirebaseUser> snapshot){
          if(snapshot.hasData)
            return Column(
              children: <Widget>[
                Center(
                  heightFactor: 20,
  //                widthFactor: 50,
                  child: Container(
                    child: Text('Welcome ${snapshot.data.email}'),
                  ),
                ),
                FlatButton(
                  child: Text('Click to go blog page'),
                  color: Colors.lightGreenAccent,
                  onPressed: (){
                    Navigator.pushNamed(context, '/blog');
                  },
                ),
                FlatButton(
                  child: Text('Click to go by category'),
                  color: Colors.lightGreenAccent,
                  onPressed: (){
                    Navigator.pushNamed(context, '/bycategory');
                  },
                ),
              ],
            );
          return Container();
        },
      ),
    );

  }
}


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        title: Text('Login'),
      ),
      body: Center(        
        child: Column(         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Login'),
              onPressed: (){
                Provider.of(context).auth.init(); // This is temporary fix needs to remove when found alternate solution
                Navigator.pushNamed(context, '/login');
                },
            ),
            RaisedButton(
              child: Text('SignIn with Google'),
              onPressed: () async {
                try{
                  final _auth = Provider.of(context).auth;
                  final id = await _auth.signInWithGoogle();
                  print('signed in with google $id');
                }catch(err){
                  print(err);
                }

              },
            )
          ],
        ),
      ),
      
    );
  }
}
