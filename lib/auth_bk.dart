import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

import 'Validator.dart';

abstract class BaseAuth {
  Stream<String> get onAuthStateChanged;
  Future<String> _signInWithEmailAndPassword(
      String email,
      String password,
      );
  Future<String> _createUserWithEmailAndPassword(
      String email,
      String password,
      );

  Future<FirebaseUser> currentUser();
  Future<void> signOut();
  Future<String> signInWithGoogle();


  Stream<String> get email;
  Stream<String> get password;
  Stream<dynamic> get response;

  Stream<bool> get submitValid;


  Function(String) get changeEmail;
  Function(String) get changePassword;
  Function(dynamic) get responseErr;

  Future<String> submit();

}

class Auth extends BaseAuth with Validators{

  final _auth = FirebaseAuth.instance;
  final _gAuth = GoogleSignIn();

  @override
  Future<String> _createUserWithEmailAndPassword (String email, String password) async {
    return (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user.uid;
  }

  @override
  Future<FirebaseUser> currentUser() async {
    return (await _auth.currentUser());
  }

  @override
  Stream<String> get onAuthStateChanged => _auth.onAuthStateChanged.map((user) => user.uid);

  @override
  Future<String> _signInWithEmailAndPassword(String email, String password) async {
    return (await _auth.signInWithEmailAndPassword(email: email, password: password)).user.uid;
  }

  @override
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount account = await _gAuth.signIn();
    final GoogleSignInAuthentication _gSignAuth = await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: _gSignAuth.accessToken,
      idToken: _gSignAuth.idToken,
    );
    return (await _auth.signInWithCredential(credential)).user.uid;

  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }



  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _response = BehaviorSubject<dynamic>();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<dynamic> get response => _response.stream;

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(dynamic) get responseErr => _response.sink.add;

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p){
        print(e);
        print(p);
        if(e!= null && p != null)
          return true;
        return false;
      } );


  Future<String> submit() async {
    String email = _email.value.trim();
    String pass = _password.value.trim();
    print(email);
    print(pass);
    PlatformException v ;

    var result;
    try{
      result = await _signInWithEmailAndPassword(email, pass);
      responseErr(null);
    }catch(err){
      responseErr(err);
    }
    return result;
  }

  dispose() {
    _email.close();
    _password.close();
    _response.close();
  }

}
