import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class ChatService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  //Method to search users by email
  Stream<List<AppUser>> searchUsersByEmail(String emailQuery) {
    final currentUserId = _auth.currentUser?.uid;

    return _db
        .collection('users')
        .where('email', isGreaterThanOrEqualTo: emailQuery)
        .where('email', isLessThanOrEqualTo: '$emailQuery\uf8ff')
        .limit(10)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => AppUser.fromMap(doc.data()))
              .where((user) => user.uid != currentUserId) //Exclude current user
              .toList(),
        );
  }
}
