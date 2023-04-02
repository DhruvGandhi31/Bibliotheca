import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // UserModel _userFromFirebaseUser(User user) {
  //   return user != null
  //       ? UserModel(
  //           username: username,
  //           email: email,
  //           phone_no: phone_no,
  //           student_id: student_id,
  //           pswd: pswd)
  //       : null;
  // }

  //sign in anonymous
  Future signInanon() async {
    try {
      //Authresult --> Usercredential
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //auth change user stream
  // Stream<User?> get user {
  //   return _auth.authStateChanges();
  // }

  //signin with email
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
