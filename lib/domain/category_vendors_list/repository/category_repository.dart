import 'package:foodzy/domain/category_vendors_list/models/category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> fetchCategories();
}
