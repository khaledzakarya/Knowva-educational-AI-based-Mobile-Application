import 'package:flutter/material.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/widgets/common/profile_image.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    MySizes.init(context);

    return Row(
      children: [
        ProfileImage(),
        SizedBox(width: MySizes.spaceSm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              S.of(context).home_welcome("Mohamed"),
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: MySizes.headlineSmall,
              ),
            ),
            SizedBox(
              width: MySizes.screenWidth * 0.5,
              child: Text(
                S.of(context).home_welcome_subtitle,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: MySizes.bodyMedium),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
