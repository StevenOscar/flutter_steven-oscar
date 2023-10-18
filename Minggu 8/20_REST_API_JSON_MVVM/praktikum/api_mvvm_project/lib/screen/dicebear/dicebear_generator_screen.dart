import 'package:api_mvvm_project/screen/dicebear/dicebear_bloc/dicebear_bloc.dart';
import 'package:api_mvvm_project/widget/dicebear/radio_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:randomstring_dart/randomstring_dart.dart';

import '../../widget/elevated_button_gallery_widget.dart';

class ImageGeneratorScreen extends StatefulWidget {
  const ImageGeneratorScreen({super.key});

  @override
  State<ImageGeneratorScreen> createState() => _ImageGeneratorScreenState();
}

class _ImageGeneratorScreenState extends State<ImageGeneratorScreen> {
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
            const SizedBox(height: 30),
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
                final rs = RandomString();
                String randomString = rs.getRandomString();
                context.read<DicebearBloc>().add(GenerateButtonPressedEvent(
                  artStyle: artStyle,
                  query: randomString
                ));
              },
              text: "Generate random Dicebear image",
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
