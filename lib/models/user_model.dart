class AppUser {
  final String uid; //Firease User ID
  final String email;
  final String username;

  AppUser({required this.uid, required this.email, required this.username});

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'username': username};
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
    );
  }
}
