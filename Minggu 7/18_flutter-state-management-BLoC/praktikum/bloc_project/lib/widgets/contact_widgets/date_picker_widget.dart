import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/form_date/form_date_bloc.dart';
import '../../themes/theme_colors.dart';
import '../../themes/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Card(
          elevation: 5,
          color: ThemeColors().m3SysLightSurfaceVariant,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Birth Date",
                      style: ThemeTextStyles().m3BodyLargeText,
                    ),
                    BlocBuilder<FormDateBloc, FormDateState>(
                      builder: (context, state) {
                        return TextButton(
                            onPressed: () async {
                              final dateSelector = await showDatePicker(
                                context: context,
                                initialDate: state.pickedDateValue,
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());
                              // ignore: use_build_context_synchronously
                              context.read<FormDateBloc>().add(FormDateSelectedEvent(dateValue: dateSelector));
                            },
                            child: Text(
                              "Select",
                              style: ThemeTextStyles().m3BodyLargeText,
                            ));
                      },
                    )
                  ]),
            ),
            BlocBuilder<FormDateBloc, FormDateState>(
              builder: (context, state) {
                return Text(
                  DateFormat('d MMMM yyyy').format(state.pickedDateValue),
                  style: ThemeTextStyles().m3BodyLargeTextField,
                );
              },
            ),
            const SizedBox(height: 15)
          ])),
    );
  }
}
