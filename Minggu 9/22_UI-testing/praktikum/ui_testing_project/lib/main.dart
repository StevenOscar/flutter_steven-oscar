import 'package:flutter/material.dart';
import 'package:ui_testing_project/pages/form_picker_page.dart';
import 'package:ui_testing_project/pages/to_do_list_page.dart';
import 'home_page.dart';
import 'pages/contact_pages/contact_page.dart';
import 'pages/discoverease_pages/discoverease_page.dart';
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

        // Halaman dari aplikasi yang telah dikembangkan (Soal Eksplorasi tugas UI Testing)
        RoutesNavigation().contactPage: (_) => const ContactPage(),

        // Halaman dari soal prioritas 1 tugas Advance Form (Soal Prioritas 1 tugas UI Testing)
        RoutesNavigation().formPickerPage: (_) => const FormPickerPage(),

        // Halaman dari aplikasi yang telah dikembangkan (Soal Eksplorasi tugas UI Testing)
        RoutesNavigation().discovereasePage: (_) => const DiscovereasePage(),

        // Halaman baru yang belum pernah dibuat (Soal Prioritas 2 tugas UI Testing)
        RoutesNavigation().toDoListPage: (_) => const ToDoListPage(),
      },
    );
  }
}