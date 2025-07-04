import 'dart:convert';
import 'package:foodzy/domain/category_vendors_list/models/vendors_model.dart';
import 'package:http/http.dart' as http;

class VendorsDataSource {
  final String baseUrl;

  VendorsDataSource({required this.baseUrl});

  Future<List<VendorModel>> fetchVendors() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      return _parseVendors(response);
    } catch (e) {
      throw Exception('Failed to fetch vendors: $e');
    }
  }

  _parseVendors(http.Response response) {
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> jsonData = data["data"] as List<dynamic>;
      return jsonData.map((json) => VendorModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vendors');
    }
  }
}
