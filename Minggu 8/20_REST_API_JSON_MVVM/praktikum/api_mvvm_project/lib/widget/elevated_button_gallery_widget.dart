import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Size fixedSize;
  final OutlinedBorder shape;
  final void Function()? onPressed;


  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.fixedSize,
    required this.shape,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: fixedSize,
        backgroundColor: Colors.lightBlue,
        shape: shape
      ),
      onPressed: onPressed,
      child: Text(text,
        maxLines: 2,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.normal
        )
      )
    );
  }
}