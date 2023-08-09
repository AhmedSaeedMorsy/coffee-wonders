import 'package:coffee_wonders/app/resources/color_manager.dart';
import 'package:coffee_wonders/app/resources/font_manager.dart';
import 'package:coffee_wonders/app/resources/strings_manager.dart';
import 'package:coffee_wonders/app/resources/values_manager.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User name",
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: FontSizeManager.s22.sp,
                          ),
                    ),
                    Text(
                      "demo@coffeewonders.com",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
              CircleAvatar(
                radius: AppSize.s42.w,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s60,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s40,
              vertical: MediaQuery.of(context).size.height / AppSize.s80,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppSize.s8,
              ),
              border: Border.all(
                color: CacheHelper.getData(key: SharedKey.isDark)== true
                    ? ColorManager.white
                    : ColorManager.black,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.person_2_outlined,
                      color: ColorManager.grey,
                    ),
                    Text(
                      AppStrings.profileSettings.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: ColorManager.grey,
                      ),
                      onPressed: () {},
                      child: Text(
                        AppStrings.edit.tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.fullName.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width / AppSize.s40,
                      ),
                      child: Text(
                        "User Name",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.email.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width / AppSize.s40,
                      ),
                      child: Text(
                        "demo@coffeewonders.com",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.phoneNumber.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width / AppSize.s40,
                      ),
                      child: Text(
                        "01029670053",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.address.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width / AppSize.s40,
                      ),
                      child: Text(
                        "Maadi - cairo",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s40,
              vertical: MediaQuery.of(context).size.height / AppSize.s80,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppSize.s8,
              ),
              border: Border.all(
                color: CacheHelper.getData(key: SharedKey.isDark)== true
                    ? ColorManager.white
                    : ColorManager.black,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      color: ColorManager.grey,
                      Icons.payment,
                    ),
                    Text(
                      AppStrings.paymentSettings.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: ColorManager.grey,
                      ),
                      onPressed: () {},
                      child: Text(
                        AppStrings.edit.tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.defaultCreditCard.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width / AppSize.s40,
                      ),
                      child: Text(
                        "...${"4523569832569876".substring(12)}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
