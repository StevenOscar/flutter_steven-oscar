import '../../themes/theme_text_style.dart';
import 'elevated_button_contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatefulWidget {
  final Function onPicked;
  final Color currentColor;

  const ColorPickerWidget({
    super.key,
    required this.currentColor,
    required this.onPicked
  });

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  Color? pickedColor;
  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left : 8),
          child: Text(
            "Profile Border",
            style: ThemeTextStyles().m3BodyLargeText,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 30,
          width: double.infinity,
          color: widget.currentColor
        ),
        const SizedBox(height: 15),
        Center(
          child: ElevatedButtonContactWidget(
            fixedSize: const Size(150, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            text: "Pick Color",
            onPressed: (){
              showDialog(
                context: context,
                builder: (context){
                  return SingleChildScrollView(
                    child: AlertDialog(
                      title: const Text("Pick your color"),
                      content: ColorPicker(               //picker lain : colorPicker, slidepicker
                        pickerColor: widget.currentColor,
                        onColorChanged: (color){
                          setState(() {
                            pickedColor = color;
                            widget.onPicked(pickedColor);
                          });
                        }
                      ),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text("Save")
                        )
                      ],
                    ),
                  );
                }
              );
            },
          ),
        )
      ],
    );
  }
}