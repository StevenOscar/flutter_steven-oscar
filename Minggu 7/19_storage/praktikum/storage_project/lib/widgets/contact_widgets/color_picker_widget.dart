import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/form_color/form_color_bloc.dart';
import '../../themes/theme_text_style.dart';
import 'elevated_button_contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "Profile Border",
            style: ThemeTextStyles().m3BodyLargeText,
          ),
        ),
        const SizedBox(height: 15),
        BlocBuilder<FormColorBloc, FormColorState>(
          builder: (context, state) {
            return Container(
                height: 30,
                width: double.infinity,
                color: state.pickedColorValue);
          },
        ),
        const SizedBox(height: 15),
        Center(
          child: ElevatedButtonContactWidget(
            fixedSize: const Size(150, 40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            text: "Pick Color",
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: AlertDialog(
                        title: const Text("Pick your color"),
                        content: BlocBuilder<FormColorBloc, FormColorState>(
                          builder: (context, state) {
                            return ColorPicker(
                              //picker lain : colorPicker, slidepicker
                              pickerColor: state.pickedColorValue,
                              onColorChanged: (color) {
                                context.read<FormColorBloc>().add(FormColorChangedEvent(colorValue: color));
                              }
                            );
                          },
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Save"))
                        ],
                      ),
                    );
                  });
            },
          ),
        )
      ],
    );
  }
}
