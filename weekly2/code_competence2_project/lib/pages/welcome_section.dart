import 'package:flutter/material.dart';

import '../themes/theme_text_style.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(                //gambar background
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Image.asset(
            "assets/images/background2.jpg",
            fit: BoxFit.fitHeight,
            )
        ),
        Container(                  // Untuk filter penggelap background
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end : Alignment.bottomCenter,
              colors: [
                Colors.black45,
                Colors.black87
              ]
            )
          ),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35, vertical: 110
          ),
          child: Column(
            children: [
              RichText(
                text:TextSpan(
                  text: "Welcome to",
                  style: ThemeTextStyles().headlineLarge,
                  children: [
                    TextSpan(
                      text: "\nDiscoverEase", style: ThemeTextStyles().headlineLargeOrange
                    ),
                    TextSpan(
                      text: " App", style: ThemeTextStyles().headlineLarge,
                    )
                  ]
                ),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    style: BorderStyle.solid,
                  ),
                  color: Colors.lightBlue.shade600.withOpacity(0.9)
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,vertical: 10
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3, vertical: 1
                  ),
                  child: Text(
                    "Your Most Reliable Travel Companion",
                    style: ThemeTextStyles().bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "DiscoverEase is an app to unlock your best travel experiences. Let us guide you to many hidden gems, popular attractions, local favorites, and many more. We are ensuring every journey is filled with joy and ease.",
                textAlign: TextAlign.center,
                style: ThemeTextStyles().bodyMediumNormalWhite,
              )
            ],
          ),
        )
      ]
    );
  }
}