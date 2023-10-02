import '../routes_navigation.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {

  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> imageCategory = ["Animal","Panorama","Vehicle"];
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
          Column(
            children: [
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
            ],
          ),
          ExpansionTile(
            backgroundColor: Colors.grey[200],
            title: const Text(
              "Gallery Page",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),
            ),
            children: [
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: imageCategory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListTile(
                      title: Text(
                        imageCategory[index],
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_right_sharp),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                          context,
                          RoutesNavigation().galleryPage,
                          arguments: imageCategory[index]
                        );
                      },
                    ),
                  );
                },
              ),
            ]
          ),
        ],
      ),
    );
  }
}