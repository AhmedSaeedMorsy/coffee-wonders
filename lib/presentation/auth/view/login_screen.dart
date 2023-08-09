import 'package:animate_do/animate_do.dart';
import 'package:coffee_wonders/app/common/widget.dart';
import 'package:coffee_wonders/app/resources/assets_manager.dart';
import 'package:coffee_wonders/app/resources/color_manager.dart';
import 'package:coffee_wonders/app/resources/routes_manager.dart';
import 'package:coffee_wonders/app/resources/strings_manager.dart';
import 'package:coffee_wonders/app/resources/values_manager.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: ElasticIn(
                duration:
                    const Duration(milliseconds: AppIntDuration.duration500),
                child: Image(
                  width: AppSize.s200.h,
                  height: AppSize.s200.h,
                  image: CacheHelper.getData(key: SharedKey.isDark)== true
                      ? const AssetImage(
                          AssetsManager.logoWhite,
                        )
                      : const AssetImage(
                          AssetsManager.logo,
                        ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s20,
              ),
              child: Form(
                child: Column(
                  children: [
                    Text(
                      style: Theme.of(context).textTheme.bodyLarge,
                      AppStrings.login.tr(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s60,
                    ),
                    SharedWidget.defaultTextFormField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.emailAddress,
                      context: context,
                      hint: "demo@coffeewonders.com",
                      prefixIcon: const Icon(
                        Icons.alternate_email_outlined,
                        color: ColorManager.grey,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s60,
                    ),
                    SharedWidget.defaultTextFormField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.visiblePassword,
                      context: context,
                      hint: "123456",
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: ColorManager.grey,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s20,
                    ),
                    SharedWidget.defaultButton(
                      label: AppStrings.login.tr(),
                      context: context,
                      width: double.infinity,
                      height: AppSize.s42.h,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.layoutRoute,
                        );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.registerRoute,
                        );
                      },
                      child: Text(
                        AppStrings.createAnAccount.tr(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
