import 'package:foodzy/data/category_vendors_list/datasource/category_datasource.dart';
import 'package:foodzy/domain/category_vendors_list/models/category_model.dart';
import 'package:foodzy/domain/category_vendors_list/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource dataSource;

  CategoryRepositoryImpl(this.dataSource);

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final categories = await dataSource.fetchCategories();
      return categories;
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }
}
