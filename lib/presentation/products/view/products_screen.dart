// ignore_for_file: must_be_immutable

import 'package:coffee_wonders/app/common/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/values_manager.dart';
import '../../../model/product_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    super.key,
    required this.productsList,
    required this.branName,
  });
  final List<ProductDataModel> productsList;
  final String branName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(branName),
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
          vertical: MediaQuery.of(context).size.height / AppSize.s60,
          horizontal: MediaQuery.of(context).size.width / AppSize.s40,
        ),
        child: GridView.builder(
          itemCount: productsList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return SharedWidget.productItem(
                context: context, model: productsList[index]);
          },
          semanticChildCount: 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSize.s10.w,
            crossAxisSpacing: AppSize.s5.h,
            childAspectRatio: 1 / 1.6,
          ),
        ),
      ),
    );
  }
}
