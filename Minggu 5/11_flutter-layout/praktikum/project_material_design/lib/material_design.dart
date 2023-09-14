import 'package:flutter/material.dart';

class MaterialDesign extends StatelessWidget {
  const MaterialDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : "Tugas Platform & Layout Widget",
      theme : ThemeData.dark(),
      home: const Home()
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MaterialApp"),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title : Text("Home"),
            ),
            ListTile(
              title : Text("Settings"),
            )
          ],
        ),
      ),
      body : const Center(
        child: Text("This is MaterialApp"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings"
          ),
        ],
      ),
    );
  }
}