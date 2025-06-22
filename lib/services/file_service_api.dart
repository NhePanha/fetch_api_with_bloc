import 'package:auth_with_api/constan/file_constan.dart';
import 'package:auth_with_api/model/file_product_list.dart';
import 'package:http/http.dart' as http;
class ApiService {
  static const String baseUrl = KbasUrl; 
  static Future<ProductList> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return productListFromJson(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
