import 'package:flutter/material.dart';

import '../../models/tourist_destination_model.dart';
import '../../themes/theme_text_style.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox( //gambar background
          height: 1050,
          child: Image.asset(
            "assets/images/background4.jpg",
            fit: BoxFit.fitHeight,
          ),
        ),
        Container( // Untuk filter penggelap background
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [Colors.black45, Colors.black87],
            ),
          ),
          height: 1050,
        ),
        Container(
          height: 1050,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Text(
                  "About Us",
                  style: ThemeTextStyles().headlineMediumWhite,
                ),
                const SizedBox(height: 40),
                Text(
                  "Are you interested in discovering many thing with us? here is our curated samples of many famous tourist attractions in Indonesia",
                  textAlign: TextAlign.center,
                  style: ThemeTextStyles().bodyMediumShort,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 660,
                  width: 400,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    key: const Key("GridViewKey"),
                    scrollDirection: Axis.horizontal,
                    itemCount: touristDestinations.length,
                    itemBuilder: (context, index) {
                      TouristDestination destination = touristDestinations[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                destination.imagePath,
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      destination.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(destination.description),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
