import 'package:connecting_firebase/helper/helper_function.dart';
import 'package:connecting_firebase/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Constructor to initialize Firebase
  AuthService() {
    Firebase.initializeApp(); // Initialize Firebase in the constructor
  }

  // login
  Future loginWithUserNameandPassword(String email, String password) async {
    try {
      UserCredential authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = authResult.user;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register
  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      UserCredential authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = authResult.user;

      if (user != null) {
        // call our database service to update the user data.
        await DatabaseService(uid: user.uid).savingUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // signout
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserNameSF("");
      await _firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
