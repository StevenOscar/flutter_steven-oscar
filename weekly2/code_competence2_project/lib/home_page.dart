import 'package:code_competence2_project/themes/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'pages/about_us_section.dart';
import 'pages/contact_us_section.dart';
import 'pages/header_section.dart';
import 'pages/welcome_section.dart';
import 'widgets/elevated_button_widget.dart';
import 'widgets/floating_action_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      key : scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title : Text(
          "DiscoverEase",
          style: ThemeTextStyles().headlineSmallBlack,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            top : 10,
            bottom : 10,
            left : 12,
            right : 10,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1),
            child: Image.asset(
              "assets/images/logo2.png",
              fit: BoxFit.fill
            )
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(
              Icons.list,
              size: 35,
              color: Colors.black,
            )
          )
        ],
      ),
      endDrawer: Drawer(          //Navigation Drawer tidak berfungsi
        child: Padding(
          padding: const EdgeInsets.only(top : 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Log in',
                  fixedSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Contact Us',
                  fixedSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'About Us',
                  fixedSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body : SingleChildScrollView(
        controller: scrollController,
        child: const Column(
          children: [
            HeaderSection(),
            WelcomeSection(),
            ContactUsSection(),
            AboutUsSection()
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