// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_wonders/app/common/widget.dart';
import 'package:coffee_wonders/app/resources/assets_manager.dart';
import 'package:coffee_wonders/app/resources/color_manager.dart';
import 'package:coffee_wonders/app/resources/font_manager.dart';
import 'package:coffee_wonders/app/resources/strings_manager.dart';
import 'package:coffee_wonders/app/resources/styles_manager.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/presentation/products/view/products_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/values_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<String> image = [
    AssetsManager.brand1,
    AssetsManager.brand2,
    AssetsManager.brand3,
    AssetsManager.brand4,
    AssetsManager.brand5,
    AssetsManager.brand6,
    AssetsManager.brand7,
    AssetsManager.brand8,
  ];
  List<String> banners = [
    AssetsManager.banner1,
    AssetsManager.banner2,
    AssetsManager.banner3,
  ];
  List<String> brandName = [
    "Franke",
    "Frucosol",
    "La marzocco",
    "Migel",
    "Kalerm",
    "Lacimbali",
    "Johny",
    "Mahlkonig"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.searchRoute,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s20,
                vertical: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppSize.s4,
                ),
                border: Border.all(
                  color: ColorManager.grey,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: ColorManager.mintGreen,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / AppSize.s20,
                  ),
                  Text(
                    AppStrings.searchHint.tr(),
                    style: getMediumStyle(
                      fontSize: FontSizeManager.s16.sp,
                      color: ColorManager.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          sliderBanner(banners: banners),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s30,
          ),
          Row(
            children: [
              Image(
                width: AppSize.s30.w,
                color: ColorManager.grey,
                image: const AssetImage(
                  AssetsManager.specialOffer,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / AppSize.s30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.specialOffer.tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      AppStrings.clickOnProducts.tr(),
                      style: getMediumStyle(
                        fontSize: FontSizeManager.s16.sp,
                        color: ColorManager.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s60,
          ),
          SizedBox(
            height: AppSize.s300.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => SharedWidget.productItem(
                context: context,
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: MediaQuery.of(context).size.width / AppSize.s40,
              ),
              itemCount: 7,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s40,
          ),
          Row(
            children: [
              Icon(
                Icons.category_outlined,
                size: AppSize.s30.w,
                color: ColorManager.grey,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / AppSize.s40,
              ),
              Text(
                AppStrings.brands.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s60,
          ),
          SizedBox(
            height: AppSize.s150.h,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => brandItem(
                label: brandName[index],
                context: context,
                image: image[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: MediaQuery.of(context).size.width / AppSize.s40,
              ),
              itemCount: image.length,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.newProduct.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s60,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sliderBanner({required List<String> banners}) => CarouselSlider(
        carouselController: CarouselController(),
        items: banners
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  border: Border.all(
                    color: CacheHelper.getData(key: SharedKey.isDark) == true
                        ? ColorManager.white
                        : ColorManager.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppSize.s10,
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      e,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          height: AppSize.s200.h,
          viewportFraction: 1,
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

  Widget brandItem({
    required BuildContext context,
    required String image,
    required String label,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsScreen(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: AppSize.s100.h,
            height: AppSize.s100.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
              ),
              borderRadius: BorderRadius.circular(
                AppSize.s10,
              ),
              color: ColorManager.primaryColor,
              border: Border.all(
                color: CacheHelper.getData(key: SharedKey.isDark) == true
                    ? ColorManager.white
                    : ColorManager.primaryColor,
              ),
            ),
          ),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
