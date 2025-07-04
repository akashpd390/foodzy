import 'package:foodzy/domain/category_vendors_list/models/vendors_model.dart';
import 'package:foodzy/domain/category_vendors_list/repository/vendors_repo.dart';

class FetchAllVendorsUseCase {
  final VendorsRepo _vendorsRepo;

  FetchAllVendorsUseCase(this._vendorsRepo);

  Future<List<VendorModel>> call() async {
    return await _vendorsRepo.fetchAllVendors();
  }
}
