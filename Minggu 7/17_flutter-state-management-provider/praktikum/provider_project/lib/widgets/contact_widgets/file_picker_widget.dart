import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/providers/form_file_change_notifier.dart';
import '../../themes/theme_colors.dart';
import 'elevated_button_contact_widget.dart';

class FilePickerWidget extends StatelessWidget {
  final Color borderColor;

  const FilePickerWidget({
    super.key,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context){
    final fileProvider = Provider.of<FormFileChangeNotifier>(context);
    return Column(
      children: [
        Container(
          height: 230,
          width: 230,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 20
            ),
            shape: BoxShape.circle,
            color: ThemeColors().m3SysLightPrimary,
          ),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: (){
              fileProvider.pickFile();
            },
            child: ((fileProvider.isFilePicked == true) && (fileProvider.showPickedFile != null)) ?
              ClipOval(
                child: Image.file(
                  fileProvider.showPickedFile ?? File(""),
                  fit: BoxFit.fill,
                ),
              ) :
              Icon(
                Icons.add_a_photo_sharp,
                color: ThemeColors().m3SysLightSurface,
                size: 45,
              )
          ),
        ),
        const SizedBox(height: 8),
        Container(
          child : fileProvider.isFilePicked ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ElevatedButtonContactWidget(
                    text: 'Open Picture',
                    fixedSize: const Size(230, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: (){
                      fileProvider.openFile(fileProvider.showPickedFile);
                    },
                  ),
                  ElevatedButtonContactWidget(
                    text: 'Remove Picture',
                    fixedSize: const Size(230, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: (){
                      fileProvider.removeFile(fileProvider.showPickedFile);
                    },
                  )
                ],
              ),

            ],
          ) :
          const SizedBox(height: 10)
        )
      ],
    );
  }
}