import 'package:foodzy/domain/category_vendors_list/models/vendors_model.dart';

sealed class VendorsState {}

class VendorsInitialState extends VendorsState {}

class VendorsLoadingState extends VendorsState {}

class VendorsLoadedState extends VendorsState {
  final List<VendorModel> vendors;

  VendorsLoadedState(this.vendors);
}

class VendorsErrorState extends VendorsState {
  final String errorMessage;

  VendorsErrorState(this.errorMessage);
}
