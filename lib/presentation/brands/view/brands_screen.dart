// ignore_for_file: must_be_immutable

import 'package:coffee_wonders/app/resources/color_manager.dart';
import 'package:coffee_wonders/app/resources/values_manager.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/presentation/home/controller/bloc.dart';
import 'package:coffee_wonders/presentation/products/view/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../layout/controller/bloc.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBloc.get(context).categoriesModel.data.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
              color: ColorManager.green,
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => brandItem(
              context: context,
              label: LayoutBloc.get(context).categories[index].name,
              id: LayoutBloc.get(context).categories[index].id,
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s40,
            ),
            itemCount: LayoutBloc.get(context).categories.length,
          );
  }

  Widget brandItem({
    required BuildContext context,
    required String label,
    required int id,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsScreen(
              productsList: LayoutBloc.get(context).chooseCategory(
                id: id,
              ),
              branName: LayoutBloc.get(context).categoriesLabel(
                id: id,
              ),
            ),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            height: AppSize.s150.h,
            width: AppSize.s150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppSize.s6,
              ),
              image: DecorationImage(
                image: AssetImage(
                  HomeBloc.get(context).categoriesIamge(
                    id: id,
                  ),
                ),
              ),
              border: Border.all(
                color: CacheHelper.getData(key: SharedKey.isDark) == true
                    ? ColorManager.white
                    : ColorManager.primaryColor,
              ),
              color: CacheHelper.getData(key: SharedKey.isDark) == true
                  ? ColorManager.primaryColor
                  : ColorManager.white,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / AppSize.s40,
          ),
          Expanded(
            child: Text(
              LayoutBloc.get(context).categoriesLabel(
                id: id,
              ),
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
