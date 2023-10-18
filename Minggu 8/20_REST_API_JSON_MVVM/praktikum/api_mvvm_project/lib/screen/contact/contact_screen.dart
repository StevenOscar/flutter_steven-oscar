import 'package:api_mvvm_project/model/contact_model.dart';
import 'package:api_mvvm_project/screen/contact/contact_bloc/contact_bloc.dart';
import 'package:api_mvvm_project/widget/elevated_button_gallery_widget.dart';
import 'package:api_mvvm_project/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/text_model.dart';
import 'text_bloc/text_bloc.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal : 20),
        child: Column(
          children: [
            Container(
              height: 540,
              margin: const EdgeInsets.only(top:20, bottom: 15, left: 15, right: 15),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top : 20),
                    child: Text(
                      "GET dan POST data Contact",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButtonWidget(
                      fixedSize: const Size(280, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      onPressed: (){
                        context.read<ContactBloc>().add(const GetContactEvent());
                      },
                      text : "GET (Memakai URL dari soal)"
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: TextFieldWidget(
                      hintText: "Enter your Name",
                      label: "Name",
                      controller: nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFieldWidget(
                      hintText: "Enter your Phone number",
                      label: "Phone Number",
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButtonWidget(
                      fixedSize: const Size(280, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      onPressed: (){
                        context.read<ContactBloc>().add(PostContactEvent(
                          contactItem: ContactModel(
                            id: 4,      //Id 4 hanya untuk contoh saja karena tidak dispesifikan di soal
                            name: nameController.text,
                            phone: phoneController.text
                          )
                        ));
                        nameController.clear();
                        phoneController.clear();
                      },
                      text: "Create (POST)"
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top : 15, bottom : 20),
                    child: Text(
                      "Data hasil Response GET / POST Contact",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  BlocBuilder<ContactBloc, ContactState>(
                    builder: (context, state) {
                      if(state is ContactDataLoading){
                        return const CircularProgressIndicator();
                      } else if(state is ContactPostSuccess){
                        return Text(
                          "id : ${state.contactData.id}\nname : ${state.contactData.name}\nphone: ${state.contactData.phone}",
                          style: const TextStyle(
                            fontSize: 16
                          ),
                        );
                      } else if(state is ContactGetSuccess){
                        // Menampung widget text sebanyak isi dari List di contactData, tapi karena URL dari soal hanya merujuk pada id : 2 saja, maka list hanya ada 1 isinya, sehingga hanya tampil 1 text nama
                        List<Widget> textWidgets = [];
                        for (int i = 0; i < state.contactData.length; i++) {
                          textWidgets.add(
                            Text(
                              "id :${state.contactData[i].id}\nname : ${state.contactData[i].name}\nphone: ${state.contactData[i].phone}\n\n",
                              style: const TextStyle(
                                fontSize: 16
                              ),
                            )
                          );
                        }
                        return Column(
                          children: textWidgets,
                        );
                      } else if(state is ContactDataFailed){
                        return Text(state.errorMessage);
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ]
              ),
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top : 20),
                    child: Text(
                      "PUT data Text",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: ElevatedButtonWidget(
                      onPressed: (){
                        context.read<TextBloc>().add(PutTextEvent(
                          textItem : TextModel(
                            id: 1,
                            title : 'foo',
                            body: 'bar',
                            userId: 1
                          )
                        ));
                      },
                      text: "PUT (Memakai data & URL dari soal)",
                      fixedSize: const Size(280, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top : 15, bottom : 20),
                    child: Text(
                      "Data hasil Response PUT Text",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  BlocBuilder<TextBloc, TextState>(
                    builder: (context, state) {
                      if(state is TextDataLoading){
                        return const CircularProgressIndicator();
                      } else if(state is TextPutSuccess){
                        return Text(
                          "id : ${state.textData.id}\ntitle : ${state.textData.title}\nbody: ${state.textData.body}\nUserId : ${state.textData.userId}",
                          style: const TextStyle(
                              fontSize: 16
                            ),
                          );
                      } else if(state is TextDataFailed){
                        return Text(state.errorMessage);
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
