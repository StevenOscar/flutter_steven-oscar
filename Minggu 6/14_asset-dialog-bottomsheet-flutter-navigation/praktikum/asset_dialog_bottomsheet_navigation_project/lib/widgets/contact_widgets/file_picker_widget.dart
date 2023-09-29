import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import '../../themes/theme_colors.dart';
import 'elevated_button_contact_widget.dart';

// ignore: must_be_immutable
class FilePickerWidget extends StatefulWidget {
  final Color borderColor;
  final Function onPicked;
  final PlatformFile? currentPicture;
  bool isFilePicked;

  FilePickerWidget({
    super.key,
    required this.borderColor,
    required this.onPicked,
    this.currentPicture,
    required this.isFilePicked
  });

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  File pickedFile = File("");

  @override
  void initState() {
    if(widget.currentPicture != null){
      pickedFile = File(widget.currentPicture!.path.toString());
    }
    super.initState();
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null){
      PlatformFile pictureFile = result.files.first;
      pickedFile = File(pictureFile.path.toString());
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
      widget.onPicked(null);
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          height: 230,
          width: 230,
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
                  pickedFile,
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
                  ElevatedButtonContactWidget(
                    text: 'Open Picture',
                    fixedSize: const Size(230, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: (){
                      _openFile(pickedFile);
                    },
                  ),
                  ElevatedButtonContactWidget(
                    text: 'Remove Picture',
                    fixedSize: const Size(230, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: (){
                      _removeFile(pickedFile);
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