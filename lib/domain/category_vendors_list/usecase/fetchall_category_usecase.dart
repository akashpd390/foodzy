import 'package:foodzy/domain/category_vendors_list/models/category_model.dart';
import 'package:foodzy/domain/category_vendors_list/repository/category_repository.dart';

class FetchAllCategoryUseCase {
  final CategoryRepository _categoryRepository;

  FetchAllCategoryUseCase(this._categoryRepository);

  Future<List<CategoryModel>> call() async {
    return await _categoryRepository.fetchCategories();
  }
}
