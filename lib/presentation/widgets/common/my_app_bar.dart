import 'package:flutter/material.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/presentation/widgets/common/my_return_button.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    MySizes.init(context);
    return AppBar(
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineLarge!.copyWith(fontSize: MySizes.headlineLarge),
      ),
      leading: MyReturnButton(),
      leadingWidth: MySizes.iconLarge + MySizes.paddingMd,
      toolbarHeight: MySizes.appBarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MySizes.appBarHeight);
}
