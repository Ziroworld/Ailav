class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://192.168.1.68:8080/api/v3/";
  // static const String baseUrl = "http://10.0.2.2:8080/api/v3/";

  // ---------------Auth Routes---------------
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String uploadImage = "auth/uploadImage";
  static const String updateUser = "users";

  // ---------------Product Routes---------------
  static const String getAllProducts = "product/findall";

  // ---------------Cart Routes---------------
  static const String cart = "cart";
  static const String addProductToCart = "cart/add";
  static const String removeProductFromCart = "cart/remove";
  static const String clearCart = "cart/clear";
}
