import 'dart:convert';
import 'dart:io';

import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_colors.dart';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key, required this.files});
  final List<String> files;
  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColors.whiteColor,
        body: PageView.builder(
          itemCount: widget.files.length,
          itemBuilder: (context, index) => Image.memory(
            base64Decode(
              widget.files[index],
            ),
          ),
        ),
      ),
    );
  }
}
