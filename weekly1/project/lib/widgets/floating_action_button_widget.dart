import 'package:flutter/material.dart';


class FloatingActionButtonWidget extends StatelessWidget {
  final ScrollController scrollController;

  const FloatingActionButtonWidget({
    super.key,
    required this.scrollController
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          style: BorderStyle.solid,
          width: 0.3
        )
      ),
      backgroundColor: Colors.deepOrange[600],
      onPressed: (){
        scrollController.animateTo(
          scrollController.offset + MediaQuery.of(context).size.height,
          duration: const Duration(milliseconds : 300),
          curve: Curves.easeInOut
        );
      },
      label: const Icon(
        Icons.arrow_drop_down_outlined,
        size: 22,
      )
    );
  }
}