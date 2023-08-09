// ignore_for_file: must_be_immutable, library_prefixes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../app/resources/assets_manager.dart';
import '../../../app/resources/color_manager.dart';
import '../../../app/resources/routes_manager.dart';
import '../../order_details/view/order_details_screen.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.myOrders.tr(),
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
          vertical: MediaQuery.of(context).size.height / AppSize.s80,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => orderItem(
                  context: context,
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                    vertical: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                  child: Container(
                    color: ColorManager.green,
                    width: double.infinity,
                    height: AppSize.s1,
                  ),
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderItem({
    required BuildContext context,
  }) =>
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OrderDetailsScreen(),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / AppSize.s30,
            vertical: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage(
                      AssetsManager.shopBag,
                    ),
                    color: ColorManager.mintGreen,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / AppSize.s30,
                  ),
                  Text(
                    "Status",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: MediaQuery.of(context).size.width / AppSize.s14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s50,
                    ),
                    Text(
                      "2023-7-32",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s80,
                    ),
                    Text(
                      "EGP 2052",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
