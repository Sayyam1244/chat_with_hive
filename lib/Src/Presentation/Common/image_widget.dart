import 'dart:convert';

import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_colors.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_textstyles.dart';
import 'package:chat_with_hive/Src/Presentation/Common/app_text.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightblackColor,
      height: images.length > 2
          ? MediaQuery.sizeOf(context).width * .7
          : MediaQuery.sizeOf(context).width * .35,
      width: images.length == 1
          ? MediaQuery.sizeOf(context).width * .35
          : MediaQuery.sizeOf(context).width * .7,
      padding: const EdgeInsets.all(4),
      child: GridView.builder(
        itemCount: images.length > 4 ? 4 : images.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: images.length == 1 ? 1 : 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            clipBehavior: Clip.hardEdge,
            // padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: MemoryImage(
                  base64Decode(images[index]),
                ),
              ),
            ),
            child: (images.length > 4 && index == 3)
                ? Container(
                    color: (images.length > 4 && index == 3)
                        ? AppColors.blackColor.withOpacity(0.3)
                        : null,
                    child: Center(
                      child: Apptext(
                        text: '+ ${images.length - 4}',
                        style: AppTextStyles.circularStdBold(
                            fontSize: 20, color: AppColors.whiteColor),
                      ),
                    ),
                  )
                : Container(),
          );
        },
      ),
    );
  }
}
