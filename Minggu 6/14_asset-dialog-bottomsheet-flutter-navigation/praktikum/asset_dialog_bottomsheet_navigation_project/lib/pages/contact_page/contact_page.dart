import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../dialog_bottomsheet_functions.dart';
import '../../functions/contact_functions.dart';
import '../../models/contact_model.dart';
import '../../themes/theme_colors.dart';
import '../../themes/theme_text_style.dart';
import '../../widgets/contact_widgets/color_picker_widget.dart';
import '../../widgets/contact_widgets/date_picker_widget.dart';
import '../../widgets/contact_widgets/elevated_button_contact_widget.dart';
import '../../widgets/contact_widgets/file_picker_widget.dart';
import '../../widgets/contact_widgets/text_field_widget.dart';
import '../../widgets/drawer_widget.dart';
import 'page_header.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String _nameValue = "";
  String _numberValue = "";
  DateTime pickedDateValue = DateTime.now();
  Color pickedColorValue = ThemeColors().m3SysLightOnPrimaryContainer;
  PlatformFile? profilePictureFile;

  String? errorTextName;
  String? errorTextNumber;

  bool _isNameValid = false;
  bool _isNumberValid = false;
  bool _isFilePicked = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  static List<ContactModel> contactList = [];

  void clearField(){
    _nameController.clear();
    _numberController.clear();
    _isNameValid = false;
    _isNumberValid = false;
    _isFilePicked = false;
    _nameValue = "";
    _numberValue = "";
    pickedDateValue = DateTime.now();
    pickedColorValue = ThemeColors().m3SysLightOnPrimaryContainer;
    profilePictureFile = null;
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        centerTitle: true,
        backgroundColor: ThemeColors().m3SysLightPrimary,
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal : 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  const PageHeader(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15
                    ),
                    child: Divider(
                      height: 2,
                      endIndent: 24,
                      indent: 24,
                      color: ThemeColors().m3SysLightOutlineVariant,
                    ),
                  ),
                  FilePickerWidget(              //Menggunakan filetype image di file picker karena kasus menentukan foto profil
                    isFilePicked: _isFilePicked,
                    currentPicture: profilePictureFile,
                    borderColor: pickedColorValue,
                    onPicked: (selectedFile) {
                      setState(() {
                        profilePictureFile = selectedFile;
                        if(profilePictureFile != null){
                          _isFilePicked = true;
                        } else {
                          _isFilePicked = false;
                        }
                      });
                    }
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height : 77,                      //height tidak sesuai design figma karena harus menampilkan errortext
                    child: TextFieldWidget(
                      controller: _nameController,
                      hintText: "Insert Your Name",
                      label: "Name",
                      errorText: errorTextName,
                      onChanged: (val){
                        setState(() {
                          _nameValue = val;
                          _isNameValid = nameValidator(
                            val: val,
                          )["isNameValid"];
                          errorTextName = nameValidator(
                            val: val,
                          )["errorTextName"];
                        });
                      },
                    ),
                  ),
                  const SizedBox(height : 14),
                  SizedBox(
                    width: double.infinity,
                    height: 77,                      //height tidak sesuai design figma karena harus menampilkan errortext
                    child: TextFieldWidget(
                      controller: _numberController,
                      hintText: "+62 ....",
                      label: "Nomor",
                      errorText: errorTextNumber,
                      keyboardType: TextInputType.phone,
                      onChanged: (val){
                        setState(() {
                          _numberValue = val;
                          _isNumberValid = numberValidator(
                            val: val,
                          )["isNumberValid"];
                          errorTextNumber = numberValidator(
                            val: val,
                          )["errorTextNumber"];
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ColorPickerWidget(
                      currentColor: pickedColorValue,
                      onPicked: (selectedColor) {
                        setState(() {
                          pickedColorValue = selectedColor;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top : 14, bottom: 24),
                    child: DatePickerWidget(
                      currentDate: pickedDateValue,
                      onPicked: (selectedDate) {
                        setState(() {
                          pickedDateValue = selectedDate;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButtonContactWidget(
                        text: "Submit",
                        fixedSize: const Size(250, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                        ),
                        onPressed: _isNameValid && _isNumberValid == true ? () {
                          setState(() {
                            if(profilePictureFile!=null){
                              addContact(
                                contactList: contactList,
                                nameValue: _nameValue,
                                numberValue: _numberValue,
                                pickedColorValue: pickedColorValue,
                                pickedDateValue: pickedDateValue,
                                profilePictureFile: profilePictureFile
                              );
                              clearField();
                            } else {
                                addContact(
                                  contactList: contactList,
                                  nameValue: _nameValue,
                                  numberValue: _numberValue,
                                  pickedColorValue: pickedColorValue,
                                  pickedDateValue: pickedDateValue,
                                );
                                clearField();
                              }
                          });
                        } : null
                      )
                    ]
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 48, bottom: 15),
                    child: Text(
                      "List Contacts",
                      style: ThemeTextStyles().m3HeadlineSmall,
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: contactList.length,
                    itemBuilder: (context, index) {
                      ContactModel contactItem = contactList[index];
                      return Column(
                        children: [
                          ListTile(
                            titleAlignment: ListTileTitleAlignment.center,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.grey.shade300, width: 3)
                            ),
                            tileColor: const Color.fromARGB(255, 243, 238, 255),
                            leading: CircleAvatar(
                              radius: 35,
                              backgroundColor: contactItem.profileBorderColor,
                              child: CircleAvatar(
                                radius : 24,
                                backgroundColor: ThemeColors().m3SysLightPrimaryContainer,
                                child: contactItem.profilePicture == null ?
                                Text(
                                  contactItem.name[0],
                                  style: ThemeTextStyles().m3TitleMedium,
                                ) :
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    width: 100,
                                    File(contactItem.profilePicture!.path.toString()),
                                    fit: BoxFit.fill,
                                  ),
                                )
                              ),
                            ),
                            title: Text(
                              contactItem.name,
                              style: ThemeTextStyles().m3BodyLargeListView,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contactItem.number,
                                  style: ThemeTextStyles().m3BodyMedium,
                                ),
                                Text(
                                  "Birth : ${DateFormat('d MMMM yyyy').format(contactList[index].birthDate)}",
                                  style: ThemeTextStyles().m3BodySmall,
                                ),
                              ]
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  iconSize: 24,
                                  icon : Icon(
                                    Icons.edit,
                                    color: ThemeColors().m3RefNeutralNeutral10
                                  ),
                                  onPressed: () async {
                                    contactList = await editContactDialog(
                                      index : index,
                                      context: context,
                                      contactItem: contactItem,
                                      contactList: contactList
                                    );
                                    setState(() {});
                                  }
                                ),
                                IconButton(
                                  iconSize: 24,
                                  icon: Icon(
                                    Icons.delete,
                                    color: ThemeColors().m3RefNeutralNeutral10
                                  ),
                                  onPressed: () async {
                                    contactList = await deleteContactDialog(
                                      context: context,
                                      index: index,
                                      contactItem: contactItem,
                                      contactList: contactList
                                    );
                                    setState(() {});
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 12)
                        ],
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}