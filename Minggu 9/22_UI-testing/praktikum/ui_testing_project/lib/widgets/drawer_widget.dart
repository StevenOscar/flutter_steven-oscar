import 'package:flutter/material.dart';

import '../routes_navigation.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green
            ),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  "Select Page",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ),
          // Halaman dari soal eksplorasi tugas Advance Form (Soal Prioritas 1 tugas UI Testing)
          ListTile(
            title: const Text(
              "Contact Page",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500
              ),
            ),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation().contactPage,
              );
            },
          ),
          // Halaman dari soal prioritas 1 tugas Advance Form (Soal Prioritas 1 tugas UI Testing)
          ListTile(
            title: const Text(
              "Form Picker Page",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500
              ),
            ),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation().formPickerPage,
              );
            },
          ),
          // Halaman dari aplikasi yang telah dikembangkan (Soal Eksplorasi tugas UI Testing)
          ListTile(
            title: const Text(
              "Discoverease Page",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500
              ),
            ),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation().discovereasePage,
              );
            },
          ),
          // Halaman baru yang belum pernah dibuat (Soal Prioritas 2 tugas UI Testing)
          ListTile(
            title: const Text(
              "To Do List Page",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500
              ),
            ),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation().toDoListPage,
              );
            },
          ),
        ],
      ),
    );
  }
}