import 'package:coffee_wonders/app/resources/assets_manager.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/resources/color_manager.dart';
import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/strings_manager.dart';
import '../../../app/resources/values_manager.dart';
import '../../product_details/view/product_details_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.orderDetails.tr(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.cartRoute,
              );
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / AppSize.s30,
          vertical: MediaQuery.of(context).size.height / AppSize.s30,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => orderDetailsItem(
                  context: context,
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                  child: Container(
                    color: ColorManager.green,
                    width: double.infinity,
                    height: AppSize.s1,
                  ),
                ),
                itemCount: 7,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget orderDetailsItem({
    required BuildContext context,
  }) =>
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(),
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AssetsManager.productDemo,
                    ),
                  ),
                  border: Border.all(
                    color: CacheHelper.getData(key: SharedKey.isDark) == true
                        ? ColorManager.white
                        : ColorManager.primaryColor,
                  ),
                  color: ColorManager.primaryColor,
                  borderRadius: BorderRadius.circular(
                    AppSize.s8.w,
                  ),
                ),
                height: AppSize.s120.h,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / AppSize.s60,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lacimbali M200",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s80,
                  ),
                  Text(
                    "Category name",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s80,
                  ),
                  Text(
                    "EGP  200.00",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
