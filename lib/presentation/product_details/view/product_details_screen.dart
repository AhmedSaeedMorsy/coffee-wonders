// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_wonders/app/resources/assets_manager.dart';
import 'package:coffee_wonders/app/resources/strings_manager.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/common/widget.dart';
import '../../../app/resources/color_manager.dart';
import '../../../app/resources/font_manager.dart';
import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/values_manager.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.productDetails.tr(),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s80,
            ),
            sliderBanner(),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lacimbali M200",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              "Category Name",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "Brand Name",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "200.00",
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s40,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.mintGreen,
                          fontSize: FontSizeManager.s18.sp,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color:
                              CacheHelper.getData(key: SharedKey.isDark) == true
                                  ? ColorManager.white
                                  : ColorManager.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / AppSize.s40,
                      ),
                      Expanded(
                        child: SharedWidget.defaultButton(
                          label: AppStrings.addToCart.tr(),
                          context: context,
                          width: double.infinity,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / AppSize.s30,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.s8,
                            ),
                            color: ColorManager.mintGreen,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width / AppSize.s40,
                          ),
                          child: Text(
                            "+",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: FontSizeManager.s16.sp,
                                  color: ColorManager.white,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width /
                                AppSize.s50),
                        child: Text(
                          "1",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.s8,
                            ),
                            color: ColorManager.mintGreen,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width / AppSize.s40,
                          ),
                          child: Text(
                            "-",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: FontSizeManager.s16.sp,
                                  color: ColorManager.white,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s40,
                  ),
                  Text(
                    AppStrings.similarProducts.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s60,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 9,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SharedWidget.productItem(
                        context: context,
                      );
                    },
                    semanticChildCount: 2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppSize.s6.w,
                      crossAxisSpacing: AppSize.s6.h,
                      childAspectRatio: 1 / 1.6,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> banners = ["", ""];
  Widget sliderBanner() => CarouselSlider(
        carouselController: CarouselController(),
        items: banners
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AssetsManager.productDemo,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(
                    AppSize.s10,
                  ),
                  border: Border.all(
                    color: CacheHelper.getData(key: SharedKey.isDark) == true
                        ? ColorManager.white
                        : ColorManager.primaryColor,
                  ),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          height: AppSize.s200.h,
          viewportFraction: .8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(
            seconds: AppIntDuration.duration3,
          ),
          autoPlayAnimationDuration: const Duration(
            milliseconds: AppIntDuration.duration500,
          ),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      );
}
