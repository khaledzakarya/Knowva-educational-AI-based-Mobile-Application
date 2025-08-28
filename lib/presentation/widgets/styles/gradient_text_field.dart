import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:knowva/core/functions/get_device_type.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_icon.dart';

class GradientBorderTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Gradient gradient;
  final double borderRadius;
  final double borderWidth;
  final IconData? prefixIcon;
  final bool isPassword;

  const GradientBorderTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.gradient = MyColors.orangeGradient,
    this.borderRadius = 16,
    this.borderWidth = 2,
    this.isPassword = false,
    this.prefixIcon,
  });

  @override
  State<GradientBorderTextField> createState() =>
      _GradientBorderTextFieldState();
}

class _GradientBorderTextFieldState extends State<GradientBorderTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final DeviceType deviceType = getDeviceType(MediaQuery.of(context));
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        gradient: widget.gradient,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      padding: EdgeInsets.all(widget.borderWidth), // gradient border thickness
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? MyColors.dark : MyColors.light,
          borderRadius: BorderRadius.circular(
            widget.borderRadius - widget.borderWidth,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            deviceType == DeviceType.phone ? 0 : MySizes.paddingXs,
          ),
          child: TextField(
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontSize: MySizes.bodyLarge),

            controller: widget.controller,
            obscureText: widget.isPassword ? _obscure : false,
            cursorColor: MyColors.primaryColor,

            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ), // fixed padding
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(MySizes.spaceXs),
                      child: GradientIcon(
                        icon: widget.prefixIcon!,
                        gradient: MyColors.orangeGradient,
                        size: MySizes.iconMedium,
                      ),
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: MySizes.labelMedium,
                fontWeight: FontWeight.w600,
              ),

              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscure ? Iconsax.eye : Iconsax.eye_slash,
                        color: MyColors.grey,
                        size: MySizes.iconMedium,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
