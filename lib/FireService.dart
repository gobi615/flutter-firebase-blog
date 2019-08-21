import 'package:firebase_auth/firebase_auth.dart';




class FireService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthResult authResult;
  Future<FirebaseUser> get getUser => _auth.currentUser();
//  Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

  Future<AuthResult> signInWithEmailAndPass(String email, String password) async {
    authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return authResult;
  }
}