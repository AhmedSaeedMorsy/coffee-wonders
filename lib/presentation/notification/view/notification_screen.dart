import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../app/resources/color_manager.dart';
import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/strings_manager.dart';
import '../../../app/resources/values_manager.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.notification.tr(),
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
          vertical: MediaQuery.of(context).size.height / AppSize.s60,
          horizontal: MediaQuery.of(context).size.width / AppSize.s40,
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => notificationItem(
            context: context,
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s40,
          ),
          itemCount: 10,
        ),
      ),
    );
  }

  Widget notificationItem({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / AppSize.s40,
        vertical: MediaQuery.of(context).size.height / AppSize.s60,
      ),
      decoration: BoxDecoration(
        color: ColorManager.lightGreen,
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notification Title",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorManager.primaryColor,
                ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s120,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorManager.black,
                ),
          )
        ],
      ),
    );
  }
}
