import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surfs_up/pages/navigation_admin.dart';

void main() {
  testWidgets('Logout confirmation dialog', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return ElevatedButton(
              onPressed: () {
                _showLogoutConfirmationDialog(context);
              },
              child: const Text('Show Dialog'),
            );
          },
        ),
      ),
    );

    // Tap the "Show Dialog" button to trigger the dialog
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Verify that the dialog is displayed
    expect(find.text('Log Out'), findsOneWidget);
    expect(find.text('Are you sure you want to log out?'), findsOneWidget);

    // Tap the "No" button to dismiss the dialog
    await tester.tap(find.text('No'));
    await tester.pumpAndSettle();

    // Verify that the dialog is dismissed
    expect(find.text('Log Out'), findsNothing);
    expect(find.text('Are you sure you want to log out?'), findsNothing);
  });
}

Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'No',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Closes the dialog
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () async {
              Navigator.of(context).pop(); // Closes the dialog
            },
          ),
        ],
      );
    },
  );
}
