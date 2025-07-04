import 'package:foodzy/domain/category_vendors_list/models/category_model.dart';

class VendorModel {
  int? id;
  String? name;
  String? tagline;
  String? details;
  Meta? meta;
  Mediaurls? mediaurls;
  int? minimumOrder;
  int? deliveryFee;
  String? area;
  String? address;
  double? longitude;
  double? latitude;
  int? isVerified;
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<CategoryModel>? categories;
  int? ratings;
  int? ratingsCount;
  int? favouriteCount;
  bool? isFavourite;
  double? distance;
  int? planSortOrder;

  VendorModel(
      {this.id,
      this.name,
      this.tagline,
      this.details,
      this.meta,
      this.mediaurls,
      this.minimumOrder,
      this.deliveryFee,
      this.area,
      this.address,
      this.longitude,
      this.latitude,
      this.isVerified,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.categories,
      this.ratings,
      this.ratingsCount,
      this.favouriteCount,
      this.isFavourite,
      this.distance,
      this.planSortOrder});

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'],
      name: json['name'],
      tagline: json['tagline'],
      details: json['details'],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      mediaurls: json['mediaurls'] != null
          ? Mediaurls.fromJson(json['mediaurls'])
          : null,
      minimumOrder: json['minimum_order'],
      deliveryFee: json['delivery_fee'],
      area: json['area'],
      address: json['address'],
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      isVerified: json['is_verified'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      categories: (json['product_categories'] as List?)
          ?.map((item) => CategoryModel.fromJson(item))
          .toList(),
      ratings: json['ratings'],
      ratingsCount: json['ratings_count'],
      favouriteCount: json['favourite_count'],
      isFavourite: json['is_favourite'],
      distance: (json['distance'] as num?)?.toDouble(),
      planSortOrder: json['plan_sort_order'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tagline'] = tagline;
    data['details'] = details;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (mediaurls != null) {
      data['mediaurls'] = mediaurls!.toJson();
    }
    data['minimum_order'] = minimumOrder;
    data['delivery_fee'] = deliveryFee;
    data['area'] = area;
    data['address'] = address;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['is_verified'] = isVerified;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['ratings'] = ratings;
    data['ratings_count'] = ratingsCount;
    data['favourite_count'] = favouriteCount;
    data['is_favourite'] = isFavourite;
    data['distance'] = distance;

    data['plan_sort_order'] = planSortOrder;
    return data;
  }
}

class Meta {
  String? time;
  String? documentId;
  String? vendorType;
  String? closingTime;
  String? openingTime;
  String? documentLicense;

  Meta(
      {this.time,
      this.documentId,
      this.vendorType,
      this.closingTime,
      this.openingTime,
      this.documentLicense});

  Meta.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    documentId = json['document_id'];
    vendorType = json['vendor_type'];
    closingTime = json['closing_time'];
    openingTime = json['opening_time'];
    documentLicense = json['document_license'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['document_id'] = documentId;
    data['vendor_type'] = vendorType;
    data['closing_time'] = closingTime;
    data['opening_time'] = openingTime;
    data['document_license'] = documentLicense;
    return data;
  }
}

class Mediaurls {
  List<Images>? images;

  Mediaurls({this.images});

  Mediaurls.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? default_;

  Images({this.default_});

  Images.fromJson(Map<String, dynamic> json) {
    default_ = json['default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['default'] = default_;
    return data;
  }
}
