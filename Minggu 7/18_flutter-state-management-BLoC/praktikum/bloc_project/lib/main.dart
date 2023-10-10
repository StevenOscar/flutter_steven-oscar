import 'package:bloc_project/bloc/contact_data/contact_data_bloc.dart';
import 'package:bloc_project/bloc/form_name/form_name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/form_color/form_color_bloc.dart';
import 'bloc/form_date/form_date_bloc.dart';
import 'bloc/form_file/form_file_bloc.dart';
import 'bloc/form_number/form_number_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<FormNameBloc>(create: (context) => FormNameBloc()),
        BlocProvider<FormNumberBloc>(create: (context) => FormNumberBloc()),
        BlocProvider<FormColorBloc>(create: (context) => FormColorBloc()),
        BlocProvider<FormDateBloc>(create: (context) => FormDateBloc()),
        BlocProvider<FormFileBloc>(create: (context) => FormFileBloc()),
        BlocProvider<ContactDataBloc>(create: (context) => ContactDataBloc())
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