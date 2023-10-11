import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/form_file/form_file_bloc.dart';
import '../../themes/theme_colors.dart';
import 'elevated_button_contact_widget.dart';

class FilePickerWidget extends StatelessWidget {
  final Color borderColor;

  const FilePickerWidget({
    super.key,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 230,
          width: 230,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 20),
            shape: BoxShape.circle,
            color: ThemeColors().m3SysLightPrimary,
          ),
          child: BlocBuilder<FormFileBloc, FormFileState>(
            builder: (context, state) {
              return InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    context.read<FormFileBloc>().add(FormFileSelectEvent());
                  },
                  child: ((state.isFilePicked == true) &&
                          (state.showPickedFile != null))
                      ? ClipOval(
                          child: Image.file(
                            state.showPickedFile ?? File(""),
                            fit: BoxFit.fill,
                          ),
                        )
                      : Icon(
                          Icons.add_a_photo_sharp,
                          color: ThemeColors().m3SysLightSurface,
                          size: 45,
                        ));
            },
          ),
        ),
        const SizedBox(height: 8),
        BlocBuilder<FormFileBloc, FormFileState>(
          builder: (context, state) {
            return Container(
                child: state.isFilePicked
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              ElevatedButtonContactWidget(
                                text: 'Open Picture',
                                fixedSize: const Size(230, 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                onPressed: () {
                                  context.read<FormFileBloc>().add(FormOpenFileEvent(fileValue: state.showPickedFile));
                                },
                              ),
                              ElevatedButtonContactWidget(
                                text: 'Remove Picture',
                                fixedSize: const Size(230, 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                onPressed: () {
                                  context.read<FormFileBloc>().add(FormRemoveFileEvent(fileValue: state.showPickedFile));
                                },
                              )
                            ],
                          ),
                        ],
                      )
                    : const SizedBox(height: 10));
          },
        )
      ],
    );
  }
}
