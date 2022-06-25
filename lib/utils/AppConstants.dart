class AppConstants {
                   /*  for app   */
  static const String APP_NAME = "food delivery";
  static const int APP_VERSION = 1;

                   /*  for api   */

  //for base Uri
  static const String BASE_URL = "http://mvs.bslmeiyu.com";//http://mvs.bslmeiyu.com

  //for product
  static const String POPULAR_PRODUCT_URL = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URL = "/api/v1/products/recommended";

  //for Auth
  static const String REGISTERATION_URL = "/api/v1/auth/register";
  static const String LOGIN_URL = "/api/v1/auth/login";
  static const String USER_INFO = "/api/v1/customer/info?con";

  //for Address
  static const String GEOCODE_URI = '/api/v1/config/geocode-api';
  static const String ZONE_URI = '/api/v1/config/get-zone-id';
  static const String ADD_USER_ADDRESS = "/api/v1/customer/address/add";
  static const String ADDRESS_LIST_URI = "/api/v1/customer/address/list";
  static const String SEARCH_LOCATION_URI = '/api/v1/config/place-api-autocomplete';
  static const String PLACE_DETATLS_URI = '/api/v1/config/place-api-details';
 /*
 Order config
  */
  static const String PLACE_ORDER_URI = '/api/v1/customer/order/place';

  /*  for local storage   */

  //for Auth
  static const String TOKEN = "token";
  static const String PHONE = "phone";
  static const String PASSWORD = "password";

  //for address
  static const String USER_ADDRESS = "user_address";

  //for user cart
  static const String CART_KEY = "cart_key";
  static const String CART_HISTORY_KEY = "cart_history_key";
}
