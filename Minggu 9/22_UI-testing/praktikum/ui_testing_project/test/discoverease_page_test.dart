import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing_project/models/tourist_destination_model.dart';
import 'package:ui_testing_project/pages/discoverease_pages/about_us_section.dart';
import 'package:ui_testing_project/pages/discoverease_pages/contact_us_section.dart';
import 'package:ui_testing_project/pages/discoverease_pages/discoverease_page.dart';
import 'package:ui_testing_project/pages/discoverease_pages/header_section.dart';
import 'package:ui_testing_project/pages/discoverease_pages/welcome_section.dart';

// Halaman dari aplikasi yang telah dikembangkan (Soal Eksplorasi tugas UI Testing)
void main() {
  testWidgets('Judul Appbar harus DiscoverEase dan terdapat drawer di icon menu', (WidgetTester tester) async {
    await tester.pumpWidget( MaterialApp(
      home: const DiscovereasePage(),
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
    ));

    expect(find.widgetWithText(AppBar,'DiscoverEase'), findsOneWidget);
    expect(find.image(const AssetImage("assets/images/logo2.png")), findsOneWidget);
    expect(find.byType(Drawer), findsNothing);

    await tester.tap(find.byIcon(Icons.list));
    await tester.pump();

    expect(find.byType(Drawer), findsOneWidget);
  });

  testWidgets('Menampilkan Header section beserta dengan isinya', (WidgetTester tester) async {
    await tester.pumpWidget( MaterialApp(
      home: const DiscovereasePage(),
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
    ));

    expect(find.byType(HeaderSection), findsOneWidget);

    expect(find.image(const AssetImage("assets/images/background1.jpg")), findsOneWidget);
    expect(find.image(const AssetImage("assets/images/logo1.png")), findsOneWidget);
  });

  testWidgets('Mencoba floating action button untuk scroll halaman', (WidgetTester tester) async {
    await tester.pumpWidget( MaterialApp(
      home: const DiscovereasePage(),
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
    ));

    expect(find.byType(HeaderSection), findsOneWidget);

    await tester.tap(find.widgetWithIcon(FloatingActionButton,Icons.arrow_drop_down_outlined));
    await tester.pumpAndSettle();
  });

  testWidgets('Menampilkan Header section beserta dengan isinya', (WidgetTester tester) async {
    await tester.pumpWidget( MaterialApp(
      home: const DiscovereasePage(),
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
    ));

    expect(find.byType(WelcomeSection), findsOneWidget);

    await tester.tap(find.widgetWithIcon(FloatingActionButton,Icons.arrow_drop_down_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to\nDiscoverEase App', findRichText: true), findsOneWidget);
    expect(find.text('Your Most Reliable Travel Companion'), findsOneWidget);
    expect(find.text('DiscoverEase is an app to unlock your best travel experiences. Let us guide you to many hidden gems, popular attractions, local favorites, and many more. We are ensuring every journey is filled with joy and ease.'), findsOneWidget);

    expect(find.image(const AssetImage("assets/images/background2.jpg")), findsOneWidget);
  });

  testWidgets('Menampilkan Contact Us section beserta dengan isinya', (WidgetTester tester) async {
    await tester.pumpWidget( MaterialApp(
      home: const DiscovereasePage(),
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
    ));

    expect(find.byType(ContactUsSection), findsOneWidget);

    expect(find.text('Contact Us'), findsOneWidget);
    expect(find.text("We'd love to hear from you! Whether you're interested in seeking new travel destination, have inquiries about our services, or just want to share your thoughts, please drop us a message below."), findsOneWidget);
    expect(find.text('First Name'), findsWidgets);
    expect(find.text('Last Name'), findsWidgets);
    expect(find.text('Email'), findsWidgets);
    expect(find.text('Message'), findsWidgets);
    expect(find.text('Please Fill the Data first'), findsOneWidget);
    expect(find.image(const AssetImage("assets/images/background3.jpg")), findsOneWidget);

    await tester.enterText(
      find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == "First Name"),
      "Steven"
    );
    await tester.enterText(
      find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == "Last Name"),
      "Oscar"
    );
    await tester.enterText(
      find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == "Insert your email"),
      "stevenoscar99@gmail.com"
    );
    await tester.enterText(
      find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == "Insert your Message"),
      "Aplikasi ini sangat membantu. Terima kasih"
    );

    expect(find.text('Steven'), findsWidgets);
    expect(find.text('Oscar'), findsWidgets);
    expect(find.text('stevenoscar99@gmail.com'), findsWidgets);
    expect(find.text('Aplikasi ini sangat membantu. Terima kasih'), findsWidgets);

    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ElevatedButton, "Submit"), warnIfMissed: false);
  });

  testWidgets('Menampilkan About Us section beserta dengan isinya', (WidgetTester tester) async {
    await tester.pumpWidget( MaterialApp(
      home: const DiscovereasePage(),
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
    ));

    expect(find.byType(AboutUsSection), findsOneWidget);

    expect(find.text('About Us'), findsOneWidget);
    expect(find.text('Are you interested in discovering many thing with us? here is our curated samples of many famous tourist attractions in Indonesia'), findsOneWidget);
    expect(find.image(const AssetImage("assets/images/background4.jpg")), findsOneWidget);

    for(int i = 0; i<touristDestinations.length;i++){
      await tester.dragUntilVisible(
        find.text(touristDestinations[i].name),
        find.byKey(const ValueKey('GridViewKey')),
        const Offset(-125, 0)
      );
      expect(find.text(touristDestinations[i].name), findsWidgets);
      expect(find.text(touristDestinations[i].description), findsWidgets);
      expect(find.image(AssetImage(touristDestinations[i].imagePath)), findsWidgets);
    }
  });
}
