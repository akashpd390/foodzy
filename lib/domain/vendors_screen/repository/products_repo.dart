import 'package:foodzy/domain/vendors_screen/model/menu_category_model.dart';

abstract class ProductRepository {
  Future<List<MenuCategoryModel>> fetchProducts(int vendorsId);
}
