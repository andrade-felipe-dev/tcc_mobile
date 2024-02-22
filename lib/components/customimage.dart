import 'package:flutter/material.dart';
import 'dart:convert';

class CustomImage extends StatelessWidget {
  final String imageBase64;
  final double width;
  final double height;

  const CustomImage(
      {Key? key,
      required this.imageBase64,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.memory(
        base64Decode(imageBase64),
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.image_not_supported,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
