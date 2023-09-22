import 'package:advanced_form_project/theme/theme_colors.dart';
import 'package:advanced_form_project/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final Function onPicked;
  final DateTime currentDate = DateTime.now();

  DatePickerWidget({
    super.key,
    required this.onPicked,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime pickedDate = DateTime.now();
  @override
    Widget build(BuildContext context){
      return Card(
        color: ThemeColors().m3SysLightSurfaceVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Birth Date",
                      style: ThemeTextStyles().m3BodyLargeText,
                    ),
                    TextButton(
                      onPressed: () async {
                        final dateSelector = await showDatePicker(
                          context: context,
                          initialDate: pickedDate,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now()
                        );
                        setState(() {
                          if(dateSelector == null){
                            pickedDate = pickedDate;
                          } else {
                            pickedDate = dateSelector;
                            widget.onPicked(pickedDate);
                          }
                        });
                      },
                      child: Text(
                        "Select",
                        style: ThemeTextStyles().m3BodyLargeText,
                      )
                    )
                  ]
                ),
              ),
              Text(
                DateFormat('EEEE, d MMMM yyyy').format(pickedDate),
                style: ThemeTextStyles().m3BodyLargeTextField,
              ),
              const SizedBox(height: 15)
          ]
      )
    );
  }
}
