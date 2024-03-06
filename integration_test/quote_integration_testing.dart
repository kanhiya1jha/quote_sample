import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:signifydemo/feature/quote/presentation/screen/quote_screen.dart';
import 'package:signifydemo/feature/quote/presentation/screen/quote_slide_widget.dart';
import 'package:signifydemo/main.dart' as app;


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
      'end to end test',
          () {
        testWidgets(
            'verify QuoteScreen open',
                (tester) async {
              app.main();
              await tester.pumpAndSettle();
               await Future.delayed(const Duration(seconds: 10));
              await tester.tap(find.byKey(Key('next')));
              expect(find.byKey(Key('author')), findsOneWidget);
              expect(find.byKey(Key('quote')), findsOneWidget);
              await tester.tap(find.byKey(Key('next')));
              expect(find.byKey(Key('author')), findsOneWidget);
              expect(find.byKey(Key('quote')), findsOneWidget);
            });
      }
  );
}
