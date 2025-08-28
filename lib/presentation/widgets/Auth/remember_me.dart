
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:knowva/core/functions/get_device_type.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_text.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceType deviceType = getDeviceType(MediaQuery.of(context));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Transform.scale(
              scale: deviceType == DeviceType.phone ? 1 : 1.5,
              child: Checkbox(
                value: true,
                onChanged: (val) {},
                activeColor: MyColors.secondaryColor,
              ),
            ),
            Text(
              S.current.remember_me,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(fontSize: MySizes.bodySmall),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: GradientText(
            text: S.of(context).login_forgot_password,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: MySizes.bodySmall,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
