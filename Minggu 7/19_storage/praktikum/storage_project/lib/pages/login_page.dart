import 'package:flutter/material.dart';
import 'package:storage_project/routes_navigation.dart';
import 'package:storage_project/utils/shared_pref.dart';
import 'package:storage_project/widgets/gallery_widgets/elevated_button_gallery_widget.dart';

import '../widgets/login_widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    String usernameValue = "";
    String passwordValue = "";      // Digunakan ketika ingin mengetes validasi username & password
    String dummyToken = "dummy_token_123";        // Untuk simulasi menyimpan data token saja
    bool isPasswordVisible = false;

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
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: !isPasswordVisible,
                  isShowPasswordIcon: true
                ),
                const SizedBox(height: 50),
                ElevatedButtonGalleryWidget(
                  fixedSize: const Size(185, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: () {
                    // Jika tidak ingin mengetes Validasi username dan password
                    if(usernameValue != "" && passwordValue != ""){
                      SharedPref().saveUserCredential(
                        tokenValue: dummyToken,
                        usernameValue: usernameValue
                      );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesNavigation().homePage,
                        (route) => false
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Your Username or Password are not valid!',
                            style: TextStyle(fontSize: 16)
                          ),
                        ),
                      );
                    }

                    // Jika ingin mengetes validasi Username dan Password (username dan password divalidasi menggunakan Hard Code)

                    // if(usernameValue == "steven_oscar" && passwordValue == "123456789"){
                    //   SharedPref().saveUserCredential(
                    //     tokenValue: dummyToken,
                    //     usernameValue: usernameValue
                    //   );
                    //   Navigator.pushNamedAndRemoveUntil(
                    //     context,
                    //     RoutesNavigation().homePage,
                    //     (route) => false
                    //   );
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