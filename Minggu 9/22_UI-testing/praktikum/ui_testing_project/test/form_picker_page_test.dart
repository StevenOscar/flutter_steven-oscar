import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:ui_testing_project/pages/form_picker_page.dart';

// Halaman dari soal prioritas 1 tugas Advance Form (Soal Prioritas 1 tugas UI Testing)
void main() {
  testWidgets('Title di appbar harus berjudul Interactive Widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: FormPickerPage()
    ));

    expect(find.widgetWithText(AppBar,'Interactive Widgets'), findsOneWidget);
  });

  testWidgets('Menampilkan drawer ketika icon ditekan/slide', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: FormPickerPage()
    ));

    expect(find.byType(Drawer), findsNothing);
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();
    expect(find.byType(Drawer), findsOneWidget);
  });

  testWidgets('Menampilkan Date Picker', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: FormPickerPage()
    ));

    expect(find.text("Date"), findsOneWidget);
    expect(find.text(DateFormat('dd-MM-yyyy').format(DateTime.now())), findsOneWidget);

    await tester.tap(find.widgetWithText(TextButton, 'Select'));
    await tester.pumpAndSettle();
  });

  testWidgets('Menampilkan Color Picker', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: FormPickerPage()
    ));

    expect(find.byWidgetPredicate((widget) =>
    widget is Container && widget.color == Colors.orange),
    findsOneWidget);

    expect(find.text("Color"), findsOneWidget);

    await tester.tap(find.widgetWithText(TextButton, 'Select'));
    await tester.pumpAndSettle();
  });

  testWidgets('Menampilkan File Picker', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: FormPickerPage()
    ));

    expect(find.text("Pick Files"), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Pick and open file'), findsOneWidget);

    await tester.tap(find.text('Pick and open file'));
    await tester.pumpAndSettle();
  });
}
