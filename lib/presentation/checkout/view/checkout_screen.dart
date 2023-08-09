import 'package:coffee_wonders/presentation/cart/controller/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/common/widget.dart';
import '../../../app/resources/color_manager.dart';
import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/strings_manager.dart';
import '../../../app/resources/values_manager.dart';
import '../../cart/controller/bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.confirmation.tr(),
        ),
      ),
      body: BlocProvider(
        create: (context) => CartBloc(),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: MediaQuery.of(context).size.width / AppSize.s20,
            vertical: MediaQuery.of(context).size.height / AppSize.s80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: MediaQuery.of(context).size.height / AppSize.s50,
                  horizontal: MediaQuery.of(context).size.width / AppSize.s60,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(
                    AppSize.s10.w,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.name.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          ":",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width / AppSize.s30,
                        ),
                        Expanded(
                          child: Text(
                            "Name ",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s60,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.phoneNumber.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          ":",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width / AppSize.s30,
                        ),
                        Expanded(
                          child: Text(
                            "01029670053",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s60,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.address.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          ":",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width / AppSize.s30,
                        ),
                        Expanded(
                          child: Text(
                            "Address",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Text(
                AppStrings.orderDetails.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => cartItem(
                    context: context,
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s60,
                  ),
                  itemCount: 7,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              BlocBuilder<CartBloc, CartStates>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.totalPrice.tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "${CartBloc.get(context).totalPrice()}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.deliveryMethod.tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    AppStrings.cashOnDelivery.tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              SharedWidget.defaultButton(
                label: AppStrings.confirmation.tr(),
                context: context,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.layoutRoute,
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cartItem({
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: AppSize.s120.h,
              decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.circular(
                  AppSize.s8.w,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / AppSize.s50,
          ),
          Expanded(
            flex: 2,
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width / AppSize.s50),
                  child: Text(
                    "1",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
