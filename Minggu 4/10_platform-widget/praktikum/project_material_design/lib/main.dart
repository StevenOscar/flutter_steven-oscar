// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'material_design.dart';
import 'list_view_task.dart';
import 'my_flutter_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // const MaterialDesign();            //Untuk Soal Prioritas 1 nomor 1
        // const ListViewTask();              //Untuk Soal Prioritas 1 nomor 2
        const MyFlutterApp();              //Untuk Soal Eksplorasi
  }
}