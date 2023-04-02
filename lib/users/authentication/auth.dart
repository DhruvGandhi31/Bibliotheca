import 'package:firebase_auth/firebase_auth.dart';
import '../../model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // UserModel _userFromFirebaseUser(User user) {}

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

  //signin with email

  //register

  //signout
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
