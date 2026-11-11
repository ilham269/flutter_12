// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:praktek/main.dart';

void main() {
  testWidgets('home page opens list and scroll routes', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Halaman utama'), findsOneWidget);

    await tester.drag(find.byType(GridView), const Offset(0, -600));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('List View'));
    await tester.tap(find.text('List View'));
    await tester.pumpAndSettle();
    expect(find.text('Contoh ListView'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('SingleChildScrollView'));
    await tester.tap(find.text('SingleChildScrollView'));
    await tester.pumpAndSettle();
    expect(find.text('Contoh SingleChildScrollView'), findsOneWidget);
  });
}
