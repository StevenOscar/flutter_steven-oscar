import 'package:asset_dialog_bottomsheet_navigation_project/routes_navigation.dart';
import 'package:asset_dialog_bottomsheet_navigation_project/widgets/contact_widgets/elevated_button_contact_widget.dart';
import 'widgets/gallery_widgets/elevated_button_gallery_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'models/contact_model.dart';
import 'themes/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'models/image_model.dart';
import 'widgets/contact_widgets/color_picker_widget.dart';
import 'widgets/contact_widgets/date_picker_widget.dart';
import 'widgets/contact_widgets/file_picker_widget.dart';
import 'widgets/contact_widgets/text_field_widget.dart';
import 'functions/contact_functions.dart';

  Future<List<ContactModel>> editContactDialog({
    required int index,
    required BuildContext context,
    required ContactModel contactItem,
    required List<ContactModel> contactList
  }) async {
    bool isNameValid = true;
    bool isNumberValid = true;
    String? errorTextName;
    String? errorTextNumber;
    TextEditingController nameController = TextEditingController(text: contactItem.name);
    TextEditingController numberController = TextEditingController(text: contactItem.number);
    String nameValue = nameController.text;
    String numberValue = numberController.text;
    DateTime pickedDateValue = contactItem.birthDate;
    Color pickedColorValue = contactItem.profileBorderColor;
    PlatformFile? profilePictureFile = contactItem.profilePicture;
    bool isFilePicked = profilePictureFile == null ? false : true;

    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
          setState(() {});
            return AlertDialog(
              title: Center(
                child: Text(
                  'Edit Contact',
                  style: ThemeTextStyles().m3HeadlineSmall,
                ),
              ),
              content: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 14),
                    FilePickerWidget(
                      isFilePicked : isFilePicked,
                      currentPicture : contactItem.profilePicture,
                      borderColor: pickedColorValue,
                      onPicked: (selectedFile) {
                        profilePictureFile = selectedFile;
                        if(profilePictureFile != null){
                          isFilePicked = true;
                        } else {
                          isFilePicked = false;
                        }
                        setState(() {});
                      }
                    ),
                    const SizedBox(height: 14),
                    TextFieldWidget(
                      controller: nameController,
                      errorText: errorTextName,
                      hintText: "Edit name",
                      label: "Name",
                      onChanged: (val){
                        nameValue = val;
                        isNameValid = nameValidator(
                          val: val,
                        )["isNameValid"];
                        errorTextName = nameValidator(
                          val: val,
                        )["errorTextName"];
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      controller: numberController,
                      errorText: errorTextNumber,
                      hintText: "Edit nomor",
                      label: "Nomor",
                      keyboardType: TextInputType.phone,
                      onChanged: (val){
                        numberValue = val;
                        isNumberValid = numberValidator(
                          val: val,
                        )["isNumberValid"];
                        errorTextNumber = numberValidator(
                          val: val,
                        )["errorTextNumber"];
                        setState(() {});
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ColorPickerWidget(
                        currentColor: pickedColorValue,
                        onPicked: (selectedColor) {
                          pickedColorValue = selectedColor;
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical : 14),
                      child: DatePickerWidget(
                        currentDate: pickedDateValue,
                        onPicked: (selectedDate) {
                          pickedDateValue = selectedDate;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style : ThemeTextStyles().m3TitleSmall
                  ),
                ),
                ElevatedButtonContactWidget(
                  text: "Done",
                  fixedSize: const Size(80, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: (isNameValid && isNumberValid) ? () {
                    Navigator.pop(context);
                    setState(() {
                      editContact(
                        contactList: contactList,
                        index: index,
                        nameValue: nameValue,
                        numberValue: numberValue,
                        pickedColorValue: pickedColorValue,
                        pickedDateValue: pickedDateValue,
                        profilePictureFile: profilePictureFile
                      );
                    });
                  } : null
                ),
              ],
            );
          },
        );
      },
    );
    return contactList;
  }

  Future<List<ContactModel>> deleteContactDialog({
    required index,
    required BuildContext context,
    required ContactModel contactItem,
    required List<ContactModel> contactList
  }) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Delete Contact",
            style: ThemeTextStyles().m3HeadlineSmall,
            textAlign: TextAlign.center,
          ),
          content: Padding(
            padding: const EdgeInsets.only(top : 12),
            child: Text(
              "Are you sure you want to delete '${contactItem.name}' data?",
              style: ThemeTextStyles().m3BodyLargeTextField,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'No',
                style : ThemeTextStyles().m3TitleSmall
              ),
            ),
            ElevatedButtonContactWidget(
              text: "Yes",
              fixedSize: const Size(80, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: (){
                Navigator.pop(context);
                deleteContact(
                  contactList: contactList,
                  index: index
                );
              }
            )
          ],
        );
      },
    );
    return contactList;
  }

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
          ElevatedButtonGalleryWidget(
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
                width : 500,
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
          ElevatedButtonGalleryWidget(
            text: "No",
            fixedSize: const Size(90, 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 3),
          ElevatedButtonGalleryWidget(
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