import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class InfilateFirebaseUser {
  InfilateFirebaseUser(this.user);  
  User? user;
  bool get loggedIn => user != null;
}

InfilateFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<InfilateFirebaseUser> infilateFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<InfilateFirebaseUser>(
            (user) => currentUser = InfilateFirebaseUser(user));
