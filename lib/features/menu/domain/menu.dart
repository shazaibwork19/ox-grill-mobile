import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/money/money.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
abstract class MenuCategory with _$MenuCategory {
  const factory MenuCategory({
    required String id,
    required String name,
    required String slug,
    String? description,
    String? imageUrl,
    @Default(0) int sortOrder,
    @Default(true) bool isActive,
    @Default(0) int itemCount,
  }) = _MenuCategory;

  factory MenuCategory.fromJson(Map<String, dynamic> json) => _$MenuCategoryFromJson(json);
}

/// `MenuItem`. [price] is the branch's effective price in paisa.
@freezed
abstract class MenuItem with _$MenuItem {
  const factory MenuItem({
    required String id,
    required String slug,
    required String name,
    @Default('') String description,
    String? imageUrl,
    required String categoryId,
    @Default('') String categoryName,
    required int basePrice,
    required int price,
    required bool isAvailable,
    @Default(false) bool isFeatured,
    @Default(0) int preparationMinutes,
    @Default([]) List<String> tags,
    @Default([]) List<String> dietary,
    String? comboRole,
    @Default(false) bool hasOptions,
  }) = _MenuItem;

  const MenuItem._();

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

  Money get priceMoney => Money(price);

  /// The API sends one image today; the gallery takes a list so a future
  /// image collection can be added without changing screens.
  List<String> get images => [if (imageUrl != null && imageUrl!.isNotEmpty) imageUrl!];
}

@freezed
abstract class MenuOption with _$MenuOption {
  const factory MenuOption({
    required String id,
    required String name,
    @Default(0) int priceDelta,
    @Default(false) bool isDefault,
    @Default(true) bool isActive,
  }) = _MenuOption;

  factory MenuOption.fromJson(Map<String, dynamic> json) => _$MenuOptionFromJson(json);
}

@freezed
abstract class MenuOptionGroup with _$MenuOptionGroup {
  const factory MenuOptionGroup({
    required String id,
    required String name,
    @Default(0) int minSelect,
    @Default(1) int maxSelect,
    @Default([]) List<MenuOption> options,
  }) = _MenuOptionGroup;

  const MenuOptionGroup._();

  factory MenuOptionGroup.fromJson(Map<String, dynamic> json) => _$MenuOptionGroupFromJson(json);

  bool get isRequired => minSelect > 0;
  bool get isSingleChoice => maxSelect == 1;
  List<MenuOption> get activeOptions => options.where((o) => o.isActive).toList();

  /// "Choose 1", "Choose up to 3", "Choose 2–4", "Optional".
  String get ruleLabel {
    if (minSelect > 0 && minSelect == maxSelect) return 'Choose $minSelect';
    if (minSelect > 0) return 'Choose $minSelect–$maxSelect';
    if (maxSelect == 1) return 'Optional · choose up to 1';
    return 'Optional · choose up to $maxSelect';
  }
}

/// `GET /menu/items/{id}` (`MenuItemDetail`).
@freezed
abstract class MenuItemDetail with _$MenuItemDetail {
  const factory MenuItemDetail({
    required String id,
    required String slug,
    required String name,
    @Default('') String description,
    String? imageUrl,
    required String categoryId,
    @Default('') String categoryName,
    required int basePrice,
    required int price,
    required bool isAvailable,
    @Default(false) bool isFeatured,
    @Default(0) int preparationMinutes,
    @Default([]) List<String> tags,
    @Default([]) List<String> dietary,
    String? comboRole,
    @Default(false) bool hasOptions,
    @Default([]) List<MenuOptionGroup> optionGroups,
    @Default([]) List<MenuItem> related,
  }) = _MenuItemDetail;

  const MenuItemDetail._();

  factory MenuItemDetail.fromJson(Map<String, dynamic> json) => _$MenuItemDetailFromJson(json);

  Money get priceMoney => Money(price);

  List<String> get images => [if (imageUrl != null && imageUrl!.isNotEmpty) imageUrl!];

  /// Required groups first, then optional, keeping server order inside each.
  List<MenuOptionGroup> get orderedGroups => [
    ...optionGroups.where((g) => g.isRequired && g.activeOptions.isNotEmpty),
    ...optionGroups.where((g) => !g.isRequired && g.activeOptions.isNotEmpty),
  ];
}

/// `GET /menu?branchId=` (`MenuResponse`).
@freezed
abstract class MenuResponse with _$MenuResponse {
  const factory MenuResponse({
    String? branchId,
    @Default([]) List<MenuCategory> categories,
    @Default([]) List<MenuItem> items,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) => _$MenuResponseFromJson(json);
}
