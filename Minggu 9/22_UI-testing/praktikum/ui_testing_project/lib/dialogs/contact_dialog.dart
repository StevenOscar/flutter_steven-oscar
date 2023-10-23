import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../functions/contact_functions.dart';
import '../models/contact_model.dart';
import '../themes/theme_text_style.dart';
import '../widgets/contact_widgets/color_picker_widget.dart';
import '../widgets/contact_widgets/date_picker_widget.dart';
import '../widgets/contact_widgets/elevated_button_contact_widget.dart';
import '../widgets/contact_widgets/file_picker_widget.dart';
import '../widgets/contact_widgets/text_field_widget.dart';

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