
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
  List<ProductDataModel> products = [];
  void getProduct() {
    emit(ProductsLoadingState());
    DioHelper.getData(
      path: ApiConstant.productPath,
      token: CacheHelper.getData(
        key: SharedKey.token,
      ),
    ).then((value) {
      productModel = ProductModel.fromJson(value.data);
      for (var item in productModel.data) {
        if (item.categoryId == 7568 ||
            item.categoryId == 7544 ||
            item.categoryId == 7537 ||
            item.categoryId == 7536 ||
            item.categoryId == 7552 ||
            item.categoryId == 7586 ||
            item.categoryId == 7583 ||
            item.categoryId == 7562) {
          products.add(item);
        }
      }
      emit(ProductsSuccessState());
    }).catchError((error) {
      emit(ProductsErrorState());
    });
  }
}
