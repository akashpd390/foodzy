import 'package:foodzy/data/vendors_screen/datasource/product_datasource.dart';
import 'package:foodzy/domain/vendors_screen/model/menu_category_model.dart';
import 'package:foodzy/domain/vendors_screen/repository/products_repo.dart';

class ProductRepoImpl implements ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepoImpl({required this.productDataSource});

  @override
  Future<List<MenuCategoryModel>> fetchProducts(int vendorsId) async {
    try {
      return productDataSource.fetchProducts(vendorsId);
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
