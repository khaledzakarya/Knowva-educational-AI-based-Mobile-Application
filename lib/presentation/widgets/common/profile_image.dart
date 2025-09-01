import 'package:flutter/material.dart';
import 'package:knowva/core/utils/my_images.dart';
import 'package:knowva/core/utils/my_sizes.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.borderRadious = 1000, this.image});
  final double borderRadious;
  final String? image;

  @override
  Widget build(BuildContext context) {
    MySizes.init(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadious),
      clipBehavior: Clip.antiAlias,
      child: image == null
          ? Image(
              image: AssetImage(MyImages.profile),
              width: MySizes.imageWidthSmall,
              height: MySizes.imageWidthSmall,
            )
          : Image.network(
              image!,
              width: MySizes.imageWidthSmall,
              height: MySizes.imageWidthSmall,
              fit: BoxFit.cover,
            ),
    );
  }
}
