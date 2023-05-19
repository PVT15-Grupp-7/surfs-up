import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:surfs_up/services/authentication_service.dart';
import 'package:firebase_core/firebase_core.dart';

// Create a mock FirebaseAuth instance
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// Create a testing subclass of AuthenticationService
class TestingAuthenticationService extends AuthenticationService {
  TestingAuthenticationService() : super();

  // Provide a public method to set the _auth field
  void setMockAuth(FirebaseAuth auth) {
    auth = auth;
  }
}

void main() {
  late TestingAuthenticationService authenticationService;
  late MockFirebaseAuth mockFirebaseAuth;

  setUpAll(() async {
    // Initialize Flutter
    TestWidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase
    await Firebase.initializeApp();

    mockFirebaseAuth = MockFirebaseAuth();
    authenticationService = TestingAuthenticationService();
    authenticationService.setMockAuth(mockFirebaseAuth);
  });

  test('signInWithEmailAndPassword should return null if an error occurs',
      () async {
    // Set up mock values
    const email = 'test@example.com';
    const password = 'password';
    final mockUserCredential = MockUserCredential();
    final mockUser = MockUser();

    // Configure mock FirebaseAuth to return an error
    when(mockFirebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    )).thenThrow(FirebaseException(
      code: 'test-error-code',
      message: 'Test error message',
      plugin: '',
    ));

    // Call the sign-in method
    final result =
        await authenticationService.signInWithEmailAndPassword(email, password);

    // Verify that the result is null
    expect(result, isNull);
  });
}

// Mock classes for FirebaseAuth, UserCredential, and User
class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}
