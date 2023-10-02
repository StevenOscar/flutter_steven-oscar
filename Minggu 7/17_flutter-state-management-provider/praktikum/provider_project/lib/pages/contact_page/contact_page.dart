import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/providers/form_name_change_notifier.dart';
import '../../dialog_bottomsheet_functions.dart';
import '../../models/contact_model.dart';
import '../../providers/contact_data_change_notifier.dart';
import '../../providers/form_color_change_notifier.dart';
import '../../providers/form_date_change_notifider.dart';
import '../../providers/form_file_change_notifier.dart';
import '../../providers/form_number_change_notifier.dart';
import '../../themes/theme_colors.dart';
import '../../themes/theme_text_style.dart';
import '../../widgets/contact_widgets/color_picker_widget.dart';
import '../../widgets/contact_widgets/date_picker_widget.dart';
import '../../widgets/contact_widgets/elevated_button_contact_widget.dart';
import '../../widgets/contact_widgets/file_picker_widget.dart';
import '../../widgets/contact_widgets/text_field_widget.dart';
import '../../widgets/drawer_widget.dart';
import 'page_header.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameProvider = Provider.of<FormNameChangeNotifier>(context);
    final numberProvider = Provider.of<FormNumberChangeNotifier>(context);
    final colorProvider = Provider.of<FormColorChangeNotifier>(context);
    final dateProvider = Provider.of<FormDateChangeNotifier>(context);
    final fileProvider = Provider.of<FormFileChangeNotifier>(context);

    final contactDataProvider = Provider.of<ContactDataChangeNotifier>(context);

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
                    borderColor: colorProvider.pickedColorValue,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height : 77,                      //height tidak sesuai design figma karena harus menampilkan errortext
                    child: TextFieldWidget(
                      controller: nameProvider.nameController,
                      hintText: "Insert Your Name",
                      label: "Name",
                      errorText: nameProvider.errorTextName,
                      onChanged: (val){
                        nameProvider.nameOnChanged(val: val);
                      },
                    ),
                  ),
                  const SizedBox(height : 14),
                  SizedBox(
                    width: double.infinity,
                    height: 77,                      //height tidak sesuai design figma karena harus menampilkan errortext
                    child: TextFieldWidget(
                      controller: numberProvider.numberController,
                      hintText: "+62 ....",
                      label: "Nomor",
                      errorText: numberProvider.errorTextNumber,
                      keyboardType: TextInputType.phone,
                      onChanged: (val){
                        numberProvider.numberOnChanged(val: val);
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: ColorPickerWidget(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top : 14, bottom: 24),
                    child: DatePickerWidget(),
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
                        onPressed:
                          nameProvider.isNameValid && numberProvider.isNumberValid == true ? () {
                            //Button tidak dijadikan provider karena perlu reset field provider lain
                            contactDataProvider.addContact(
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
                    itemCount: contactDataProvider.contactList.length,
                    itemBuilder: (context, index) {
                      ContactModel contactItem = contactDataProvider.contactList[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              minVerticalPadding: 15,
                              titleAlignment: ListTileTitleAlignment.threeLine,
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
                                    style: ThemeTextStyles().m3TitleBig,
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
                                    "Birth : ${DateFormat('d MMMM yyyy').format(contactItem.birthDate)}",
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
                                    onPressed: () {
                                      editContactDialog(
                                        context: context,
                                        index : index,
                                      );
                                    }
                                  ),
                                  IconButton(
                                    iconSize: 24,
                                    icon: Icon(
                                      Icons.delete,
                                      color: ThemeColors().m3RefNeutralNeutral10
                                    ),
                                    onPressed: () {
                                      deleteContactDialog(
                                        context: context,
                                        index: index,
                                      );
                                    },
                                  )
                                ],
                              ),
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