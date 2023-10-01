import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(          //gambar background
          color : Colors.transparent,
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Image.asset(
            "assets/images/background1.jpg",
            fit: BoxFit.fitHeight,
            )
        ),
        Container(                  // Untuk filter penggelap background
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end : Alignment.bottomCenter,
              colors: [
                Colors.black26,
                Colors.black38
              ]
            )
          ),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
        ),
        Center(
          heightFactor: 3.2,
          child: SizedBox(
            width: MediaQuery.of(context).size.width *0.7,
            height: MediaQuery.of(context).size.width *0.6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                "assets/images/logo1.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ]
    );
  }
}