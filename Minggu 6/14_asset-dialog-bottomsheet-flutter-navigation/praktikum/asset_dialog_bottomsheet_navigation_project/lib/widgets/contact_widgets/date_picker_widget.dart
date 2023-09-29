import '../../themes/theme_colors.dart';
import '../../themes/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final Function onPicked;
  final DateTime currentDate;

  const DatePickerWidget({
    super.key,
    required this.onPicked,
    required this.currentDate
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime pickedDate = DateTime.now();
  @override
    Widget build(BuildContext context){
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Card(
          elevation: 5,
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
                            initialDate: widget.currentDate,
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
                  DateFormat('d MMMM yyyy').format(widget.currentDate),
                  style: ThemeTextStyles().m3BodyLargeTextField,
                ),
                const SizedBox(height: 15)
            ]
        )
          ),
      );
  }
}
