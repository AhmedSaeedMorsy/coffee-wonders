import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/common/widget.dart';
import '../../../app/resources/values_manager.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return SharedWidget.productItem(context: context);
      },
      semanticChildCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSize.s10.w,
        crossAxisSpacing: AppSize.s5.h,
        childAspectRatio: 1 / 1.6,
      ),
    );
  }
}
