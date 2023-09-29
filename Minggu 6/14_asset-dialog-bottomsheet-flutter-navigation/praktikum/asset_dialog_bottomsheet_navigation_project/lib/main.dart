import 'package:flutter/material.dart';
import 'pages/contact_page/contact_page.dart';
import 'home_page.dart';
import 'pages/gallery_page/gallery_page.dart';
import 'pages/gallery_page/image_detail_page.dart';
import 'routes_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}