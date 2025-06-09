class User {
  final String uid; //Firease User ID
  final String email;
  final String username;

  User({required this.uid, required this.email, required this.username});

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'username': username};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
    );
  }
}
