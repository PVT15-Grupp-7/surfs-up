import 'package:surfs_up/services/authentication_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

//denna lösning är en cookie-cutter från en yt-video men där implementering i Authservice är annorlunda och därför inte funkar

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

class MockAuthResult extends Mock implements UserCredential {}

void main() {
  MockFirebaseAuth auth = MockFirebaseAuth();
  BehaviorSubject<MockFirebaseUser> user = BehaviorSubject<MockFirebaseUser>();
  when(auth.authStateChanges()).thenAnswer((_) {
    return user;
  });

  AuthenticationService userRepo = AuthenticationService.instance(auth: auth);

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
      expect(repo.status, Status.Authenticated);
    });

    test("Sign out with google", () async {});
  });
}
