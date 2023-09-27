import 'package:asset_dialog_bottomsheet_navigation_project/routes_navigation.dart';
import 'package:asset_dialog_bottomsheet_navigation_project/widget/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'model/image_model.dart';

void showImageBottomSheet (BuildContext context,int index, List<ImageModel> filteredImages){
  ImageModel pickedImage = filteredImages[index];
  showModalBottomSheet(
    isDismissible: false,
    enableDrag: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
    context: context,
    builder: (context) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showImageDialog(context,pickedImage);
            },
            child: ClipRect(
              child : Container(
                padding: const EdgeInsets.only(left: 20,right: 20,top:30),
                child: Image.asset(
                  width : 500,
                  pickedImage.image,
                  fit: BoxFit.fitWidth,
                ),
              )
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical : 16, horizontal: 20),
            child: Text(
              "Tap the image to show it on Dialog",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          ElevatedButtonWidget(
            text: "Back",
            fixedSize: const Size(300, 40),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}

void showImageDialog (BuildContext context,ImageModel pickedImage){
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        actionsOverflowAlignment: OverflowBarAlignment.center,
        title: Text(
          "${pickedImage.category} Photo",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w700
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRect(
              child : Image.asset(
                // width : 500,
                pickedImage.image,
                fit: BoxFit.fitWidth,
              )
            ),
            const SizedBox(height: 16),
            const Text(
              "Do you want to open this image on another page?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )
          ],
        ),
        actions: [
          ElevatedButtonWidget(
            text: "No",
            fixedSize: const Size(90, 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 3),
          ElevatedButtonWidget(
            text: "Yes",
            fixedSize: const Size(90, 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation().imageDetailPage,
                arguments: pickedImage
              );
            },
          ),
        ],
      );
    },
  );
}