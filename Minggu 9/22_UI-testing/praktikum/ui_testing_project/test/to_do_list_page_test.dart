import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing_project/pages/to_do_list_page.dart';

// Halaman baru yang belum pernah dibuat (Soal Prioritas 2 tugas UI Testing)
void main() {
  testWidgets('Title di appbar harus berjudul To Do List', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ToDoListPage(),
    ));

    expect(find.widgetWithText(AppBar,'To Do List'), findsOneWidget);
  });

  testWidgets('Menampilkan textfield, tombol submit, dan drawer ketika icon ditekan/slide', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ToDoListPage(),
    ));

    expect(find.byType(TextField), findsOneWidget);

    expect(find.byType(Drawer), findsNothing);
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();
    expect(find.byType(Drawer), findsOneWidget);
  });

  testWidgets('Ketika textfield di input, maka tampilan yang dimasukkan harus sesuai', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ToDoListPage(),
    ));

    await tester.enterText(find.byType(TextField), "Test Task");

    expect(find.widgetWithText(TextField,"Test Task"), findsOneWidget);
  });

  testWidgets('Ketika data dari textfield disubmit, tampilkan teks yang diinput dan icon delete', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ToDoListPage(),
    ));

    await tester.enterText(find.byType(TextField), "Test Task");
    await tester.tap(find.widgetWithText(ElevatedButton, "Submit"));
    await tester.pump();

    expect(find.widgetWithText(ListTile, "Test Task"), findsOneWidget);
    expect(find.widgetWithIcon(ListTile, Icons.delete), findsOneWidget);
  });

  testWidgets('Ketika data di submit, maka textfield akan menjadi kosong', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ToDoListPage(),
    ));

    await tester.enterText(find.byType(TextField), "Test Task");
    await tester.tap(find.widgetWithText(ElevatedButton, "Submit"));
    await tester.pump();

    expect(find.widgetWithText(TextField,"Test Task"), findsNothing);
  });
}
