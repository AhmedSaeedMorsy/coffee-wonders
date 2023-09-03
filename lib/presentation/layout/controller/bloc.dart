import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../../app/constant/api_constant.dart';
import '../../../app/resources/strings_manager.dart';
import '../../../app/services/dio_helper/dio_helper.dart';
import '../../../app/services/shared_prefrences/cache_helper.dart';
import '../../../model/category_model.dart';
import '../../../model/product_model.dart';
import '../../brands/view/brands_screen.dart';
import '../../home/view/home_screen.dart';
import 'states.dart';

class LayoutBloc extends Cubit<LayoutStates> {
  LayoutBloc() : super(LayoutInitState());
  static LayoutBloc get(context) => BlocProvider.of(context);
  int index = 0;
  List<String> appBarTitle = [
    AppStrings.appName,
    AppStrings.brands.tr(),
  ];
  List<Widget> screens = [
    const HomeScreen(),
    const BrandsScreen(),
  ];
  void changeBottomNavBar(int currentIndex) {
    index = currentIndex;
    emit(ChangeBottomNavigationBarState());
  }

  ProductModel productModel = ProductModel();
  List<ProductDataModel> productsList = [];

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


  late Database database;
  List<Map> cart = [];

  void createDataBase() {
    openDatabase(
      "cart.db",
      version: 1,
      onCreate: (database, version) {
        database.execute(
            "create TABLE cart (id integer primary key , title text ,image text , price double ,quantity int ,categoryName)");
      },
      onOpen: (database) {
        getDataFromDataBase(database);
      },
    ).then((value) {
      database = value;
      emit(CreateDataBaseState());
    });
  }

  insertDataBase({
    required int id,
    required String title,
    required String image,
    required double price,
    required int quantity,
    required String categoryName,
  }) async {
    await database.transaction((txn) async {
      return txn
          .rawInsert(
              "insert into cart (id , title , image , price , quantity, categoryName) VALUES('$id','$title','$image', '$price' , '$quantity' ,'$categoryName') ")
          .then((value) {
        emit(InsertIntoDataBaseState());
        getDataFromDataBase(database);
      });
    });
  }

  void getDataFromDataBase(database) {
    cart = [];
    database.rawQuery("select * from cart").then((value) {
      value.forEach((element) {
        cart.add(element);
      });

      emit(GetDataFromDataBaseState());
    });
  }

  void upDateDataBase({
    required int id,
    required int quantity,
  }) {
    database.rawUpdate("""UPDATE cart 
SET quantity = ?
WHERE id = ?""", [quantity, id]).then(
      (value) {
        emit(UpDateDatainDataBaseState());
        getDataFromDataBase(database);
      },
    );
  }

  void deleteFromDataBase({
    required int id,
  }) {
    database.rawDelete('DELETE FROM cart WHERE id = ?', [id]).then((value) {
      emit(DeleteDatainDataBaseState());
      getDataFromDataBase(database);
    });
  }
}
