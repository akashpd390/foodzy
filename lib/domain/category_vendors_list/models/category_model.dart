class CategoryModel {
  int? id;
  String? slug;
  String? title;
  TitleTranslations? titleTranslations;
  Meta? meta;
  int? sortOrder;
  Mediaurls? mediaurls;
  int? parentId;

  CategoryModel(
      {this.id,
      this.slug,
      this.title,
      this.titleTranslations,
      this.meta,
      this.sortOrder,
      this.mediaurls,
      this.parentId});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      slug: json['slug'],
      title: json['title'],
      titleTranslations: json['title_translations'] != null
          ? TitleTranslations.fromJson(json['title_translations'])
          : null,
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      sortOrder: json['sort_order'],
      mediaurls: json['mediaurls'] != null
          ? Mediaurls.fromJson(json['mediaurls'])
          : null,
      parentId: json['parent_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['title'] = title;
    if (titleTranslations != null) {
      data['title_translations'] = titleTranslations!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['sort_order'] = sortOrder;
    if (mediaurls != null) {
      data['mediaurls'] = mediaurls!.toJson();
    }
    data['parent_id'] = parentId;
    return data;
  }
}

class TitleTranslations {
  String? en;

  TitleTranslations({this.en});

  factory TitleTranslations.fromJson(Map<String, dynamic> json) {
    return TitleTranslations(
      en: json['en'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    return data;
  }
}

class Mediaurls {
  List<Images>? images;

  Mediaurls({this.images});

  factory Mediaurls.fromJson(Map<String, dynamic> json) {
    return Mediaurls(
      images: json['images'] != null
          ? (json['images'] as List).map((i) => Images.fromJson(i)).toList()
          : null,
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
  final String? default_;
  final String? thumb;

  Images({this.default_, this.thumb});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      default_: json['default'],
      thumb: json['thumb'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['default'] = default_;
    data['thumb'] = thumb;
    return data;
  }
}

/// meta data for the category
/// This class contains additional information about the category, such as scope and vendor type.

class Meta {
  String? scope;
  String? vendorType;

  Meta({this.scope, this.vendorType});

  Meta.fromJson(Map<String, dynamic> json) {
    scope = json['scope'];
    vendorType = json['vendor_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scope'] = scope;
    data['vendor_type'] = vendorType;
    return data;
  }
}
