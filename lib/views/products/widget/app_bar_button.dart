import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_size.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.iconData,
    required this.onTap,
    required this.color,
  });
  final IconData iconData;
  final Function() onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: AppSize.width(context) * 0.15,
          height: AppSize.height(context) * 0.06,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Icon(iconData, color: color),
        ),
      ),
    );
  }
}
