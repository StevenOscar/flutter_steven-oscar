import 'package:flutter_bloc/flutter_bloc.dart';
import '/widgets/contact_widgets/elevated_button_contact_widget.dart';
import '../bloc/contact_data/contact_data_bloc.dart';
import '../bloc/form_color/form_color_bloc.dart';
import '../bloc/form_date/form_date_bloc.dart';
import '../bloc/form_file/form_file_bloc.dart';
import '../bloc/form_name/form_name_bloc.dart';
import '../bloc/form_number/form_number_bloc.dart';
import '../themes/theme_text_style.dart';
import 'package:flutter/material.dart';
import '../widgets/contact_widgets/color_picker_widget.dart';
import '../widgets/contact_widgets/date_picker_widget.dart';
import '../widgets/contact_widgets/file_picker_widget.dart';
import '../widgets/contact_widgets/text_field_widget.dart';

  void editContactDialog({
    required int index,
    required BuildContext context,
  }) {
    final nameBloc = context.read<FormNameBloc>();
    final numberBloc = context.read<FormNumberBloc>();
    final colorBloc = context.read<FormColorBloc>();
    final dateBloc = context.read<FormDateBloc>();
    final fileBloc = context.read<FormFileBloc>();

    final contactDataBloc = context.read<ContactDataBloc>();

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        nameBloc.add(FormNameSetFieldEvent(index: index, contactList: contactDataBloc.state.contactList));
        numberBloc.add(FormNumberSetFieldEvent(index: index, contactList: contactDataBloc.state.contactList));
        colorBloc.add(FormColorSetFieldEvent(index: index, contactList: contactDataBloc.state.contactList));
        dateBloc.add(FormDateSetFieldEvent(index: index, contactList: contactDataBloc.state.contactList));
        fileBloc.add(FormFileSetFieldEvent(index: index, contactList: contactDataBloc.state.contactList));
        return WillPopScope(
          onWillPop: () async {return false;},
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
                  BlocBuilder<FormColorBloc,FormColorState>(
                    builder: (context, state) {
                      return FilePickerWidget(borderColor: colorBloc.state.pickedColorValue);
                    }
                  ),
                  const SizedBox(height: 14),
                  BlocBuilder<FormNameBloc,FormNameState>(
                    builder: (context, state) {
                      return TextFieldContactWidget(
                        controller: nameBloc.state.nameController,
                        errorText: nameBloc.state.errorTextName,
                        hintText: "Edit name",
                        label: "Name",
                        onChanged: (val){
                          nameBloc.add(FormInputNameEvent(nameValue: val));
                        }
                      );
                    }
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<FormNumberBloc,FormNumberState>(
                    builder: (context, state) {
                      return TextFieldContactWidget(
                        controller: numberBloc.state.numberController,
                        errorText: numberBloc.state.errorTextNumber,
                        hintText: "Edit number",
                        label: "Nomor",
                        keyboardType: TextInputType.phone,
                        onChanged: (val){
                          numberBloc.add(FormInputNumberEvent(numberValue: val));
                        }
                      );
                    }
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ColorPickerWidget()
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
                onPressed: () async{
                  Navigator.pop(context);
                  await Future.delayed(const Duration(milliseconds: 120));
                  nameBloc.add(FormNameClearFieldEvent());
                  numberBloc.add(FormNumberClearFieldEvent());
                  colorBloc.add(FormColorClearFieldEvent());
                  dateBloc.add(FormDateClearFieldEvent());
                  fileBloc.add(FormFileClearFieldEvent());
                },
                child: Text(
                  'Cancel',
                  style : ThemeTextStyles().m3TitleSmall
                ),
              ),
              BlocBuilder<FormNameBloc, FormNameState>(
                builder: (context, state) {
                  return BlocBuilder<FormNumberBloc, FormNumberState>(
                    builder: (context, state) {
                      return ElevatedButtonContactWidget(
                        text: "Done",
                        fixedSize: const Size(80, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed:
                          context.watch<FormNameBloc>().state.isNameValid &&
                          context.watch<FormNumberBloc>().state.isNumberValid == true ? () async
                          {
                            Navigator.pop(context);
                            await Future.delayed(const Duration(milliseconds: 120));
                            contactDataBloc.add(
                              ContactDataEditedEvent(
                                index: index,
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
                          } : null
                      );
                    },
                  );
                },
              )
            ],
          ),
        );
      }
    );
  }

  void deleteContactDialog({
    required index,
    required BuildContext context,
  }) async {
    final contactDataBloc = context.read<ContactDataBloc>();
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
                "Are you sure you want to delete '${contactDataBloc.state.contactList[index].name}' data?",
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
                  contactDataBloc.add(ContactDataDeletedEvent(index: index)
                  );
                }
              )
            ],
          ),
        );
      },
    );
  }
