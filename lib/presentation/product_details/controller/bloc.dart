import 'package:coffee_wonders/app/constant/api_constant.dart';
import 'package:coffee_wonders/app/services/dio_helper/dio_helper.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:coffee_wonders/presentation/product_details/controller/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/product_details_model.dart';

class ProductDetailsBloc extends Cubit<ProductDetailsStates> {
  ProductDetailsBloc() : super(ProductDetailsInitState());
  static ProductDetailsBloc get(context) => BlocProvider.of(context);

  ProductDetailsModel productDetailsModel = ProductDetailsModel();
  void getProductDetials({
    required int id,
  }) {
    emit(ProductDetailsLoadingState());
    DioHelper.getData(
        path: ApiConstant.productDetialsPath(id: id),
        token: CacheHelper.getData(
          key: SharedKey.token,
        )).then((value) {
      productDetailsModel = ProductDetailsModel.fromJson(value.data);
      emit(ProductDetailsSuccessState());
    }).catchError((error) {
      emit(ProductDetailsErrorState());
    });
  }

  int counter = 1;
  int incrementProductCounter() {
    ++counter;

    return counter;
  }

  int decrementProductCounter() {
    --counter;
    if (counter < 1) {
      counter = 1;
    }
    return counter;
  }
}
