import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test1/Database/Services/products_services.dart';
import 'package:test1/Database/model/product_model.dart';

class ProductController extends GetxController {
  int? id;
  var items = <ProductMolde>[];
  getProductsController() async {
    var products = await Products_Services.Get_Products();
    return products;
    //////////test
  }

  getmyProductsController() async {
    var products = await Products_Services.Getmyproducts();
    return products;
    ///////////test
  }

  get_demo_ProductsController() async {
    var products = await Products_Services.ReadJsonData();
    print(products);
    print('///////////////////////////////////////////');
    return products;
    ///////////test
  }

  deleteproduct(id) async {
    await Products_Services.DeleteProduct(id: id);
    ////test
  }
}
