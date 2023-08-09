// ignore_for_file: library_prefixes

import 'package:coffee_wonders/app/common/function.dart';
import 'package:coffee_wonders/app/common/widget.dart';
import 'package:coffee_wonders/app/resources/font_manager.dart';
import 'package:coffee_wonders/app/resources/styles_manager.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/presentation/layout/controller/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/resources/color_manager.dart';
import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/strings_manager.dart';
import '../../../app/resources/values_manager.dart';

import '../controller/bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutBloc(),
      child: BlocBuilder<LayoutBloc, LayoutStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(LayoutBloc.get(context)
                  .appBarTitle[LayoutBloc.get(context).index]),
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
            drawer: drawerItem(
              context: context,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s30,
              ),
              child: LayoutBloc.get(context)
                  .screens[LayoutBloc.get(context).index],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.category_outlined,
                    ),
                    label: "Category"),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                  ),
                  label: "Favorites",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_2_outlined,
                  ),
                  label: "Profile",
                ),
              ],
              currentIndex: LayoutBloc.get(context).index,
              onTap: (index) {
                LayoutBloc.get(context).changeBottomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }

  Widget drawerItem({
    required BuildContext context,
  }) {
    return Drawer(
      backgroundColor: CacheHelper.getData(key: SharedKey.isDark)== true
          ? ColorManager.black
          : ColorManager.white,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CacheHelper.getData(
                      key: SharedKey.token,
                    ) !=
                    null
                ? Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width / AppSize.s30,
                      vertical:
                          MediaQuery.of(context).size.height / AppSize.s40,
                    ),
                    color: ColorManager.black.withOpacity(.8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s36,
                        ),
                        CircleAvatar(
                          radius: AppSize.s42.w,
                        ),
                        Text(
                          "Profile name",
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: FontSizeManager.s20.sp,
                                  ),
                        ),
                        Text(
                          "demo@coffeeWonders.com",
                          style: getRegularStyle(
                            fontSize: FontSizeManager.s14.sp,
                            color: ColorManager.grey,
                          ),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / AppSize.s10,
                      left: MediaQuery.of(context).size.width / AppSize.s30,
                      right: MediaQuery.of(context).size.width / AppSize.s30,
                    ),
                    child: SharedWidget.defaultButton(
                      label: AppStrings.login.tr(),
                      context: context,
                      width: double.infinity,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.loginRoute,
                        );
                      },
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                vertical: MediaQuery.of(context).size.height / AppSize.s40,
              ),
              child: Column(
                children: [
                  drawerListItem(
                    context: context,
                    onTap: () {
                      Navigator.pop(context);
                      LayoutBloc.get(context).changeBottomNavBar(0);
                    },
                    icon: Icons.home_outlined,
                    text: AppStrings.home.tr(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s40,
                  ),
                  drawerListItem(
                    context: context,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.notificationRoute,
                      );
                    },
                    icon: Icons.notifications_none,
                    text: AppStrings.notification.tr(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s40,
                  ),
                  drawerListItem(
                    context: context,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.myOrdersRoute,
                      );
                    },
                    icon: Icons.shopping_bag_outlined,
                    text: AppStrings.myOrders.tr(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s40,
                  ),
                  drawerListItem(
                    context: context,
                    onTap: () {
                      Navigator.pop(context);
                      LayoutBloc.get(context).changeBottomNavBar(2);
                    },
                    icon: Icons.favorite_border,
                    text: AppStrings.favoriteProducts.tr(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s40,
                  ),
                  drawerListItem(
                    context: context,
                    onTap: () {},
                    icon: Icons.message_outlined,
                    text: AppStrings.messages.tr(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s40,
                  ),
                  drawerListItem(
                    context: context,
                    onTap: () {},
                    icon: Icons.help_outline_outlined,
                    text: AppStrings.helpAndSupport.tr(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s40,
                  ),
                  drawerListItem(
                    context: context,
                    onTap: () {
                      SharedFunction.changeLanguage(context);
                    },
                    icon: Icons.language_outlined,
                    text: AppStrings.languages.tr(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s40,
                  ),
                  drawerListItem(
                    context: context,
                    onTap: () {
                      SharedFunction.changeAppMode(
                        context,
                      );
                    },
                    icon: Icons.dark_mode_outlined,
                    text: CacheHelper.getData(key: SharedKey.isDark)== true
                        ? AppStrings.lightMode.tr()
                        : AppStrings.darkMode.tr(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s40,
                  ),
                  drawerListItem(
                    context: context,
                    onTap: () {},
                    icon: Icons.login_outlined,
                    text: AppStrings.logOut.tr(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget drawerListItem({
    required BuildContext context,
    required Function() onTap,
    required IconData icon,
    required String text,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: ColorManager.grey,
            size: AppSize.s26.w,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / AppSize.s16,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: FontSizeManager.s18.sp,
                ),
          ),
        ],
      ),
    );
  }
}
