import 'package:coffee_wonders/app/constant/api_constant.dart';
import 'package:coffee_wonders/app/services/dio_helper/dio_helper.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class ProductsBloc extends Cubit<ProductsStates> {
  ProductsBloc() : super(ProductInitState());
  static ProductsBloc get(context) => BlocProvider.of(context);

  ProductModel productModel = ProductModel();
  void getProductsByCategoryId({required int id}) {
    emit(ProductLoadingState());
    DioHelper.getData(
      path: ApiConstant.productsByCategoryId(id: id),
      token: CacheHelper.getData(key: SharedKey.token),
    ).then((value) {
      productModel = ProductModel.fromJson(value.data);
      emit(ProductSuccessState());
    }).catchError((error) {
      emit(ProductErrorState());
    });
  }
}
