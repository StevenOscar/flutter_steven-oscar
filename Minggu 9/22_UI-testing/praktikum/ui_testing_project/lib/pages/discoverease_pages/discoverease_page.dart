import 'package:flutter/material.dart';
import '../../widgets/drawer_widget.dart';
import 'about_us_section.dart';
import 'contact_us_section.dart';
import 'header_section.dart';
import 'welcome_section.dart';
import '../../themes/theme_text_style.dart';
import '../../widgets/discoverease_widgets/floating_action_button_widget.dart';

// Halaman dari aplikasi yang telah dikembangkan (Soal Eksplorasi tugas UI Testing)

class DiscovereasePage extends StatefulWidget {
  const DiscovereasePage({super.key});

  @override
  State<DiscovereasePage> createState() => _DiscovereasePageState();
}

class _DiscovereasePageState extends State<DiscovereasePage> {
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
              scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.list,
              size: 35,
              color: Colors.black,
            )
          )
        ],
      ),
      drawer: const DrawerWidget(),
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