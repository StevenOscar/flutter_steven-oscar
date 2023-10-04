import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/contact_page/contact_page.dart';
import 'home_page.dart';
import 'pages/gallery_page/gallery_page.dart';
import 'pages/gallery_page/image_detail_page.dart';
import 'providers/contact_data_change_notifier.dart';
import 'providers/form_color_change_notifier.dart';
import 'providers/form_date_change_notifider.dart';
import 'providers/form_file_change_notifier.dart';
import 'providers/form_number_change_notifier.dart';
import 'providers/form_name_change_notifier.dart';
import 'routes_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FormNameChangeNotifier>(create: (_) => FormNameChangeNotifier()),
        ChangeNotifierProvider<FormNumberChangeNotifier>(create: (_) => FormNumberChangeNotifier()),
        ChangeNotifierProvider<FormColorChangeNotifier>(create: (_) => FormColorChangeNotifier()),
        ChangeNotifierProvider<FormDateChangeNotifier>(create: (_) => FormDateChangeNotifier()),
        ChangeNotifierProvider<FormFileChangeNotifier>(create: (_) => FormFileChangeNotifier()),
        ChangeNotifierProvider<ContactDataChangeNotifier>(create: (_) => ContactDataChangeNotifier()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Poppins"
        ),
        initialRoute: RoutesNavigation().homePage,
        routes: {
          RoutesNavigation().homePage: (_) => const HomePage(),
          RoutesNavigation().contactPage: (_) => const ContactPage(),
          RoutesNavigation().galleryPage: (_) => const GalleryPage(),
          RoutesNavigation().imageDetailPage: (_) => const ImageDetailPage(),
        },
      ),
    );
  }
}