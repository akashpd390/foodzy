import 'dart:convert';
import 'package:foodzy/core/config/app_config.dart';
import 'package:foodzy/domain/vendors_screen/model/menu_category_model.dart';
import 'package:http/http.dart' as http;

import 'package:foodzy/domain/vendors_screen/model/menu_itme.dart';

////
///
///
///
///         Its fetching the profucts from the server
///
///         but i could figure out the api to fetching the food items
///         provided by the vendors show i just fetch these three items by id of the vendors
///
///
class ProductDataSource {
  final String sandwitchBaseUrl = AppConfig.sandwhitchBaseUrl;
  final String pizzaBaseUrl = AppConfig.pizzaBaseUrl;
  final String burgerBaseUrl = AppConfig.burgerBaseUrl;

  ProductDataSource();

  Future<List<MenuCategoryModel>> fetchProducts(int vendorsId) async {
    try {
      final List<MenuItemModel> pizzaResponse = await _fetchPizza(vendorsId);
      final List<MenuItemModel> burgerResponse = await _fetchBurger(vendorsId);
      final List<MenuItemModel> sandwitchResponse =
          await _fetchSandwitch(vendorsId);

      return [
        MenuCategoryModel(
          id: 35,
          categoryName: "Pizza",
          items: pizzaResponse,
        ),
        MenuCategoryModel(
          id: 36,
          categoryName: "Burger",
          items: burgerResponse,
        ),
        MenuCategoryModel(
          id: 37,
          categoryName: "Sandwich",
          items: sandwitchResponse,
        ),
      ];
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<List<MenuItemModel>> _fetchPizza(int vendorsId) async {
    try {
      final response = await http.get(Uri.parse("$pizzaBaseUrl$vendorsId"));
      return _parseResponse(response);
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<List<MenuItemModel>> _fetchBurger(int vendorsId) async {
    try {
      final response = await http.get(Uri.parse("$burgerBaseUrl$vendorsId"));
      return _parseResponse(response);
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<List<MenuItemModel>> _fetchSandwitch(int vendorsId) async {
    try {
      final response = await http.get(Uri.parse("$sandwitchBaseUrl$vendorsId"));
      return _parseResponse(response);
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  List<MenuItemModel> _parseResponse(http.Response response) {
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final data = jsonData["data"] as List<dynamic>;
      return data.map((json) => MenuItemModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to parse products');
    }
  }
}
