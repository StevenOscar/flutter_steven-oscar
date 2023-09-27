import 'package:asset_dialog_bottomsheet_navigation_project/routes_navigation.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final List<String> imageCategory;

  const DrawerWidget({
    super.key,
    required this.imageCategory
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
              child: Text(
                "Select Image Category",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 37,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ),
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
        ],
      ),
    );
  }
}