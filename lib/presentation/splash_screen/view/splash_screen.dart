import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/presentation/splash_screen/controller/bloc.dart';
import 'package:coffee_wonders/presentation/splash_screen/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/resources/assets_manager.dart';
import '../../../app/resources/color_manager.dart';
import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/values_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..loginToApi(),
      child: BlocConsumer<SplashBloc, SplashStates>(listener: (context, state) {
        if (state is LoginApiSucessState) {
          CacheHelper.setData(
            key: SharedKey.token,
            value: SplashBloc.get(context).loginModel.result.data.token,
          );
          Navigator.pushReplacementNamed(
            context,
            Routes.layoutRoute,
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.white,
          body: SizedBox(
            child: Center(
              child: Image(
                width: AppSize.s250.w,
                image: const AssetImage(
                  AssetsManager.logo,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
