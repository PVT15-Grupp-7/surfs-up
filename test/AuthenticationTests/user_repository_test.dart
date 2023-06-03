import 'package:surfs_up/services/authentication_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

class MockAuthResult extends Mock implements UserCredential {}

void main() {
  MockFirebaseAuth auth = MockFirebaseAuth();
  BehaviorSubject<MockFirebaseUser> user = BehaviorSubject<MockFirebaseUser>();
  when(auth.authStateChanges()).thenAnswer((_) {
    return user;
  });

  AuthenticationService userRepo = AuthenticationService();

  group('user repoistory test', () {
    when(auth.signInWithEmailAndPassword(email: "email", password: "password"))
        .thenAnswer((_) {
      user.add(MockFirebaseUser());
      return Future.value(MockAuthResult());
    });
    test("Sign in with email and password", () async {
      bool signedIn =
          await userRepo.signInWithEmailAndPassword("email", "password");
      expect(signedIn, true);
      expect(userRepo.user.isEmpty, false);
    });

    test("Sign out with google", () async {});
  });
}
