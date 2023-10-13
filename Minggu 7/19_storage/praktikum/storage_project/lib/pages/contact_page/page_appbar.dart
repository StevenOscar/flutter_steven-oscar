import 'package:flutter/material.dart';

import '../../themes/theme_colors.dart';
import '../../utils/shared_pref.dart';

class PageAppbar extends StatefulWidget implements PreferredSizeWidget{
  const PageAppbar({super.key});

  @override
  State<PageAppbar> createState() => _PageAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _PageAppbarState extends State<PageAppbar> {
  String? username;
  Map<String,String>? userCredentialData;

  void initial() async {
    userCredentialData = await SharedPref().getUserCredential();
    username = userCredentialData?["username"];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("$username Contacts"),
      centerTitle: true,
      backgroundColor: ThemeColors().m3SysLightPrimary,
    );
  }
}