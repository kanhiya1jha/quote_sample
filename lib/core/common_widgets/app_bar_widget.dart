import 'package:flutter/material.dart';

import 'package:signifydemo/core/common_widgets/responsive_size.dart';
import 'package:signifydemo/core/util/app_colors.dart';
import 'package:signifydemo/core/util/app_constants_string.dart';
import 'package:signifydemo/core/util/app_image_path.dart';
import 'package:signifydemo/core/util/app_theme.dart';

enum MenuItem { gps, accelerometer, twitter, facebook, share, rate }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(MenuItem) menuCallbackFunction;
  final List<MenuItem> menuItems = MenuItem.values;

  CustomAppBar({super.key, required this.menuCallbackFunction});

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppStringConstant.applicationTitle,
        style: Theme.of(context).textTheme.labelLargeSemibold,
      ),
      actions: [
        ScreenType.isSmallScreen(context)
            ? PopupMenuButton<MenuItem>(
                icon: Image.asset(ImageAssets.menu),
                offset: Offset(0, 40),
                onSelected: (MenuItem result) {
                  print('$result');
                  menuCallbackFunction(result);
                },
                itemBuilder: (BuildContext context) {
                  return menuItems.map((MenuItem item) {
                    return PopupMenuItem<MenuItem>(
                      value: item,
                      child: Text(item.toString().split('.')[1]),
                    );
                  }).toList();
                },
              )
            : Row(
                children: [
                  for (var item in menuItems)
                    TextButton(
                        onPressed: () {
                          menuCallbackFunction(item);
                        },
                        child: Text(item.toString().split('.')[1])),
                ],
              ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.bitterSweetColor,
          height: 1.0,
        ),
      ),
    );
  }
}
