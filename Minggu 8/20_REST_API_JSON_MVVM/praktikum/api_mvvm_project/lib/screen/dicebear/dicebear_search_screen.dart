import 'package:api_mvvm_project/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widget/dicebear/radio_list_tile_widget.dart';
import '../../widget/elevated_button_gallery_widget.dart';
import 'dicebear_bloc/dicebear_bloc.dart';

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({super.key});

  @override
  State<ImageSearchScreen> createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  TextEditingController queryController = TextEditingController();
  String artStyle = "pixel-art";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            BlocBuilder<DicebearBloc, DicebearState>(
              builder: (context, state) {
                if(state is DicebearInitial){
                  return const Icon(
                    Icons.image,
                    size: 200,
                  );
                } else if(state is DicebearDataLoading){
                  return const CircularProgressIndicator();
                } else if(state is DicebearGetSuccess){
                  return ClipRect(
                    child: SvgPicture.string(
                      state.imageData,
                      height: 200,
                    ),
                  );
                } else if(state is DicebearDataFailed){
                  return Text(state.errorMessage);
                } else {
                  return const SizedBox();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 20),
              child: TextFieldWidget(
                hintText: "Enter your image keyword here",
                label: "Search",
                controller: queryController,
              ),
            ),
            const Text(
              "Select Art Style",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            RadioListTileWidget(
              artStyle: artStyle,
              onChanged: (val){
                setState(() {
                  artStyle = val.toString();
                });
              },
            ),
            ElevatedButtonWidget(
              onPressed: (){
                context.read<DicebearBloc>().add(GenerateButtonPressedEvent(
                  artStyle: artStyle,
                  query: queryController.text
                ));
              },
              text: "Generate Dicebear image",
              fixedSize: const Size(300, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            )
          ],
        ),
      )
    );
  }
}