class MenuItemModel {
  int? id;
  String? title;
  String? detail;
  Meta? meta;
  int? price;
  String? owner;
  Mediaurls? mediaurls;
  String? createdAt;
  String? updatedAt;
  int? ratings;
  int? ratingsCount;
  int? favouriteCount;
  bool? isFavourite;
  int? sellsCount;

  MenuItemModel(
      {this.id,
      this.title,
      this.detail,
      this.meta,
      this.price,
      this.owner,
      this.mediaurls,
      this.createdAt,
      this.updatedAt,
      this.ratings,
      this.ratingsCount,
      this.favouriteCount,
      this.isFavourite,
      this.sellsCount});

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      detail: json['detail'] as String?,
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      price: json['price'] as int?,
      owner: json['owner'] as String?,
      mediaurls: json['mediaurls'] != null
          ? Mediaurls.fromJson(json['mediaurls'])
          : null,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      ratings: json['ratings'] as int?,
      ratingsCount: json['ratings_count'] as int?,
      favouriteCount: json['favourite_count'] as int?,
      isFavourite: json['is_favourite'] as bool?,
      sellsCount: json['sells_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['detail'] = detail;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['price'] = price;
    data['owner'] = owner;
    if (mediaurls != null) {
      data['mediaurls'] = mediaurls!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['ratings'] = ratings;
    data['ratings_count'] = ratingsCount;
    data['favourite_count'] = favouriteCount;
    data['is_favourite'] = isFavourite;
    data['sells_count'] = sellsCount;
    return data;
  }
}

class Meta {
  String? vendorType;

  Meta({this.vendorType});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      vendorType: json['vendor_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vendor_type'] = vendorType;
    return data;
  }
}

class Mediaurls {
  List<Images>? images;

  Mediaurls({this.images});

  factory Mediaurls.fromJson(Map<String, dynamic> json) {
    return Mediaurls(
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      default_: json['default'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['default'] = default_;
    return data;
  }
}
