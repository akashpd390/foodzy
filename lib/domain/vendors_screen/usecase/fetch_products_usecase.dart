import 'package:foodzy/domain/vendors_screen/model/menu_category_model.dart';
import 'package:foodzy/domain/vendors_screen/repository/products_repo.dart';

class FetchProductsUseCase {
  final ProductRepository _productRepository;

  FetchProductsUseCase(this._productRepository);

  Future<List<MenuCategoryModel>> call(int vendorsId) async {
    return await _productRepository.fetchProducts(vendorsId);
  }
}
