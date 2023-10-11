import 'package:flutter/material.dart';
import 'package:storage_project/routes_navigation.dart';
import 'package:storage_project/utils/shared_pref.dart';
import 'package:storage_project/widgets/gallery_widgets/elevated_button_gallery_widget.dart';

import '../widgets/login_widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String usernameValue = "";
    String passwordValue = "";
    String dummyToken = "dummy_token_123";        // Untuk simulasi menyimpan data token saja
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    "Log in to your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFieldLoginWidget(
                  hintText: 'Please input your username',
                  label: 'Username',
                  prefixIcon : const Icon(Icons.person),
                  onChanged: (val){
                    usernameValue = val;
                  },
                ),
                const SizedBox(height: 30),
                TextFieldLoginWidget(
                  hintText: 'Please input your password',
                  label: 'Password',
                  onChanged: (val){
                    passwordValue = val;
                  },
                  obscureText : true,
                  prefixIcon: const Icon(Icons.lock),
                ),
                const SizedBox(height: 50),
                ElevatedButtonGalleryWidget(
                  fixedSize: const Size(185, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: () {
                    // Jika tidak ingin mengetes Validasi username dan password
                    SharedPref().saveUserCredential(
                      tokenValue: dummyToken,
                      usernameValue: usernameValue
                    );
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesNavigation().homePage,
                      (route) => false
                    );
                    // Jika ingin mengetes validasi Username dan Password (username dan password dibandingkan dengan String menggunakan Hard Code)
                    // if(usernameValue == "steven_oscar" && passwordValue == "12345678"){
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text(
                    //         'Your Username or Password are incorrect!',
                    //         style: TextStyle(fontSize: 16)
                    //       ),
                    //     ),
                    //   );
                    // }
                  },
                  text: "Log in"
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}