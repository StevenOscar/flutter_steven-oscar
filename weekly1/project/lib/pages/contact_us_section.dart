import 'package:flutter/material.dart';
import '../dialogs/submitted_data_dialog.dart';
import '../themes/theme_text_style.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/elevated_button_widget.dart';
import '../functions/functions.dart';

class ContactUsSection extends StatefulWidget {
  const ContactUsSection({super.key});

  @override
  State<ContactUsSection> createState() => _ContactUsSectionState();
}

class _ContactUsSectionState extends State<ContactUsSection> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String _firstNameValue = "";
  String _lastNameValue = "";
  String _emailValue = "";
  String _messageValue = "";

  String? errorTextFirstName = "";
  String? errorTextLastName = "";
  String? errorTextEmail = "";

  bool  _isFirstNameValid = false;
  bool  _isLastNameValid = false;
  bool _isEmailValid = false;
  bool _isMessageValid = false;

  void clearField(){
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    messageController.clear();
    _isFirstNameValid = false;
    _isLastNameValid = false;
    _isEmailValid = false;
    _isMessageValid = false;
    _firstNameValue = "";
    _lastNameValue = "";
    _emailValue = "";
    _messageValue = "";
    setState(() {});
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(                //gambar background
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Image.asset(
            "assets/images/background3.jpg",
            fit: BoxFit.fitHeight,
            )
        ),
        Container(                  // Untuk filter penggelap background
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end : Alignment.bottomCenter,
              colors: [
                Colors.black54,
                Colors.black87
              ]
            )
          ),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            color: Colors.transparent
          ),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35, vertical: 50
            ),
            child: Column(
              children: [
                Text(
                  "Contact Us",
                  style: ThemeTextStyles().headlineMediumWhite,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 30
                  ),
                  child: Text(
                    "We'd love to hear from you! Whether you're interested in seeking new travel destination, have inquiries about our services, or just want to share your thoughts, please drop us a message below.",
                    textAlign: TextAlign.center,
                    style: ThemeTextStyles().bodyMediumShort,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "First Name",
                            style: ThemeTextStyles().bodyMediumNormalWhite,
                          ),
                          SizedBox(
                            height: 88,
                            child: TextFieldWidget(
                              controller: firstNameController,
                              keyboardType: TextInputType.name,
                              hintText: "First Name",
                              label: "First Name",
                              errorText: errorTextFirstName,
                              onChanged: (val){
                                setState(() {
                                  _firstNameValue = val;
                                  _isFirstNameValid = nameValidator(
                                    val: val,
                                  )["isNameValid"];
                                  errorTextFirstName = nameValidator(
                                    val: val,
                                  )["errorTextName"];
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Last Name",
                            style: ThemeTextStyles().bodyMediumNormalWhite,
                          ),
                          SizedBox(
                            height: 88,
                            child: TextFieldWidget(
                              controller: lastNameController,
                              keyboardType: TextInputType.name,
                              hintText: "Last Name",
                              label: "Last Name",
                              errorText: errorTextLastName,
                              onChanged: (val){
                                setState(() {
                                  _lastNameValue = val;
                                  _isLastNameValid = nameValidator(
                                    val: val,
                                  )["isNameValid"];
                                  errorTextLastName = nameValidator(
                                    val: val,
                                  )["errorTextName"];
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        "Email",
                        style: ThemeTextStyles().bodyMediumNormalWhite,
                      ),
                      TextFieldWidget(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Insert your email",
                        label: "Email",
                        errorText: errorTextEmail,
                        onChanged: (val){
                          setState(() {
                            _emailValue = val;
                            _isEmailValid = emailValidator(
                              val: val,
                            )["isEmailValid"];
                            errorTextEmail = emailValidator(
                              val: val,
                            )["errorTextEmail"];
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      Text(
                        "Message",
                        style: ThemeTextStyles().bodyMediumNormalWhite,
                      ),
                      Card(
                        child: TextFieldWidget(
                          maxLines : 3,
                          controller: messageController,
                          hintText: "Insert your Message",
                          label: "First Name",
                          onChanged: (val){
                            setState(() {
                              _messageValue = val;
                              if(val != ""){
                                _isMessageValid = true;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _isFirstNameValid && _isLastNameValid && _isEmailValid && _isMessageValid == true ?
                ElevatedButtonWidget(
                  text: "Submit",
                  fixedSize: const Size(200, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                  ),
                  onPressed: () async {
                    setState(() {
                      submittedDataDialog(
                        context: context,
                        emailValue: _emailValue,
                        firstNameValue: _firstNameValue,
                        lastNameValue: _lastNameValue,
                        messageValue: _messageValue
                      ) ;
                      clearField();
                      }
                    );
                  }
                ) :
                Text(
                  "Please Fill the Data first",
                  style: ThemeTextStyles().bodyMediumNormalWhite,
                ),
              ],
            ),
          )
        ),
      ],
    );
  }
}