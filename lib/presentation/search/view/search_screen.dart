import 'package:coffee_wonders/app/common/widget.dart';
import 'package:coffee_wonders/app/resources/color_manager.dart';
import 'package:coffee_wonders/app/resources/strings_manager.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/resources/values_manager.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / AppSize.s30,
        ),
        child: Column(
          children: [
            SharedWidget.defaultTextFormField(
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              context: context,
              prefixIcon: const Icon(
                Icons.search,
              ),
              hint: AppStrings.searchHint.tr(),
            ),
            const Spacer(),
            Column(
              children: [
                Icon(
                  Icons.search_off_outlined,
                  size: AppSize.s100.w,
                  color: CacheHelper.getData(key: SharedKey.isDark)== true
                      ? ColorManager.white
                      : ColorManager.primaryColor,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                Text(
                  AppStrings.notFound.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
