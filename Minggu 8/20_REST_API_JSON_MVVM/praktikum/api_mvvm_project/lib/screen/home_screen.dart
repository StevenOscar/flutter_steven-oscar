import 'package:api_mvvm_project/screen/contact/contact_screen.dart';
import 'package:api_mvvm_project/screen/dicebear/dicebear_bloc/dicebear_bloc.dart';
import 'package:api_mvvm_project/screen/dicebear/dicebear_generator_screen.dart';
import 'package:api_mvvm_project/screen/dicebear/dicebear_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Widget> pages = <Widget>[
    ContactScreen(),
    ImageGeneratorScreen(),
    ImageSearchScreen(),
  ];

  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    context.read<DicebearBloc>().add(const PageChangedDicebearEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contact & Dicebear API"),
      ),
      body: SingleChildScrollView(child: pages[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        iconSize: 30,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone_rounded),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_rounded),
            label: 'Random image',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search image',
          ),
        ],
      ),
    );
  }
}
