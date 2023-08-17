import 'dart:math';

import 'package:coffee_wonders/app/constant/api_constant.dart';
import 'package:coffee_wonders/app/services/dio_helper/dio_helper.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/resources/assets_manager.dart';
import 'states.dart';

class HomeBloc extends Cubit<HomeStates> {
  HomeBloc() : super(HomeInitState());
  static HomeBloc get(context) => BlocProvider.of(context);
  List<String> banners = [
    AssetsManager.banner1,
    AssetsManager.banner2,
    AssetsManager.banner3,
  ];


  String categoriesIamge({required int id}) {
    switch (id) {
      case 7568:
        return AssetsManager.lacimbali;
      case 7544:
        return AssetsManager.franke;
      case 7537:
        return AssetsManager.marzocco;
      case 7536:
        return AssetsManager.johny;
      case 7552:
        return AssetsManager.migel;
      case 7586:
        return AssetsManager.kalerm;
      case 7583:
        return AssetsManager.frucosol;
      case 7562:
        return AssetsManager.mahlkonig;
      default:
        return "";
    }
  }


  ProductModel productModel = ProductModel();
  List<String> pages = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20"
  ];
  final random = Random();

  void getProduct() {
    emit(ProductsLoadingState());
    DioHelper.getData(
      path: ApiConstant.productPath,
      queryParameters: {
        "page": pages[random.nextInt(pages.length)],
      },
      token: CacheHelper.getData(
        key: SharedKey.token,
      ),
    ).then((value) {
      productModel = ProductModel.fromJson(value.data);
      emit(ProductsSuccessState());
    }).catchError((error) {
      emit(ProductsErrorState());
    });
  }
}
