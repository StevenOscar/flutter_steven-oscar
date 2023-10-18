import 'package:api_mvvm_project/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen/contact/contact_bloc/contact_bloc.dart';
import 'screen/contact/text_bloc/text_bloc.dart';
import 'screen/dicebear/dicebear_bloc/dicebear_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactBloc(),
        ),
        BlocProvider(
          create: (context) => TextBloc(),
        ),
        BlocProvider(
          create: (context) => DicebearBloc(),
        ),
      ],
      child:  MaterialApp(
        initialRoute: '/home',
        routes: {
          '/home' :(_) => const HomeScreen()
        }
      ),
    );
  }
}