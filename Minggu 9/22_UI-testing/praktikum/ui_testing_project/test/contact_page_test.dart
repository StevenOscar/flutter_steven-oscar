import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:ui_testing_project/pages/contact_pages/contact_page.dart';
import 'package:ui_testing_project/widgets/contact_widgets/file_picker_widget.dart';

// Halaman dari soal eksplorasi tugas Advance Form (Soal Prioritas 1 tugas UI Testing)
void main() {
  testWidgets('Title di appbar harus berjudul Contacts', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage()
    ));

    expect(find.widgetWithText(AppBar,'Contacts'), findsOneWidget);
  });

  testWidgets('Menampilkan drawer ketika icon ditekan/slide', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage()
    ));

    expect(find.byType(Drawer), findsNothing);
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();
    expect(find.byType(Drawer), findsOneWidget);
  });

  testWidgets('Menampilkan Header Contact', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage()
    ));

    expect(find.byIcon(Icons.phone_android_rounded), findsOneWidget);
    expect(find.text("Create New Contacts"),findsOneWidget);
    expect(find.text("Contacts with a Twist : \nPersonalize, Customize, Connect!"),findsOneWidget);
  });

  testWidgets('Menampilkan Kondisi awal dari form', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage()
    ));

    expect(find.byType(FilePickerWidget), findsOneWidget);
    expect(
      find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == "Insert Your Name"),
      findsOneWidget
    );
    expect(
      find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == "+62 ...."),
      findsOneWidget
    );
    expect(find.byWidgetPredicate((widget) =>
    widget is Container && widget.color == const Color(0xFF21005D)),
    findsOneWidget);
    expect(find.text(DateFormat('d MMMM yyyy').format(DateTime.now())), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, "Submit"), findsOneWidget);
    expect(find.text("List Contacts"),findsOneWidget);
  });

  testWidgets('Menampilkan errortext textfield yang sesuai', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage()
    ));

    var nameTextField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == "Insert Your Name");
    var numberTextField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == "+62 ....");

    await tester.enterText(nameTextField, "StevenO");
    await tester.pumpAndSettle();
    expect(find.text("Nama minimal terdiri dari 2 kata"), findsOneWidget);

    await tester.enterText(nameTextField, "steven oscar");
    await tester.pumpAndSettle();
    expect(find.text("Setiap kata harus diawali dengan huruf kapital", skipOffstage: true), findsOneWidget);

    await tester.enterText(nameTextField, "SS123 S#");
    await tester.pumpAndSettle();
    expect(find.text("Nama tidak boleh mengandung angka/karakter khusus", skipOffstage: true), findsOneWidget);


    await tester.enterText(numberTextField, "S8273981rs");
    await tester.pumpAndSettle();
    expect(find.text("Nomor telepon harus terdiri dari angka saja", skipOffstage: true), findsOneWidget);

    await tester.enterText(numberTextField, "9849849292");
    await tester.pumpAndSettle();
    expect(find.text("Nomor telepon harus diawali angka 0", skipOffstage: true), findsOneWidget);

    await tester.enterText(numberTextField, "01234567899999999999999");
    await tester.pumpAndSettle();
    expect(find.text("Nomor telepon harus terdiri dari 8-15 digit", skipOffstage: true), findsOneWidget);
  });

  testWidgets('Mensubmit dan menampilkan data yang sudah diinput', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage()
    ));

    var nameTextField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == "Insert Your Name");
    var numberTextField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == "+62 ....");

    await tester.enterText(nameTextField, "Steven Oscar");
    await tester.pumpAndSettle();

    await tester.enterText(numberTextField, "0123456789");
    await tester.pumpAndSettle();

    await tester.dragUntilVisible(
      find.widgetWithText(ElevatedButton, "Submit"),
      find.byKey(const ValueKey('ScrollKey')),
      const Offset(0,200)
    );

    await tester.tap(find.widgetWithText(ElevatedButton, "Submit"));
    await tester.pumpAndSettle();

    expect(find.widgetWithText(ListTile, "Steven Oscar"), findsOneWidget);
    expect(find.widgetWithText(ListTile, "S"), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
    widget is CircleAvatar && widget.backgroundColor == const Color(0xFF21005D)),
    findsOneWidget);
    expect(find.widgetWithText(ListTile, "0123456789"), findsOneWidget);
    expect(find.widgetWithText(ListTile, "Birth : ${DateFormat('d MMMM yyyy').format(DateTime.now())}"), findsOneWidget);
    expect(find.widgetWithIcon(ListTile, Icons.delete), findsOneWidget);
    expect(find.widgetWithIcon(ListTile, Icons.edit), findsOneWidget);
  });
}
