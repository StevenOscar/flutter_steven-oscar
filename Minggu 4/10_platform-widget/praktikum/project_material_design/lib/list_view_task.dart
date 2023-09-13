import 'package:flutter/material.dart';

import 'contacts.dart';

class ListViewTask extends StatelessWidget {
  const ListViewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title : "Tugas Platform & Layout Widget",
      home : Home()
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View Contacts"),
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
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor:  const Color(0xFF66a958),
              child: Text(contacts[index].username[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                )
              ),
            ),
            title: Text(contacts[index].username),
            subtitle: Text(contacts[index].phone),
          );
        },
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