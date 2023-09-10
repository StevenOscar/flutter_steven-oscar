import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Halo Alterra'),          //teks judul appbar yang diubah
    );
  }
}

// Mengubah menjadi stateless karena sudah tidak membutuhkan counter dan update realtime
class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: const Center(
        child: Text(
          'Nama saya adalah Steven Oscar',        //text yang diubah sesuai nama
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w400,
          )
        ),
      ),
    );
  }
}
