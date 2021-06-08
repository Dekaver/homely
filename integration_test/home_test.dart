import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homely/Screens/Login/components/body.dart';
import 'package:homely/Screens/Login/login_screen.dart';
import 'package:homely/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Sign in test example", (WidgetTester tester) async {
    /*
    * Setups the finder*/
    final Finder signInEmailField = find.byKey(Key('signinEmailField'));
    final Finder signInPasswordField = find.byKey(Key('signinPasswordField'));
    final Finder signInSaveButton = find.byKey(Key('loginButton'));

    await tester.pumpWidget(MyApp());

    /*
    * pump and settle is same like waitfor in flutter_driver
    * */
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key('signinEmailField')));
    await tester.enterText(signInEmailField, "admin@gmail.com");

    await tester.tap(signInPasswordField);
    await tester.enterText(signInPasswordField, "12345678");

    await tester.tap(signInSaveButton);
    print("button tapped");

    await tester.pumpAndSettle(Duration(seconds: 3));

    expect(
        find.byWidgetPredicate((widget) =>
            widget is AppBar &&
            widget.title is Text &&
            (widget.title as Text).data.startsWith("Homely")),
        findsOneWidget);

    await tester.pumpAndSettle(Duration(seconds: 3));
  });

  testWidgets("validate test drive ", (WidgetTester tester) async {
    final Finder signInEmailField = find.byKey(Key('signinEmailField'));
    final Finder signInSaveButton = find.byKey(Key('loginButton'));

    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle();

    await tester.enterText(signInEmailField, "");

    await tester.tap(signInSaveButton);

    await tester.pumpAndSettle(Duration(seconds: 1));

    expect(
        find.byWidgetPredicate((widget) =>
            widget is Text && widget.data.contains("Enter an email")),
        findsOneWidget);

    await tester.pumpAndSettle(Duration(seconds: 1));
  });
}
