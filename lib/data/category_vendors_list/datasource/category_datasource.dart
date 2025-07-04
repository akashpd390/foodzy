import 'dart:convert';

import 'package:foodzy/domain/category_vendors_list/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryDataSource {
  final String baseUrl;

  CategoryDataSource(this.baseUrl);

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      return _parseCategories(response);
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  _parseCategories(http.Response response) {
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> jsonData = data as List<dynamic>;
      return jsonData.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
