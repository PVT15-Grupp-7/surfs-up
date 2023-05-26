import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:surfs_up/services/authentication_service.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    // Initialize Firebase
    await Firebase.initializeApp();
  });

  late AuthenticationService authService;

  setUp(() {
    authService = AuthenticationService();
  });

  test('signInAnonymously - successful sign-in', () async {
    // Act
    final result = await authService.signInAnonymously();

    // Assert
    expect(result, isNotNull);
  });

  test('signInAnonymously - sign-in error', () async {
    // Act
    final result = await authService.signInAnonymously();

    // Assert
    expect(result, isNull);
  });
}
