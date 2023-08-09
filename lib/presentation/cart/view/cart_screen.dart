import 'package:coffee_wonders/app/resources/assets_manager.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/presentation/cart/controller/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/common/widget.dart';
import '../../../app/resources/color_manager.dart';
import '../../../app/resources/font_manager.dart';
import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/strings_manager.dart';
import '../../../app/resources/values_manager.dart';
import '../../product_details/view/product_details_screen.dart';
import '../controller/bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.myCart.tr(),
        ),
      ),
      body: BlocProvider(
        create: (context) => CartBloc(),
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s50,
              vertical: MediaQuery.of(context).size.height / AppSize.s60,
            ),
            child: BlocBuilder<CartBloc, CartStates>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => cartItem(
                          context: context,
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s60,
                        ),
                        itemCount: 10,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s60,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width / AppSize.s50,
                      ),
                      child: Row(
                        children: [
                          Text(
                            style: Theme.of(context).textTheme.bodyMedium,
                            AppStrings.totalPrice.tr(),
                          ),
                          const Spacer(),
                          Text(
                            "${CartBloc.get(context).totalPrice()}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s60,
                    ),
                    SharedWidget.defaultButton(
                      label: AppStrings.goToCheckout.tr(),
                      context: context,
                      width: double.infinity,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.checkoutRoute,
                        );
                      },
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }

  Widget cartItem({
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: AppSize.s130.h,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    AssetsManager.productDemo,
                  ),
                ),
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.circular(
                  AppSize.s8.w,
                ),
                border: Border.all(
                  color: CacheHelper.getData(key: SharedKey.isDark) == true
                      ? ColorManager.white
                      : ColorManager.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / AppSize.s50,
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lacimbali M200",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s60,
                ),
                Text(
                  "200.00",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: FontSizeManager.s16.sp,
                                    color: ColorManager.white,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width / AppSize.s50),
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: FontSizeManager.s16.sp,
                                    color: ColorManager.white,
                                  ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: CacheHelper.getData(key: SharedKey.isDark) == true
                    ? ColorManager.white
                    : ColorManager.black,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
