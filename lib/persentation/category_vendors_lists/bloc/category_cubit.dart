import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodzy/core/config/app_config.dart';
import 'package:foodzy/data/category_vendors_list/datasource/category_datasource.dart';
import 'package:foodzy/data/category_vendors_list/repositoryImpl/category_repo_impl.dart';
import 'package:foodzy/domain/category_vendors_list/usecase/fetchall_category_usecase.dart';
import 'package:foodzy/persentation/category_vendors_lists/bloc/state/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final FetchAllCategoryUseCase useCase = FetchAllCategoryUseCase(
      CategoryRepositoryImpl(CategoryDataSource(AppConfig.categoryBaseUrl)));

  CategoryCubit() : super(CategoryInitial());

  Future<void> fetchCategory() async {
    try {
      emit(CategoryLoading());
      final categories = await useCase.call();
      emit(CategoryLoaded(categories: categories));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
