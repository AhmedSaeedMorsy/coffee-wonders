// ignore_for_file: must_be_immutable

import 'package:coffee_wonders/app/resources/assets_manager.dart';
import 'package:coffee_wonders/app/resources/color_manager.dart';
import 'package:coffee_wonders/app/resources/values_manager.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/presentation/products/view/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsScreen extends StatelessWidget {
  BrandsScreen({super.key});
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
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => brandItem(
        context: context,
        image: image[index],
        label: brandName[index],
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: MediaQuery.of(context).size.height / AppSize.s40,
      ),
      itemCount: image.length,
    );
  }

  Widget brandItem({
    required BuildContext context,
    required String image,
    required String label,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductsScreen()));
      },
      child: Row(
        children: [
          Container(
            height: AppSize.s150.h,
            width: AppSize.s150.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
              ),
              borderRadius: BorderRadius.circular(
                AppSize.s6,
              ),
              border: Border.all(
                color: CacheHelper.getData(key: SharedKey.isDark) == true
                    ? ColorManager.white
                    : ColorManager.primaryColor,
              ),
              color: ColorManager.primaryColor,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / AppSize.s40,
          ),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
