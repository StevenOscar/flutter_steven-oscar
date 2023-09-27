import 'package:flutter/material.dart';
import 'gallery_page.dart';
import 'page/image_detail_page.dart';
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
      initialRoute: RoutesNavigation().galleryPage,
      routes: {
        RoutesNavigation().galleryPage: (_) => const GalleryPage(),
        RoutesNavigation().imageDetailPage: (_) => const ImageDetailPage(),
      },
    );
  }
}