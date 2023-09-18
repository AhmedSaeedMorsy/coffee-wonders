import 'package:coffee_wonders/app/constant/api_constant.dart';
import 'package:coffee_wonders/app/services/dio_helper/dio_helper.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/resources/assets_manager.dart';
import '../../../model/category_model.dart';
import 'states.dart';

class HomeBloc extends Cubit<HomeStates> {
  HomeBloc() : super(HomeInitState());
  static HomeBloc get(context) => BlocProvider.of(context);
  List<String> banners = [
    AssetsManager.banner1,
    AssetsManager.banner2,
    AssetsManager.banner3,
  ];

  List<DataCategoriesModel> categories = [];

  CategoriesModel categoriesModel = CategoriesModel();
  void getCategories() {
    emit(CategoriesLoadingState());

    DioHelper.getData(
      path: ApiConstant.categoriesPath,
      token: CacheHelper.getData(
        key: SharedKey.token,
      ),
    ).then((value) {
      categories = [];
      categoriesModel = CategoriesModel.fromJson(value.data);
      for (var item in categoriesModel.data) {
        if (item.id == 7568 ||
            item.id == 7544 ||
            item.id == 7537 ||
            item.id == 7536 ||
            item.id == 7552 ||
            item.id == 7586 ||
            item.id == 7583 ||
            item.id == 7562) {
          categories.add(item);
        }
      }
      emit(CategoriesSuccessState());
    }).catchError((error) {
      emit(CategoriesErrorState());
    });
  }

  String categoriesLabel({required int id}) {
    switch (id) {
      case 7568:
        return "Lacimbali";
      case 7544:
        return "Franke";
      case 7537:
        return "La marzocco";
      case 7536:
        return "Johny";
      case 7552:
        return "Migel";
      case 7586:
        return "Kalerm";
      case 7583:
        return "Frucosol";
      case 7562:
        return "Mahlkonig";
      default:
        return "";
    }
  }

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
