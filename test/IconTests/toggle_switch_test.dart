import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

bool isSwitched = false;
Color switchedColor = Colors.red;
void toggleSwitch() {
  if (isSwitched == false) {
    isSwitched = true;
    switchedColor = Colors.green;
  } else {
    isSwitched = false;
    switchedColor = Colors.red;
  }
}

void main() {
  testWidgets('test toggleSwitch', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  toggleSwitch();
                },
                child: const Text('Toggle Switch'),
              );
            },
          ),
        ),
      ),
    );

    // Initial state
    expect(isSwitched, false);
    expect(switchedColor, Colors.red);

    // Tap the button to toggle the switch
    await tester.tap(find.text('Toggle Switch'));
    await tester.pump();

    // Verify the updated state after the toggle
    expect(isSwitched, true);
    expect(switchedColor, Colors.green);

    // Tap the button again to toggle back
    await tester.tap(find.text('Toggle Switch'));
    await tester.pump();

    // Verify the updated state after the second toggle
    expect(isSwitched, false);
    expect(switchedColor, Colors.red);
  });
}
