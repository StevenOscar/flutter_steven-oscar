import 'package:provider/provider.dart';
import '/routes_navigation.dart';
import '/widgets/contact_widgets/elevated_button_contact_widget.dart';
import 'providers/contact_data_change_notifier.dart';
import 'providers/form_color_change_notifier.dart';
import 'providers/form_date_change_notifider.dart';
import 'providers/form_file_change_notifier.dart';
import 'providers/form_number_change_notifier.dart';
import 'providers/form_name_change_notifier.dart';
import 'widgets/gallery_widgets/elevated_button_gallery_widget.dart';
import 'themes/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'models/image_model.dart';
import 'widgets/contact_widgets/color_picker_widget.dart';
import 'widgets/contact_widgets/date_picker_widget.dart';
import 'widgets/contact_widgets/file_picker_widget.dart';
import 'widgets/contact_widgets/text_field_widget.dart';

  void editContactDialog({
    required int index,
    required BuildContext context,
  }) {
    final nameProvider = Provider.of<FormNameChangeNotifier>(context,listen: false);
    final numberProvider = Provider.of<FormNumberChangeNotifier>(context, listen: false);
    final colorProvider = Provider.of<FormColorChangeNotifier>(context, listen: false);
    final dateProvider = Provider.of<FormDateChangeNotifier>(context, listen: false);
    final fileProvider = Provider.of<FormFileChangeNotifier>(context, listen: false);

    final contactDataProvider = Provider.of<ContactDataChangeNotifier>(context, listen: false);

    nameProvider.setField(index: index, contactList: contactDataProvider.contactList);
    numberProvider.setField(index: index, contactList: contactDataProvider.contactList);
    colorProvider.setField(index: index, contactList: contactDataProvider.contactList);
    dateProvider.setField(index: index, contactList: contactDataProvider.contactList);
    fileProvider.setField(index: index, contactList: contactDataProvider.contactList);

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder:(context, setState) {
            return WillPopScope(
              onWillPop: ()async {return false;},
              child: AlertDialog(
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
                      Consumer<FormColorChangeNotifier>(
                        builder: (context, colorProvider, child) {
                          return FilePickerWidget(borderColor: colorProvider.pickedColorValue);
                        }
                      ),
                      const SizedBox(height: 14),
                      TextFieldWidget(
                        controller: nameProvider.nameController,
                        errorText: nameProvider.errorTextName,
                        hintText: "Edit name",
                        label: "Name",
                        onChanged: (val){
                          nameProvider.nameOnChanged(val: val);
                          setState(() {});
                        }
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        controller: numberProvider.numberController,
                        errorText: numberProvider.errorTextNumber,
                        hintText: "Edit nomor",
                        label: "Nomor",
                        keyboardType: TextInputType.phone,
                        onChanged: (val){
                          numberProvider.numberOnChanged(val: val);
                          setState(() {});
                        }
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ColorPickerWidget(
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical : 14),
                        child: DatePickerWidget(),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      nameProvider.clearField();
                      numberProvider.clearField();
                      colorProvider.clearField();
                      dateProvider.clearField();
                      fileProvider.clearField();
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
                    onPressed: (nameProvider.isNameValid && numberProvider.isNumberValid) ? () {
                      //Button tidak dijadikan provider karena perlu reset field provider lain
                      Navigator.pop(context);
                      contactDataProvider.editContact(
                        index: index,
                        nameValue: nameProvider.nameValue,
                        numberValue: numberProvider.numberValue,
                        pickedColorValue: colorProvider.pickedColorValue,
                        pickedDateValue: dateProvider.pickedDateValue,
                        profilePictureFile: fileProvider.pickedPictureFile
                      );
                      nameProvider.clearField();
                      numberProvider.clearField();
                      colorProvider.clearField();
                      dateProvider.clearField();
                      fileProvider.clearField();
                    } : null
                  ),
                ],
              ),
            );
          }
        );
      },
    );
  }

  void deleteContactDialog({
    required index,
    required BuildContext context,
  }) {
    final contactDataProvider = Provider.of<ContactDataChangeNotifier>(context, listen: false);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: ()async {return false;},
          child: AlertDialog(
            title: Text(
              "Delete Contact",
              style: ThemeTextStyles().m3HeadlineSmall,
              textAlign: TextAlign.center,
            ),
            content: Padding(
              padding: const EdgeInsets.only(top : 12),
              child: Text(
                "Are you sure you want to delete '${contactDataProvider.contactList[index].name}' data?",
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
                  contactDataProvider.deleteContact(
                    index: index
                  );
                }
              )
            ],
          ),
        );
      },
    );
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