import 'dart:async';

import 'package:flutter/material.dart';

import '../routes_navigation.dart';
import '../utils/shared_pref.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () async {
      String? username;
      String? token;
      Map<String,String>? userCredentialData;
      userCredentialData = await SharedPref().getUserCredential();
      username = userCredentialData["username"];
      token = userCredentialData["token"];
      if(username == "" || token == ""){
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNavigation().loginPage,
          (route) => false
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNavigation().homePage,
          (route) => false
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.contacts,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(width: 50),
              Icon(
                Icons.photo_album,
                color: Colors.white,
                size: 100,
              )
            ],
          ),
          SizedBox(height: 50),
          Text(
            "Contact & Gallery App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.w700
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}