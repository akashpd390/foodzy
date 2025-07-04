import 'package:foodzy/domain/vendors_screen/model/menu_category_model.dart';

sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<MenuCategoryModel> products;

  ProductsLoaded({required this.products});
}

class ProductsError extends ProductsState {
  final String message;

  ProductsError({required this.message});
}
