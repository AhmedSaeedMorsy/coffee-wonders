class ProductDetailsModel {
  ProductDetailsDataModel data = ProductDetailsDataModel();
  ProductDetailsModel();
  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    data = ProductDetailsDataModel.fromJson(json["data"]);
  }
}

class ProductDetailsDataModel {
  String? description;
  ProductDetailsDataModel();
  ProductDetailsDataModel.fromJson(Map<String, dynamic> json) {
    description = json["description"];
  }
}
