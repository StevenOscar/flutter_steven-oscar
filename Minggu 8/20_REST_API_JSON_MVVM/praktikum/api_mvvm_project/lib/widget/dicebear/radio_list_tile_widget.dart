import 'package:flutter/material.dart';

class RadioListTileWidget extends StatelessWidget {
  final void Function(String?)? onChanged;
  final String artStyle;
  const RadioListTileWidget({
    super.key,
    required this.onChanged,
    required this.artStyle
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text("Pixel Art"),
          value: "pixel-art",
          groupValue: artStyle,
          onChanged: onChanged
        ),
        RadioListTile(
          title: const Text("Lorelei"),
          value: "lorelei",
          groupValue: artStyle,
          onChanged: onChanged
        ),
        RadioListTile(
          title: const Text("Bottts"),
          value: "bottts",
          groupValue: artStyle,
          onChanged: onChanged
        ),
        RadioListTile(
          title: const Text("Adventurer"),
          value: "adventurer",
          groupValue: artStyle,
          onChanged: onChanged
        ),
      ],
    );
  }
}