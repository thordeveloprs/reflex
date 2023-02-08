import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ReflexFirebaseUser {
  ReflexFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ReflexFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ReflexFirebaseUser> reflexFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ReflexFirebaseUser>(
      (user) {
        currentUser = ReflexFirebaseUser(user);
        return currentUser!;
      },
    );
