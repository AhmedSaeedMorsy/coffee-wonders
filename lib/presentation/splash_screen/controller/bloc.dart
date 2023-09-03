// ignore_for_file: deprecated_member_use

import 'package:coffee_wonders/app/constant/api_constant.dart';
import 'package:coffee_wonders/app/services/dio_helper/dio_helper.dart';
import 'package:coffee_wonders/model/login_model.dart';
import 'package:coffee_wonders/presentation/splash_screen/controller/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/services/shared_prefrences/cache_helper.dart';

class SplashBloc extends Cubit<SplashStates> {
  SplashBloc() : super(SplashInitState());
  static SplashBloc get(context) => BlocProvider.of(context);
  LoginModel loginModel = LoginModel();
  void loginToApi() {
    emit(LoginApiLoadingState());
    DioHelper.postData(
      path: ApiConstant.loginPath,
      data: {
        "login": "coffee",
        "password": "bDZ8IdZCYvYbA9f7",
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.setData(
            key: SharedKey.token,
            value: loginModel.result.data.token,
          );
      emit(
        LoginApiSucessState(),
      );
    }).catchError((error) {
      emit(LoginApiErrorState());
    });
  }
}
