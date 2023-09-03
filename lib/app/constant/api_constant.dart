class ApiConstant {
  static const String baseUrl = "https://coffee-wonders-test.odoo.com";
  static const String loginPath = "/api/authenticate";
  static const String categoriesPath = "/api/category";
  static const String productPath = "/api/product";
  static String productDetialsPath({
    required int id,
  }) =>
      "/api/product/$id";
  static const String countryPath = "/api/country";
  static String statePath({required int id}) => "/api/state/country/$id";
  static const String checkoutPath ="/api/sale/order";
  static String productsByCategoryId({required int id})=>"/api/all/category/products/$id";
}
