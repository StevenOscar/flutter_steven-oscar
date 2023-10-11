import 'package:flutter/material.dart';
import 'package:storage_project/utils/shared_pref.dart';
import 'package:storage_project/widgets/gallery_widgets/elevated_button_gallery_widget.dart';
import 'routes_navigation.dart';
import 'widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  String? token;
  Map<String,String>? userCredentialData;

  void initial() async {
    userCredentialData = await SharedPref().getUserCredential();
    username = userCredentialData?["username"];
    token = userCredentialData?["token"];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Contact & Gallery App"),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"
        ),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome $username",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Text(
                  "Please Select desired app from Drawer\n\n\n Or ...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              ElevatedButtonGalleryWidget(
                fixedSize: const Size(185, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                onPressed: () {
                  SharedPref().removeUserCredential();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesNavigation().loginPage,
                    (route) => false
                  );
                },
                text: "Log Out"
              )
            ],
          ),
          ),
      )
    );
  }
}