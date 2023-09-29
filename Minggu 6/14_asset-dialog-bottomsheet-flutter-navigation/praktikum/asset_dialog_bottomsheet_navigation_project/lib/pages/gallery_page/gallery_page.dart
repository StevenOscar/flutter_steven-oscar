import 'package:flutter/material.dart';
import '../../dialog_bottomsheet_functions.dart';
import '../../models/image_model.dart';
import '../../widgets/drawer_widget.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
  final categoryParameter = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            categoryParameter,
            style: const TextStyle(
              fontWeight: FontWeight.w600
            ),
        ),
        backgroundColor:
          categoryParameter == "Animal" ? Colors.red :
          categoryParameter == "Panorama" ? Colors.deepOrangeAccent :
          categoryParameter == "Vehicle" ? Colors.teal : Colors.lightBlue
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
          ),
          itemCount: imageList.where((image) => image.category == categoryParameter).toList().length,
          itemBuilder: (BuildContext context, int index) {
            List<ImageModel> filteredImages = imageList.where((image) => image.category == categoryParameter).toList();
            return GridTile(
              footer: Center(
                child: Text(
                  "${categoryParameter.toString()} ${index+1}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top :25, bottom: 25),
                child: Column(
                  children: [
                    GestureDetector(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        child: Image.asset(
                          filteredImages[index].image,
                          height: 115,
                          width: 200,
                          fit: BoxFit.fitHeight,        //kalau pakai fill gambarnya jadi gepeng/stretch
                        ),
                      ),
                      onTap: (){
                        showImageBottomSheet(context,index,filteredImages);
                      },
                    ),
                  ],
                ),
              )
            );
          },
        ),
      )
    );
  }
}