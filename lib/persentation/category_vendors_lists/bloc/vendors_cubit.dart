import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodzy/core/config/app_config.dart';
import 'package:foodzy/data/category_vendors_list/datasource/vendors_datasource.dart';
import 'package:foodzy/data/category_vendors_list/repositoryImpl/vendors_repo_impl.dart';
import 'package:foodzy/domain/category_vendors_list/models/vendors_model.dart';
import 'package:foodzy/domain/category_vendors_list/usecase/fetchAll_vendors_usecase.dart';
import 'package:foodzy/persentation/category_vendors_lists/bloc/state/vendors_state.dart';

class VendorsCubit extends Cubit<VendorsState> {
  final FetchAllVendorsUseCase useCase = FetchAllVendorsUseCase(
      VendorsRepoImpl(VendorsDataSource(baseUrl: AppConfig.vendorsBaseUrl)));

  VendorsCubit() : super(VendorsInitialState());

  Future<void> fetchVendors() async {
    emit(VendorsLoadingState());
    try {
      emit(VendorsLoadingState());
      final List<VendorModel> vendors = await useCase.call();
      if (vendors.isNotEmpty) {
        emit(VendorsLoadedState(vendors));
      } else {
        emit(VendorsErrorState('No vendors found'));
      }
    } catch (e) {
      emit(VendorsErrorState(e.toString()));
    }
  }
}
