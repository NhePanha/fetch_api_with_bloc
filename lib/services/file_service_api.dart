import 'dart:convert';

import 'package:auth_with_api/constan/file_constan.dart';
import 'package:auth_with_api/model/file_product_list.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String apiUrl = KbasUrl; // Replace with your API
  static Future<List<ProductList>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => ProductList.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}