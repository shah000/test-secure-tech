import 'package:flutter/material.dart';

import '../../utils/app_size.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.width(context),
      height: AppSize.height(context),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
