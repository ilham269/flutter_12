// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:praktek/main.dart';

void main() {
  testWidgets('dashboard links to the online store and exercises', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Dashboard Latihan'), findsOneWidget);
    expect(find.text('Daftar Latihan'), findsOneWidget);

    await tester.tap(find.text('Toko Online'));
    await tester.pumpAndSettle();
    expect(find.text('Toko Elektronik'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Latihan 3'));
    await tester.pumpAndSettle();
    expect(find.text('Pemasukan'), findsOneWidget);
  });
}
