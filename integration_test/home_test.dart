import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homely/Screens/Login/components/body.dart';
import 'package:homely/Screens/Login/login_screen.dart';
import 'package:homely/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Sign in test ", (WidgetTester tester) async {
    /*
    * Setups the finder*/

    final Finder title = find.byKey(Key('title'));

    final Finder signInEmailField = find.byKey(Key('signinEmailField'));
    final Finder buttonKeyLogin = find.byKey(Key('buttonKeyLogin'));
    final Finder signInPasswordField = find.byKey(Key('signinPasswordField'));
    final Finder signInSaveButton = find.byKey(Key('loginButton'));

    await tester.pumpWidget(MyApp());

    /*
    * pump and settle is same like waitfor in flutter_driver
    * */
    await tester.pumpAndSettle();

    await tester.tap(buttonKeyLogin);

    await tester.pumpAndSettle(Duration(seconds: 3));

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
      findsOneWidget
    );
  });
}
