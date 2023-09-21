// ignore_for_file: must_be_immutable, dead_code

import 'package:coffee_wonders/app/resources/assets_manager.dart';
import 'package:coffee_wonders/app/resources/strings_manager.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/presentation/home/controller/bloc.dart';
import 'package:coffee_wonders/presentation/layout/controller/bloc.dart';
import 'package:coffee_wonders/presentation/layout/controller/states.dart';
import 'package:coffee_wonders/presentation/product_details/controller/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/common/widget.dart';
import '../../../app/resources/color_manager.dart';
import '../../../app/resources/font_manager.dart';
import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/values_manager.dart';
import '../../home/controller/states.dart';
import '../controller/states.dart';

class ProductDetailsScreen extends StatelessWidget {
  late String name;
  late double price;
  late String image;
  late double quantity;
  late String categoryName;
  late int id;

  ProductDetailsScreen({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..getProduct(),
        ),
        BlocProvider(
            create: (context) =>
                ProductDetailsBloc()..getProductDetials(id: id))
      ],
      child: Scaffold(
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
              BlocBuilder<ProductDetailsBloc, ProductDetailsStates>(
                  builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s80,
                    ),
                    sliderBanner(
                      context: context,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width / AppSize.s30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppStrings.price.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: ColorManager.green,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "$price",
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: ColorManager.green,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          ProductDetailsBloc.get(context)
                                      .productDetailsModel
                                      .data
                                      .priceWithTax !=
                                  null
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        AppStrings.priceWithTax.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: ColorManager.green,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        ProductDetailsBloc.get(context)
                                            .productDetailsModel
                                            .data
                                            .priceWithTax
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: ColorManager.green,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          Text(
                            categoryName,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Row(
                            children: [
                              Text(
                                AppStrings.available.tr(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                "${quantity.toInt()}",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppSize.s40,
                          ),
                          Text(
                            ProductDetailsBloc.get(context)
                                        .productDetailsModel
                                        .data
                                        .description ==
                                    false
                                ? ""
                                : ProductDetailsBloc.get(context)
                                            .productDetailsModel
                                            .data
                                            .description !=
                                        null
                                    ? ProductDetailsBloc.get(context)
                                        .productDetailsModel
                                        .data
                                        .description
                                        .toString()
                                    : "",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: ColorManager.mintGreen,
                                      fontSize: FontSizeManager.s18.sp,
                                    ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppSize.s50,
                          ),
                          ProductDetailsBloc.get(context)
                                      .productDetailsModel
                                      .data
                                      .priceWithTax !=
                                  null
                              ? BlocBuilder<LayoutBloc, LayoutStates>(
                                  builder: (context, state) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: SharedWidget.defaultButton(
                                          label: AppStrings.addToCart.tr(),
                                          context: context,
                                          width: double.infinity,
                                          onPressed: () {
                                            LayoutBloc.get(context)
                                                .insertDataBase(
                                              id: id,
                                              title: name,
                                              image: image,
                                              price: ProductDetailsBloc.get(
                                                      context)
                                                  .productDetailsModel
                                                  .data
                                                  .priceWithTax!,
                                              quantity: ProductDetailsBloc.get(
                                                      context)
                                                  .counter,
                                              categoryName: categoryName,
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                AppSize.s30,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          LayoutBloc.get(context).upDateDataBase(
                                              id: id,
                                              quantity: ProductDetailsBloc.get(
                                                      context)
                                                  .incrementProductCounter());
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              AppSize.s8,
                                            ),
                                            color: ColorManager.mintGreen,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                AppSize.s40,
                                          ),
                                          child: Text(
                                            "+",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize:
                                                      FontSizeManager.s16.sp,
                                                  color: ColorManager.white,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                AppSize.s50),
                                        child: Text(
                                          "${ProductDetailsBloc.get(context).counter}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          LayoutBloc.get(context).upDateDataBase(
                                              id: id,
                                              quantity: ProductDetailsBloc.get(
                                                      context)
                                                  .decrementProductCounter());
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              AppSize.s8,
                                            ),
                                            color: ColorManager.mintGreen,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                AppSize.s40,
                                          ),
                                          child: Text(
                                            "-",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize:
                                                      FontSizeManager.s16.sp,
                                                  color: ColorManager.white,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                })
                              : const SizedBox(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppSize.s40,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              BlocBuilder<HomeBloc, HomeStates>(
                builder: (context, state) {
                  return HomeBloc.get(context).products.isEmpty
                      ? SizedBox(
                          height: AppSize.s150.h,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.green,
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width /
                                  AppSize.s30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.otherProducts.tr(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppSize.s60,
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                itemCount: 12,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return SharedWidget.productItem(
                                    context: context,
                                    model:
                                        HomeBloc.get(context).products[index],
                                  );
                                },
                                semanticChildCount: 2,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: AppSize.s6.w,
                                  crossAxisSpacing: AppSize.s6.h,
                                  childAspectRatio:
                                      AppSize.s10.w / AppSize.s18.h,
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sliderBanner({
    required BuildContext context,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / AppSize.s30,
        ),
        child: Container(
          height: AppSize.s200.h,
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            image: image.isNotEmpty
                ? DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.fill,
                  )
                : const DecorationImage(
                    image: AssetImage(
                      AssetsManager.noImage,
                    ),
                    fit: BoxFit.fill,
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
      );
}
