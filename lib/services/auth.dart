import 'package:firebase_auth/firebase_auth.dart';
import 'package:rozrywka/services/database.dart';

abstract class BaseAuth {
  Stream<String> get userID;
  Future<String> get userEmail;
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<String> signInWithEmailAndPassword(String email,String  password) async{
    FirebaseUser user = (await _firebaseAuth
        .signInWithEmailAndPassword(
    email: email, password: password)).user;
    return user.uid;
  }
  @override
  Future<String> createUserWithEmailAndPassword(String email,String  password) async{
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password)).user;
    return user.uid;
  }
  //return UID as String
  @override
  Stream<String> get userID {
    print("get userID");
    return _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) => user?.uid);
  }
  @override
  Future<void> signOut()async{
    _firebaseAuth.signOut();
  }
  @override
  Future<String> get userEmail async{
    FirebaseUser user = (await _firebaseAuth.currentUser());
    return user.email;
  }
}
