import 'package:flutter/cupertino.dart';

import 'cupertino_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home : CupertinoDesign(),
      theme: CupertinoThemeData(
        brightness: Brightness.dark
      )
    );
  }
}