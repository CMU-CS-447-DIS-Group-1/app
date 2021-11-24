import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
class FirAuth{
  FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
  void logOut() async{
    await _firebaseAuth.signOut();
  }

  void data(String name, String gender,String cmnd,String address,String WhereStart,String WhereEnd){
    final User user = _firebaseAuth.currentUser;
    final uid = user.uid;
    var users={
      "NameOfStd": name,
      "Gender": gender,
      "CMND": cmnd,
      "Address": address,
      "WhereStart":WhereStart,
      "WhereEnd": WhereEnd,
    };
    var ref= FirebaseDatabase.instance.reference().child("RoadsterList");
    ref.child(uid).set(users).then((user){

    }).catchError((onError){});
  }
}