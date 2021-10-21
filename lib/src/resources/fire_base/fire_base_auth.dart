import 'package:firebase_auth/firebase_auth.dart';
class FirAuth{
  FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
  void logOut() async{
    await _firebaseAuth.signOut();
  }
}