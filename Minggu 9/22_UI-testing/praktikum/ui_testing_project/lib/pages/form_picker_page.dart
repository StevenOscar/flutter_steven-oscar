import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import '../widgets/drawer_widget.dart';

// Halaman dari soal prioritas 1 tugas Advance Form (Soal Prioritas 1 tugas UI Testing)

class FormPickerPage extends StatefulWidget {
  const FormPickerPage({super.key});

  @override
  State<FormPickerPage> createState() => _FormPickerPageState();
}

class _FormPickerPageState extends State<FormPickerPage> {
  late DateTime _dueDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  Color _currentColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Widgets"),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            buildDatePicker(context),
            const SizedBox(height: 20),
            buildColorPicker(context),
            const SizedBox(height: 20),
            buildFilePicker(context)
          ],
        ),
        ),
    );
  }

Widget buildDatePicker(BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Date"),
          TextButton(
            onPressed: () async {
              final selectDate = await showDatePicker(
                context: context,
                initialDate: currentDate,
                firstDate: DateTime(1999),
                lastDate: DateTime(currentDate.year + 5)
              );
              setState(() {
                if(selectDate!=null){
                  _dueDate = selectDate;
                }
              });
            },
            child: const Text("Select")
          )
        ]
      ),
      Text(
        DateFormat('dd-MM-yyyy').format(_dueDate))
    ],
  );
}

Widget buildColorPicker(BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Color"),
      const SizedBox(height: 10),
      Container(
        height: 100,
        width: double.infinity,
        color: _currentColor
      ),
      const SizedBox(height: 10),
      Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_currentColor)
          ),
          onPressed: (){
            showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: const Text("Pick your color"),
                  content: BlockPicker(               //picker lain : colorPicker, slidepicker
                    pickerColor: _currentColor,
                    onColorChanged: (color){
                      setState(() {
                        _currentColor = color;
                      });
                    }
                  ),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: const Text("save")
                    )
                  ],
                );
              }
            );
          },
          child: const Text("Pick Color")
        ),
      )
    ],
  );
}

Widget buildFilePicker(BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Pick Files"),
      const SizedBox(height: 10,),
      Center(
        child: ElevatedButton(
          onPressed: () {
            _pickFile();
          },
          child: const Text("Pick and open file")
        ),
      )
    ],
  );
}

void _pickFile() async {
  final result = await FilePicker.platform.pickFiles();
  if (result == null ) return ;

  final file = result.files.first;
  _openFile(file);
}

void _openFile(PlatformFile file){
  OpenFile.open(file.path);
}
}

