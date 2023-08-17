// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/presentation/layout/controller/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../presentation/layout/controller/states.dart';
import 'common/widget.dart';
import 'resources/color_manager.dart';
import 'resources/language_manager.dart';
import 'resources/routes_manager.dart';
import 'resources/strings_manager.dart';
import 'resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => LayoutBloc()
            ..getProducts()
            ..getCategories()
            ..createDataBase(),
          child: BlocListener<LayoutBloc, LayoutStates>(
            listener: (context, state) {
              if (state is InsertIntoDataBaseState) {
                SharedWidget.toast(
                  message: AppStrings.successAddedToCart.tr(),
                  backgroundColor: ColorManager.green,
                );
              }
            },
            child: MaterialApp(
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              debugShowCheckedModeBanner: false,
              theme: CacheHelper.getData(key: SharedKey.isDark) != true
                  ? getAppLightTheme()
                  : getAppDarkTheme(),
              initialRoute: Routes.splashRoute,
              onGenerateRoute: RouteGenerator.getRoute,
            ),
          ),
        );
      },
    );
  }
}
