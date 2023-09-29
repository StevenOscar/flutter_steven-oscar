import 'package:flutter/material.dart';

import '../../models/image_model.dart';

class ImageDetailPage extends StatelessWidget {
  const ImageDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageParameter = ModalRoute.of(context)!.settings.arguments as ImageModel;

    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: const Text(
          "Image Detail Page",
          style: TextStyle(
            fontWeight: FontWeight.w600
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: ClipRect(
          child :Image.asset(
            imageParameter.image,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}