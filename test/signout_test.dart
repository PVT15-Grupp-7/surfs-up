import 'package:flutter_test/flutter_test.dart';
import 'package:surfs_up/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  group('AuthenticationService', () {
    late AuthenticationService authService;
    late MockFirebaseAuth mockFirebaseAuth;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      authService = AuthenticationService();
    });

    test('signOut - successful sign out', () async {
      // Mock the signOut method of FirebaseAuth
      // ignore: avoid_returning_null_for_void
      when(mockFirebaseAuth.signOut()).thenAnswer((_) async => null);

      // Perform the sign out
      final result = await authService.signOut();

      // Verify that the signOut method was called
      verify(mockFirebaseAuth.signOut()).called(1);

      // Assert that the result is null
      expect(result, isNull);

      // Clean up any resources used during the test
      // ...
    });

    test('signOut - sign out error', () async {
      // Mock the signOut method of FirebaseAuth to throw an error
      when(mockFirebaseAuth.signOut()).thenThrow(Exception('Sign out error'));

      // Perform the sign out
      final result = await authService.signOut();

      // Verify that the signOut method was called
      verify(mockFirebaseAuth.signOut()).called(1);

      // Assert that the result is null
      expect(result, isNull);

      // Clean up any resources used during the test
      // ...
    });

    // Add more test cases for different scenarios
    // ...
  });
}
