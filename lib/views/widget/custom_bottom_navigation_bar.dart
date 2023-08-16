import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_size.dart';
import 'bottom_navigation_items.dart';

class CustomBottomNavigatonBar extends StatelessWidget {
  const CustomBottomNavigatonBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        width: AppSize.width(context),
        height: AppSize.height(context) * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 0),
              child: BottomNavigationItem(
                img: AppImages.home,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 0),
              child: BottomNavigationItem(
                img: AppImages.cart,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 0),
              child: BottomNavigationItem(
                img: AppImages.like,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 0),
              child: BottomNavigationItem(
                img: AppImages.user,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
