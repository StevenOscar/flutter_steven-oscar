import 'dart:io';
import 'package:advanced_form_project/widget/file_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/contacts.dart';
import 'page/page_header.dart';
import 'theme/theme_colors.dart';
import 'theme/theme_text_style.dart';
import 'widget/color_picker_widget.dart';
import 'widget/elevated_button_widget.dart';
import 'widget/text_field_widget.dart';
import 'widget/date_picker_widget.dart';
import 'package:file_picker/file_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _nameValue = "";
  String _numberValue = "";
  DateTime pickedDateValue = DateTime.now();
  Color pickedColorValue = ThemeColors().m3SysLightOnPrimaryContainer;
  PlatformFile? profilePictureFile;

  String? errorTextName;
  String? errorTextNumber;

  bool _isNameValid = false;
  bool _isNumberValid = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  List<Contacts> contactList = [];

  void _nameValidator(String val){
    if(val.isEmpty){
      errorTextName = "Nama harus diisi";
      _isNameValid = false;
    } else if(!(val.contains(" "))){
      errorTextName = "Nama minimal terdiri dari 2 kata";
      _isNameValid = false;
    } else if(RegExp(r'[0-9!@#$%^&*()_+{}\[\]:;<>,.?/~\\-]').hasMatch(val)){
      errorTextName = "Nama tidak boleh mengandung angka atau karakter khusus";
      _isNameValid = false;
    } else if(RegExp(r'\b[a-z][a-z]*\b').hasMatch(val)){
      errorTextName = "Setiap kata harus diawali dengan huruf kapital";
      _isNameValid = false;
    } else if(RegExp(r'^[A-Z][a-zA-Z]*(\s[A-Z][a-zA-Z]*)+$').hasMatch(val)){
      errorTextName = null;
      _isNameValid = true;
    } else {
      // kondisi bila user menginput nama dengan 2 kata, tapi menghapus kata kedua dan menyisakan spasinya saja
      errorTextName = "Nama minimal terdiri dari 2 kata";
      _isNameValid = false;
    }
  }

  void _numberValidator(String val){
    if(val.isEmpty){
      errorTextNumber = "Nomor telepon harus diisi";
      _isNumberValid = false;
    } else if(RegExp(r'[^\d]+$').hasMatch(val)){
      errorTextNumber = "Nomor telepon harus terdiri dari angka saja";
      _isNumberValid = false;
    } else if( (int.parse(val[0])!=0)){
      errorTextNumber = "Nomor telepon harus diawali angka 0";
      _isNumberValid = false;
    } else if((val.length < 8 || val.length > 15)){
      errorTextNumber = "Nomor telepon harus terdiri dari 8-15 digit";
      _isNumberValid = false;
    } else if(RegExp(r'^0[0-9]{6,14}$').hasMatch(val)){
      errorTextNumber = null;
      _isNumberValid = true;
    }
  }

  void addContact(){
    contactList.add(
      Contacts(
        name: _nameValue,
        number: _numberValue,
        profilePicture: profilePictureFile,
        birthDate: pickedDateValue,
        profileColor: pickedColorValue
      )
    );
    setState(() {
      clearField();
    });
  }

  void deleteContact(int index){
    contactList.removeAt(index);
    setState(() {});
  }

  void editContact(int index){
    contactList[index].name = _nameValue;
    contactList[index].number = _numberValue;
    contactList[index].birthDate = pickedDateValue;
    contactList[index].profileColor = pickedColorValue;
    contactList[index].profilePicture = profilePictureFile;
    setState(() {
      clearField();
    });
  }

  void editDialog(int index){
    showDialog(
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
                      isFilePicked: profilePictureFile == null ? false : true,
                      borderColor: pickedColorValue,
                      onPicked: (selectedFile) {
                        setState(() {
                          profilePictureFile = selectedFile;
                        });
                      }
                    ),
                    const SizedBox(height: 14),
                    TextFieldWidget(
                      controller: _nameController,
                      errorText: errorTextName,
                      hintText: "Edit name",
                      label: "Name",
                      onChanged: (val){
                        _nameValue = val;
                        _nameValidator(val);
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      controller: _numberController,
                      errorText: errorTextNumber,
                      hintText: "Edit nomor",
                      label: "Nomor",
                      keyboardType: TextInputType.phone,
                      onChanged: (val){
                        _numberValue = val;
                        _numberValidator(val);
                        setState(() {});
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
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
                      padding: const EdgeInsets.symmetric(vertical : 14),
                      child: DatePickerWidget(
                        onPicked: (selectedDate) {
                          setState(() {
                            pickedDateValue = selectedDate;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async{
                    Navigator.pop(context);
                    setState(() {
                      errorTextName = null;
                      errorTextNumber = null;
                      clearField();
                    });
                  },
                  child:  Text(
                    'Cancel',
                    style : ThemeTextStyles().m3TitleSmall
                  ),
                ),
                ElevatedButtonWidget(
                  text: "Done",
                  fixedSize: const Size(80, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: (_isNameValid && _isNumberValid) ? () {
                    Navigator.pop(context);
                    setState(() {
                      editContact(index);
                    });
                  } : null
                ),
              ],
            );
          },
        );
      },
    );
  }

  void deleteDialog(int index){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Delete Contact",
            style: ThemeTextStyles().m3HeadlineSmall,
          ),
          content: Text(
            "Are you sure you want to delete '${contactList[index].name}' data?",
            style: ThemeTextStyles().m3BodyMedium,
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
            ElevatedButtonWidget(
              text: "Yes",
              fixedSize: const Size(80, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: (){
                deleteContact(index);
                Navigator.pop(context);
              }
            )
          ],
        );
      },
    );
  }

  void clearField(){
    setState(() {
      _nameController.clear();
      _numberController.clear();
      _isNameValid = false;
      _isNumberValid = false;
      _nameValue = "";
      _numberValue = "";
      profilePictureFile = null;
    });
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
                  FilePickerWidget(            //Menggunakan filetype image di file picker karena kasus menentukan foto profil
                    isFilePicked : profilePictureFile == null ? false : true,
                    borderColor: pickedColorValue,
                    onPicked: (selectedFile) {
                      setState(() {
                        profilePictureFile = selectedFile;
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
                        _nameValue = val;
                        _nameValidator(val);
                        setState(() {});
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
                        _numberValue = val;
                        _numberValidator(val);
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
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
                    padding: const EdgeInsets.symmetric(vertical : 14),
                    child: DatePickerWidget(
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
                      ElevatedButtonWidget(
                        text: "Submit",
                        fixedSize: const Size(250, 42),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                        ),
                        onPressed: (_isNameValid && _isNumberValid) ? () {
                          setState(() {
                            addContact();
                            //Untuk Soal Prioritas 2
                            for (int i = 0;i<contactList.length;i++){
                              print("Nama : ${contactList[i].name}");
                              print("Nomor Telepon : ${contactList[i].number}");
                              print("Tanggal lahir : ${contactList[i].birthDate}");
                              print("Warna Profil : ${contactList[i].profileColor}");
                              print("Nama File Gambar : ${contactList[i].profilePicture?.name}");
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
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ThemeColors().m3SysLightSurface,
                      borderRadius: BorderRadius.circular(28)
                    ),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: contactList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 35,
                            backgroundColor: contactList[index].profileColor,
                            child: CircleAvatar(
                              radius : 24,
                              backgroundColor: ThemeColors().m3SysLightPrimaryContainer,
                              child: contactList[index].profilePicture == null ?
                              Text(
                                contactList[index].name[0],
                                style: ThemeTextStyles().m3TitleMedium,
                              ) :
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(
                                  width: 100,
                                  File(contactList[index].profilePicture!.path.toString()),
                                  fit: BoxFit.fill,
                                ),
                              )
                            ),
                          ),
                          title: Text(
                            contactList[index].name,
                            style: ThemeTextStyles().m3BodyLargeListView,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contactList[index].number,
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
                                onPressed: () {
                                  _nameController = TextEditingController(text : contactList[index].name);
                                  _numberController = TextEditingController(text : contactList[index].number);
                                  pickedColorValue = contactList[index].profileColor;
                                  editDialog(index);
                                }
                              ),
                              IconButton(
                                iconSize: 24,
                                icon: Icon(
                                  Icons.delete,
                                  color: ThemeColors().m3RefNeutralNeutral10
                                ),
                                onPressed: () {
                                  deleteDialog(index);
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ),
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