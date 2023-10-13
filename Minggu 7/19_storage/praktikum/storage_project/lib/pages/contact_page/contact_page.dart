import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:storage_project/pages/contact_page/page_appbar.dart';
import '../../bloc/contact_data/contact_data_bloc.dart';
import '../../bloc/form_color/form_color_bloc.dart';
import '../../bloc/form_date/form_date_bloc.dart';
import '../../bloc/form_file/form_file_bloc.dart';
import '../../bloc/form_name/form_name_bloc.dart';
import '../../bloc/form_number/form_number_bloc.dart';
import '../../component/contact_dialog.dart';
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

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameBloc = context.read<FormNameBloc>();
    final numberBloc = context.read<FormNumberBloc>();
    final colorBloc = context.read<FormColorBloc>();
    final dateBloc = context.read<FormDateBloc>();
    final fileBloc = context.read<FormFileBloc>();

    final contactDataBloc = context.read<ContactDataBloc>();
    contactDataBloc.add(ContactDataFetchDatabaseEvent());

    return Scaffold(
      appBar: const PageAppbar(),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  const PageHeader(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 2,
                      endIndent: 24,
                      indent: 24,
                      color: ThemeColors().m3SysLightOutlineVariant,
                    ),
                  ),
                  BlocBuilder<FormColorBloc, FormColorState>(
                    builder: (context, state) {
                      return FilePickerWidget(
                        borderColor: state.pickedColorValue,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 77,
                    child: BlocBuilder<FormNameBloc, FormNameState>(
                      builder: (context, state) {
                        return TextFieldContactWidget(
                          controller: state.nameController,
                          hintText: "Insert Your Name",
                          label: "Name",
                          errorText: state.errorTextName,
                          onChanged: (val) {
                            nameBloc.add(FormInputNameEvent(nameValue: val));
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 77,
                    child: BlocBuilder<FormNumberBloc, FormNumberState>(
                      builder: (context, state) {
                        return TextFieldContactWidget(
                          controller: state.numberController,
                          hintText: "+62 ....",
                          label: "Nomor",
                          errorText: state.errorTextNumber,
                          keyboardType: TextInputType.phone,
                          onChanged: (val) {
                            numberBloc.add(FormInputNumberEvent(numberValue: val));
                          },
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: ColorPickerWidget(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 14, bottom: 24),
                    child: DatePickerWidget(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButtonContactWidget(
                        text: "Submit",
                        fixedSize: const Size(250, 48),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        onPressed:
                          context.watch<FormNameBloc>().state.isNameValid &&
                          context.watch<FormNumberBloc>().state.isNumberValid == true ? ()
                          {
                            contactDataBloc.add(
                              ContactDataAddedEvent(
                                nameValue: nameBloc.state.nameValue,
                                numberValue: numberBloc.state.numberValue,
                                colorValue: colorBloc.state.pickedColorValue,
                                dateValue: dateBloc.state.pickedDateValue,
                                fileValue: fileBloc.state.pickedFileValue
                              )
                            );
                            nameBloc.add(FormNameClearFieldEvent());
                            numberBloc.add(FormNumberClearFieldEvent());
                            colorBloc.add(FormColorClearFieldEvent());
                            dateBloc.add(FormDateClearFieldEvent());
                            fileBloc.add(FormFileClearFieldEvent());
                          }
                          : null
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
                  BlocBuilder<ContactDataBloc, ContactDataState>(
                    builder: (context, state) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.contactList.length,
                        itemBuilder: (context, index) {
                          ContactModel contactItem = state.contactList[index];
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
                                  tileColor:const Color.fromARGB(255, 243, 238, 255),
                                  leading: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: contactItem.profileBorderColor,
                                    child: CircleAvatar(
                                        radius: 24,
                                        backgroundColor: ThemeColors().m3SysLightPrimaryContainer,
                                        child: contactItem.profilePicture == null ?
                                          Text(
                                            contactItem.name[0],
                                            style: ThemeTextStyles().m3TitleBig,
                                          )
                                        : ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Image.file(
                                              File(contactItem.profilePicture!.path.toString()),
                                              width: 100,
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
                                        icon: Icon(
                                          Icons.edit,
                                          color: ThemeColors().m3RefNeutralNeutral10
                                        ),
                                        onPressed: () {
                                          editContactDialog(
                                            context: context,
                                            index: index,
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
