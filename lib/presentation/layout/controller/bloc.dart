import 'package:coffee_wonders/app/resources/strings_manager.dart';
import 'package:coffee_wonders/presentation/brands/view/brands_screen.dart';
import 'package:coffee_wonders/presentation/favorites/view/favorites_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/view/home_screen.dart';
import '../../profile/view/profile_screen.dart';
import 'states.dart';

class LayoutBloc extends Cubit<LayoutStates> {
  LayoutBloc() : super(LayoutInitState());
  static LayoutBloc get(context) => BlocProvider.of(context);
  int index = 0;
  List<String> appBarTitle = [
    AppStrings.appName,
    AppStrings.brands.tr(),
    AppStrings.favoriteProducts.tr(),
    AppStrings.profile.tr()
  ];
  List<Widget> screens = [
    HomeScreen(),
    BrandsScreen(),
    const FavoritesScreen(),
    const ProfileScreen()
  ];
  void changeBottomNavBar(int currentIndex) {
    index = currentIndex;
    emit(ChangeBottomNavigationBarState());
  }
}
