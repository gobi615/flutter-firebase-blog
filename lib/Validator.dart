import 'dart:async';

class Validators {
  final validateEmail =
  StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.add(null);// This is temporary fix needs to remove when found alternate solution
      sink.addError('Enter a valid email');

    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if (password.length > 3) {
          sink.add(password);
        } else {
          sink.add(null);// This is temporary fix needs to remove when found alternate solution
          sink.addError('Password must be at least 4 characters');

        }
      });
}
