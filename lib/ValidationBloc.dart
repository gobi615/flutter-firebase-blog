import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

import 'Validator.dart';

abstract class BaseValidation {

  Stream<String> get email;
  Stream<String> get password;


  Stream<bool> get submitValid;


  Function(String) get changeEmail;
  Function(String) get changePassword;

  dispose();

}

class ValidationBloc extends BaseValidation with Validators{

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();


  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);


  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;


  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p){
        print(e);
        print(p);
        if(e!= null && p != null)
          return true;
        return false;
      } );



  dispose() {
    _email.close();
    _password.close();

  }

}
