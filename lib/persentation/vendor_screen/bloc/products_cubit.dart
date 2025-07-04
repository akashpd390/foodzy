import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodzy/data/vendors_screen/datasource/product_datasource.dart';
import 'package:foodzy/data/vendors_screen/repository_impl/products_repo_impl.dart';
import 'package:foodzy/domain/vendors_screen/usecase/fetch_products_usecase.dart';
import 'package:foodzy/persentation/vendor_screen/bloc/state/products_state.dart';

class ProductCubit extends Cubit<ProductsState> {
  final FetchProductsUseCase usecase = FetchProductsUseCase(
      ProductRepoImpl(productDataSource: ProductDataSource()));

  ProductCubit() : super(ProductsInitial());

  Future<void> fetchProducts(int vendorsID) async {
    try {
      emit(ProductsLoading());
      final products = await usecase.call(vendorsID);
      emit(ProductsLoaded(products: products));
    } catch (e) {
      emit(ProductsError(message: e.toString()));
    }
  }
}
