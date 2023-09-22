import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import '../theme/theme_colors.dart';
import 'elevated_button_widget.dart';

// ignore: must_be_immutable
class FilePickerWidget extends StatefulWidget {
  final Color borderColor;
  bool isFilePicked;
  final Function onPicked;
  FilePickerWidget({
    super.key,
    required this.borderColor,
    required this.isFilePicked,
    required this.onPicked,
  });

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  File showFile = File("");

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null){
      PlatformFile pictureFile = result.files.first;
      showFile = File(pictureFile.path.toString());
      widget.isFilePicked = true;
      widget.onPicked(pictureFile);
      setState(() {});
    }
  }

  void _openFile(File file){
    final filePath = file.path;
    OpenFile.open(filePath);
  }

  void _removeFile(File file){
    setState(() {
      file = File("");
      widget.isFilePicked = false;
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.borderColor,
              width: 20
            ),
            shape: BoxShape.circle,
            color: ThemeColors().m3SysLightPrimary,
          ),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: (){
              setState(() {
                _pickFile();
              });
            },
            child: widget.isFilePicked ?
              ClipOval(
                child: Image.file(
                  showFile,
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
          child : widget.isFilePicked ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ElevatedButtonWidget(
                    text: 'Open Picture',
                    fixedSize: const Size(250, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: (){
                      _openFile(showFile);
                    },
                  ),
                  ElevatedButtonWidget(
                    text: 'Remove Picture',
                    fixedSize: const Size(250, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: (){
                      _removeFile(showFile);
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