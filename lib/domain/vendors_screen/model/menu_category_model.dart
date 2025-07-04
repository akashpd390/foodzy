import 'package:foodzy/domain/vendors_screen/model/menu_itme.dart';

class MenuCategoryModel {
  int? id;
  String? categoryName;
  List<MenuItemModel>? items;

  MenuCategoryModel({this.id, this.categoryName, this.items});

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) {
    return MenuCategoryModel(
      categoryName: json['category_name'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => MenuItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_name': categoryName,
      'items': items?.map((item) => item.toJson()).toList(),
    };
  }
}
