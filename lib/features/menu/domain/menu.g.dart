// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) => _MenuCategory(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  description: json['description'] as String?,
  imageUrl: json['imageUrl'] as String?,
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  isActive: json['isActive'] as bool? ?? true,
  itemCount: (json['itemCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MenuCategoryToJson(_MenuCategory instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'description': ?instance.description,
  'imageUrl': ?instance.imageUrl,
  'sortOrder': instance.sortOrder,
  'isActive': instance.isActive,
  'itemCount': instance.itemCount,
};

_MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => _MenuItem(
  id: json['id'] as String,
  slug: json['slug'] as String,
  name: json['name'] as String,
  description: json['description'] as String? ?? '',
  imageUrl: json['imageUrl'] as String?,
  categoryId: json['categoryId'] as String,
  categoryName: json['categoryName'] as String? ?? '',
  basePrice: (json['basePrice'] as num).toInt(),
  price: (json['price'] as num).toInt(),
  isAvailable: json['isAvailable'] as bool,
  isFeatured: json['isFeatured'] as bool? ?? false,
  preparationMinutes: (json['preparationMinutes'] as num?)?.toInt() ?? 0,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  dietary: (json['dietary'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  comboRole: json['comboRole'] as String?,
  hasOptions: json['hasOptions'] as bool? ?? false,
);

Map<String, dynamic> _$MenuItemToJson(_MenuItem instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'description': instance.description,
  'imageUrl': ?instance.imageUrl,
  'categoryId': instance.categoryId,
  'categoryName': instance.categoryName,
  'basePrice': instance.basePrice,
  'price': instance.price,
  'isAvailable': instance.isAvailable,
  'isFeatured': instance.isFeatured,
  'preparationMinutes': instance.preparationMinutes,
  'tags': instance.tags,
  'dietary': instance.dietary,
  'comboRole': ?instance.comboRole,
  'hasOptions': instance.hasOptions,
};

_MenuOption _$MenuOptionFromJson(Map<String, dynamic> json) => _MenuOption(
  id: json['id'] as String,
  name: json['name'] as String,
  priceDelta: (json['priceDelta'] as num?)?.toInt() ?? 0,
  isDefault: json['isDefault'] as bool? ?? false,
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$MenuOptionToJson(_MenuOption instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'priceDelta': instance.priceDelta,
  'isDefault': instance.isDefault,
  'isActive': instance.isActive,
};

_MenuOptionGroup _$MenuOptionGroupFromJson(Map<String, dynamic> json) => _MenuOptionGroup(
  id: json['id'] as String,
  name: json['name'] as String,
  minSelect: (json['minSelect'] as num?)?.toInt() ?? 0,
  maxSelect: (json['maxSelect'] as num?)?.toInt() ?? 1,
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => MenuOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MenuOptionGroupToJson(_MenuOptionGroup instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'minSelect': instance.minSelect,
  'maxSelect': instance.maxSelect,
  'options': instance.options.map((e) => e.toJson()).toList(),
};

_MenuItemDetail _$MenuItemDetailFromJson(Map<String, dynamic> json) => _MenuItemDetail(
  id: json['id'] as String,
  slug: json['slug'] as String,
  name: json['name'] as String,
  description: json['description'] as String? ?? '',
  imageUrl: json['imageUrl'] as String?,
  categoryId: json['categoryId'] as String,
  categoryName: json['categoryName'] as String? ?? '',
  basePrice: (json['basePrice'] as num).toInt(),
  price: (json['price'] as num).toInt(),
  isAvailable: json['isAvailable'] as bool,
  isFeatured: json['isFeatured'] as bool? ?? false,
  preparationMinutes: (json['preparationMinutes'] as num?)?.toInt() ?? 0,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  dietary: (json['dietary'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  comboRole: json['comboRole'] as String?,
  hasOptions: json['hasOptions'] as bool? ?? false,
  optionGroups:
      (json['optionGroups'] as List<dynamic>?)
          ?.map((e) => MenuOptionGroup.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  related:
      (json['related'] as List<dynamic>?)
          ?.map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MenuItemDetailToJson(_MenuItemDetail instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'description': instance.description,
  'imageUrl': ?instance.imageUrl,
  'categoryId': instance.categoryId,
  'categoryName': instance.categoryName,
  'basePrice': instance.basePrice,
  'price': instance.price,
  'isAvailable': instance.isAvailable,
  'isFeatured': instance.isFeatured,
  'preparationMinutes': instance.preparationMinutes,
  'tags': instance.tags,
  'dietary': instance.dietary,
  'comboRole': ?instance.comboRole,
  'hasOptions': instance.hasOptions,
  'optionGroups': instance.optionGroups.map((e) => e.toJson()).toList(),
  'related': instance.related.map((e) => e.toJson()).toList(),
};

_MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) => _MenuResponse(
  branchId: json['branchId'] as String?,
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => MenuCategory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  items:
      (json['items'] as List<dynamic>?)?.map((e) => MenuItem.fromJson(e as Map<String, dynamic>)).toList() ??
      const [],
);

Map<String, dynamic> _$MenuResponseToJson(_MenuResponse instance) => <String, dynamic>{
  'branchId': ?instance.branchId,
  'categories': instance.categories.map((e) => e.toJson()).toList(),
  'items': instance.items.map((e) => e.toJson()).toList(),
};
