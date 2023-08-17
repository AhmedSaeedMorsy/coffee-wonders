import 'package:coffee_wonders/app/constant/api_constant.dart';
import 'package:coffee_wonders/app/services/dio_helper/dio_helper.dart';
import 'package:coffee_wonders/app/services/shared_prefrences/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class CheckoutBloc extends Cubit<CheckoutStates> {
  CheckoutBloc() : super(CheckoutInitState());
  static CheckoutBloc get(context) => BlocProvider.of(context);
  List<Map> products = [];
  void productsInCart(List<Map> cart) {
    for (var element in cart) {
      Map product = {};

      product["id"] = element["id"];
      product["quantity"] = element["quantity"];
      products.add(product);
    }
  }

  void checkout({
    required String fullName,
    required String email,
    required String phone,
    required int countryId,
    required String city,
    required int stateId,
    required String area,
    required String building,
    required String apartment,
    required String postalCode,
  }) {
    emit(CheckoutLoadingState());
    DioHelper.postData(
      path: ApiConstant.checkoutPath,
      token: CacheHelper.getData(key: SharedKey.token),
      data: {
        "fullname": fullName,
        "email": email,
        "phone": phone,
        "country": countryId,
        "city": city,
        "state": stateId,
        "area": area,
        "building": building,
        "apartment": apartment,
        "postal_code": postalCode,
        "products": products,
      },
    ).then((value) {
      emit(CheckoutSuccessState());
    }).catchError((error) {
      emit(CheckoutErrorState());
    });
  }
}
