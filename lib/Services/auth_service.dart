import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whisprr/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Sign Up Method
  Future<void> signUp(String email, String password, String username) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = result.user!.uid;

    AppUser user = AppUser(uid: uid, email: email, username: username);
    await _firestore
        .collection('users')
        .doc(uid)
        .set(user.toMap()); //Save user data to Firestore
  }

  //Login Method
  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  //Logout Method
  Future<void> logout() async {
    await _auth.signOut();
  }

  //Get current user
  User? get currentUser => _auth.currentUser;
}
