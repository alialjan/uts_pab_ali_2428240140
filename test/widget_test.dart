// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:utspab_ali_2428240140/main.dart';

void main() {
  testWidgets('Tinutuan detail page renders', (WidgetTester tester) async {
    final originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (details.exception is NetworkImageLoadException) {
        return;
      }
      FlutterError.presentError(details);
    };

    addTearDown(() => FlutterError.onError = originalOnError);

    await tester.pumpWidget(const MainApp());

    expect(find.text('Tinutuan'), findsOneWidget);
    expect(find.text('Deskripsi'), findsOneWidget);
    expect(find.text('Galeri'), findsOneWidget);
    expect(find.text('Nama'), findsOneWidget);
    expect(find.text('NPM'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(find.byTooltip('Tambahkan ke favorit'));
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
