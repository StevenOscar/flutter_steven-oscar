import 'package:flutter/material.dart';
import 'package:project/widgets/floating_action_button_widget.dart';
import 'pages/contact_us_section.dart';
import 'pages/header_section.dart';
import 'pages/welcome_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      body : SingleChildScrollView(
        controller: scrollController,
        child: const Column(
          children: [
            HeaderSection(),
            WelcomeSection(),
            ContactUsSection()
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 10),
        child: FloatingActionButtonWidget(
          scrollController : scrollController
        ),
      )
    );
  }
}