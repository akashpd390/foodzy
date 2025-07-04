import 'package:foodzy/domain/category_vendors_list/models/vendors_model.dart';

abstract class VendorsRepo {
  Future<List<VendorModel>> fetchAllVendors();
}
