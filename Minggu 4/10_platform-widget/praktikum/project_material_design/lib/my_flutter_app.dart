import 'package:flutter/material.dart';

import 'course.dart';

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title : "Tugas Platform & Layout Widget",
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE),
        centerTitle: true,
        elevation: 0,
        title: const Text("My Flutter App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white70,)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ListView.separated(
          itemCount: listCourse.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
              child:
                Text("Learn ${listCourse[index].courseName}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18
                ),
              )
            );
          },
          separatorBuilder: (context, index) => const Divider(
            indent: 20,
            endIndent: 20
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF03DAC5),
        child: const Icon(Icons.add, color: Colors.black)
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF6200EE),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error),
            label: "Information"
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[350],
      ),
    );
  }
}