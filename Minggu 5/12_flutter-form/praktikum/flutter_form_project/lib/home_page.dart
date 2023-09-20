import 'package:flutter/material.dart';
import 'model/contacts.dart';
import 'page/page_header.dart';
import 'theme/theme_colors.dart';
import 'theme/theme_text_style.dart';
import 'widget/elevated_button_widget.dart';
import 'widget/text_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _nameValue = "";
  String _numberValue = "";

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
      Contacts(name: _nameValue, number: _numberValue)
    );
    setState(() {
      clearTextField();
    });
  }

  void deleteContact(int index){
    contactList.removeAt(index);
    setState(() {});
  }

  void editContact(int index){
    contactList[index].name = _nameValue;
    contactList[index].number = _numberValue;
    setState(() {
      clearTextField();
    });
  }

  void clearTextField(){
    _nameController.clear();
    _numberController.clear();
    _isNameValid = false;
    _isNumberValid = false;
    _nameValue = "";
    _numberValue = "";
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
                  const SizedBox(height : 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right : 5),
                        child: ElevatedButtonWidget(
                          text: "Submit",
                          fixedSize: const Size(94, 42),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)
                          ),
                          onPressed: (_isNameValid && _isNumberValid) ? () {
                            setState(() {
                              addContact();
                              // print(contactList);     //untuk menampilkan data di console (soal prioritas 1 huruf g)
                            });
                          } : null
                        )
                      ),
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
                            backgroundColor: ThemeColors().m3SysLightPrimaryContainer,
                            child: Text(
                              contactList[index].name[0],
                              style: ThemeTextStyles().m3TitleMedium,
                            ),
                          ),
                          title: Text(
                            contactList[index].name,
                            style: ThemeTextStyles().m3BodyLargeListView,
                          ),
                          subtitle: Text(
                            contactList[index].number,
                            style: ThemeTextStyles().m3BodyMedium,
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
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return StatefulBuilder(
                                        builder: (BuildContext context, setState) {
                                          return AlertDialog(
                                            title: Center(
                                              child: Text(
                                                'Edit Contact',
                                                style: ThemeTextStyles().m3HeadlineSmall,
                                              ),
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
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
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    errorTextName = null;
                                                    errorTextNumber = null;
                                                    clearTextField();
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
                              ),
                              IconButton(
                                iconSize: 24,
                                icon: Icon(
                                  Icons.delete,
                                  color: ThemeColors().m3RefNeutralNeutral10
                                ),
                                onPressed: () {
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