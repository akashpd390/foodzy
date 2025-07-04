import 'package:foodzy/data/category_vendors_list/datasource/vendors_datasource.dart';
import 'package:foodzy/domain/category_vendors_list/models/vendors_model.dart';
import 'package:foodzy/domain/category_vendors_list/repository/vendors_repo.dart';

class VendorsRepoImpl implements VendorsRepo {
  final VendorsDataSource dataSource;
  VendorsRepoImpl(this.dataSource);
  @override
  Future<List<VendorModel>> fetchAllVendors() async {
    return await dataSource.fetchVendors();
  }
}
