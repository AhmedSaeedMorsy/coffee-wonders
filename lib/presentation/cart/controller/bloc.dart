import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class CartBloc extends Cubit<CartStates> {
  CartBloc() : super(CartInitState());
  static CartBloc get(context) => BlocProvider.of(context);
  void incrementProductCounter() {
    emit(IncrementProductCounterState());
  }

  void decrementProductCounter() {
    emit(DecrementProductCounterState());
  }

  List<Map<String, int>> productsListInCart = [];

  double totalPrice() {
    double total = 0.0;

    return total;
  }
}
