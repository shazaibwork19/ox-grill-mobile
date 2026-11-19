// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuCategory {

 String get id; String get name; String get slug; String? get description; String? get imageUrl; int get sortOrder; bool get isActive; int get itemCount;
/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuCategoryCopyWith<MenuCategory> get copyWith => _$MenuCategoryCopyWithImpl<MenuCategory>(this as MenuCategory, _$identity);

  /// Serializes this MenuCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MenuCategory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuCategory&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MenuCategory;
  return Object.hash(runtimeType,_this.id,_this.name,_this.slug,_this.description,_this.imageUrl,_this.sortOrder,_this.isActive,_this.itemCount);
}

@override
String toString() {
  final _this = this as MenuCategory;
  return 'MenuCategory(id: ${_this.id}, name: ${_this.name}, slug: ${_this.slug}, description: ${_this.description}, imageUrl: ${_this.imageUrl}, sortOrder: ${_this.sortOrder}, isActive: ${_this.isActive}, itemCount: ${_this.itemCount})';
}


}

/// @nodoc
abstract mixin class $MenuCategoryCopyWith<$Res>  {
  factory $MenuCategoryCopyWith(MenuCategory value, $Res Function(MenuCategory) _then) = _$MenuCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? description, String? imageUrl, int sortOrder, bool isActive, int itemCount
});




}
/// @nodoc
class _$MenuCategoryCopyWithImpl<$Res>
    implements $MenuCategoryCopyWith<$Res> {
  _$MenuCategoryCopyWithImpl(this._self, this._then);

  final MenuCategory _self;
  final $Res Function(MenuCategory) _then;

/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? imageUrl = freezed,Object? sortOrder = null,Object? isActive = null,Object? itemCount = null,}) {
  return _then(MenuCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuCategory].
extension MenuCategoryPatterns on MenuCategory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuCategory value)  $default,){
final _that = this;
switch (_that) {
case _MenuCategory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuCategory value)?  $default,){
final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  String? imageUrl,  int sortOrder,  bool isActive,  int itemCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.imageUrl,_that.sortOrder,_that.isActive,_that.itemCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  String? imageUrl,  int sortOrder,  bool isActive,  int itemCount)  $default,) {final _that = this;
switch (_that) {
case _MenuCategory():
return $default(_that.id,_that.name,_that.slug,_that.description,_that.imageUrl,_that.sortOrder,_that.isActive,_that.itemCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String? description,  String? imageUrl,  int sortOrder,  bool isActive,  int itemCount)?  $default,) {final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.imageUrl,_that.sortOrder,_that.isActive,_that.itemCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuCategory implements MenuCategory {
  const _MenuCategory({required this.id, required this.name, required this.slug, this.description, this.imageUrl, this.sortOrder = 0, this.isActive = true, this.itemCount = 0});
  factory _MenuCategory.fromJson(Map<String, dynamic> json) => _$MenuCategoryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String? description;
@override final  String? imageUrl;
@override@JsonKey() final  int sortOrder;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  int itemCount;

/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuCategoryCopyWith<_MenuCategory> get copyWith => __$MenuCategoryCopyWithImpl<_MenuCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,slug,description,imageUrl,sortOrder,isActive,itemCount);
}

@override
String toString() {
    return 'MenuCategory(id: $id, name: $name, slug: $slug, description: $description, imageUrl: $imageUrl, sortOrder: $sortOrder, isActive: $isActive, itemCount: $itemCount)';
}


}

/// @nodoc
abstract mixin class _$MenuCategoryCopyWith<$Res> implements $MenuCategoryCopyWith<$Res> {
  factory _$MenuCategoryCopyWith(_MenuCategory value, $Res Function(_MenuCategory) _then) = __$MenuCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? description, String? imageUrl, int sortOrder, bool isActive, int itemCount
});




}
/// @nodoc
class __$MenuCategoryCopyWithImpl<$Res>
    implements _$MenuCategoryCopyWith<$Res> {
  __$MenuCategoryCopyWithImpl(this._self, this._then);

  final _MenuCategory _self;
  final $Res Function(_MenuCategory) _then;

/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? imageUrl = freezed,Object? sortOrder = null,Object? isActive = null,Object? itemCount = null,}) {
  return _then(_MenuCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MenuItem {

 String get id; String get slug; String get name; String get description; String? get imageUrl; String get categoryId; String get categoryName; int get basePrice; int get price; bool get isAvailable; bool get isFeatured; int get preparationMinutes; List<String> get tags; List<String> get dietary; String? get comboRole; bool get hasOptions;
/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemCopyWith<MenuItem> get copyWith => _$MenuItemCopyWithImpl<MenuItem>(this as MenuItem, _$identity);

  /// Serializes this MenuItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MenuItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.categoryName, _this.categoryName) || other.categoryName == _this.categoryName)&&(identical(other.basePrice, _this.basePrice) || other.basePrice == _this.basePrice)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.isAvailable, _this.isAvailable) || other.isAvailable == _this.isAvailable)&&(identical(other.isFeatured, _this.isFeatured) || other.isFeatured == _this.isFeatured)&&(identical(other.preparationMinutes, _this.preparationMinutes) || other.preparationMinutes == _this.preparationMinutes)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&const DeepCollectionEquality().equals(other.dietary, _this.dietary)&&(identical(other.comboRole, _this.comboRole) || other.comboRole == _this.comboRole)&&(identical(other.hasOptions, _this.hasOptions) || other.hasOptions == _this.hasOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MenuItem;
  return Object.hash(runtimeType,_this.id,_this.slug,_this.name,_this.description,_this.imageUrl,_this.categoryId,_this.categoryName,_this.basePrice,_this.price,_this.isAvailable,_this.isFeatured,_this.preparationMinutes,const DeepCollectionEquality().hash(_this.tags),const DeepCollectionEquality().hash(_this.dietary),_this.comboRole,_this.hasOptions);
}

@override
String toString() {
  final _this = this as MenuItem;
  return 'MenuItem(id: ${_this.id}, slug: ${_this.slug}, name: ${_this.name}, description: ${_this.description}, imageUrl: ${_this.imageUrl}, categoryId: ${_this.categoryId}, categoryName: ${_this.categoryName}, basePrice: ${_this.basePrice}, price: ${_this.price}, isAvailable: ${_this.isAvailable}, isFeatured: ${_this.isFeatured}, preparationMinutes: ${_this.preparationMinutes}, tags: ${_this.tags}, dietary: ${_this.dietary}, comboRole: ${_this.comboRole}, hasOptions: ${_this.hasOptions})';
}


}

/// @nodoc
abstract mixin class $MenuItemCopyWith<$Res>  {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) _then) = _$MenuItemCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, String description, String? imageUrl, String categoryId, String categoryName, int basePrice, int price, bool isAvailable, bool isFeatured, int preparationMinutes, List<String> tags, List<String> dietary, String? comboRole, bool hasOptions
});




}
/// @nodoc
class _$MenuItemCopyWithImpl<$Res>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._self, this._then);

  final MenuItem _self;
  final $Res Function(MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? description = null,Object? imageUrl = freezed,Object? categoryId = null,Object? categoryName = null,Object? basePrice = null,Object? price = null,Object? isAvailable = null,Object? isFeatured = null,Object? preparationMinutes = null,Object? tags = null,Object? dietary = null,Object? comboRole = freezed,Object? hasOptions = null,}) {
  return _then(MenuItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,preparationMinutes: null == preparationMinutes ? _self.preparationMinutes : preparationMinutes // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,dietary: null == dietary ? _self.dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<String>,comboRole: freezed == comboRole ? _self.comboRole : comboRole // ignore: cast_nullable_to_non_nullable
as String?,hasOptions: null == hasOptions ? _self.hasOptions : hasOptions // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItem].
extension MenuItemPatterns on MenuItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItem value)  $default,){
final _that = this;
switch (_that) {
case _MenuItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItem value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String description,  String? imageUrl,  String categoryId,  String categoryName,  int basePrice,  int price,  bool isAvailable,  bool isFeatured,  int preparationMinutes,  List<String> tags,  List<String> dietary,  String? comboRole,  bool hasOptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.description,_that.imageUrl,_that.categoryId,_that.categoryName,_that.basePrice,_that.price,_that.isAvailable,_that.isFeatured,_that.preparationMinutes,_that.tags,_that.dietary,_that.comboRole,_that.hasOptions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String description,  String? imageUrl,  String categoryId,  String categoryName,  int basePrice,  int price,  bool isAvailable,  bool isFeatured,  int preparationMinutes,  List<String> tags,  List<String> dietary,  String? comboRole,  bool hasOptions)  $default,) {final _that = this;
switch (_that) {
case _MenuItem():
return $default(_that.id,_that.slug,_that.name,_that.description,_that.imageUrl,_that.categoryId,_that.categoryName,_that.basePrice,_that.price,_that.isAvailable,_that.isFeatured,_that.preparationMinutes,_that.tags,_that.dietary,_that.comboRole,_that.hasOptions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  String description,  String? imageUrl,  String categoryId,  String categoryName,  int basePrice,  int price,  bool isAvailable,  bool isFeatured,  int preparationMinutes,  List<String> tags,  List<String> dietary,  String? comboRole,  bool hasOptions)?  $default,) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.description,_that.imageUrl,_that.categoryId,_that.categoryName,_that.basePrice,_that.price,_that.isAvailable,_that.isFeatured,_that.preparationMinutes,_that.tags,_that.dietary,_that.comboRole,_that.hasOptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItem extends MenuItem {
  const _MenuItem({required this.id, required this.slug, required this.name, this.description = '', this.imageUrl, required this.categoryId, this.categoryName = '', required this.basePrice, required this.price, required this.isAvailable, this.isFeatured = false, this.preparationMinutes = 0,  List<String> tags = const [],  List<String> dietary = const [], this.comboRole, this.hasOptions = false}): _tags = tags,_dietary = dietary,super._();
  factory _MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override@JsonKey() final  String description;
@override final  String? imageUrl;
@override final  String categoryId;
@override@JsonKey() final  String categoryName;
@override final  int basePrice;
@override final  int price;
@override final  bool isAvailable;
@override@JsonKey() final  bool isFeatured;
@override@JsonKey() final  int preparationMinutes;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<String> _dietary;
@override@JsonKey() List<String> get dietary {
  if (_dietary is EqualUnmodifiableListView) return _dietary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietary);
}

@override final  String? comboRole;
@override@JsonKey() final  bool hasOptions;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemCopyWith<_MenuItem> get copyWith => __$MenuItemCopyWithImpl<_MenuItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItem&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.price, price) || other.price == price)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.preparationMinutes, preparationMinutes) || other.preparationMinutes == preparationMinutes)&&const DeepCollectionEquality().equals(other.tags, _tags)&&const DeepCollectionEquality().equals(other.dietary, _dietary)&&(identical(other.comboRole, comboRole) || other.comboRole == comboRole)&&(identical(other.hasOptions, hasOptions) || other.hasOptions == hasOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,slug,name,description,imageUrl,categoryId,categoryName,basePrice,price,isAvailable,isFeatured,preparationMinutes,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_dietary),comboRole,hasOptions);
}

@override
String toString() {
    return 'MenuItem(id: $id, slug: $slug, name: $name, description: $description, imageUrl: $imageUrl, categoryId: $categoryId, categoryName: $categoryName, basePrice: $basePrice, price: $price, isAvailable: $isAvailable, isFeatured: $isFeatured, preparationMinutes: $preparationMinutes, tags: $tags, dietary: $dietary, comboRole: $comboRole, hasOptions: $hasOptions)';
}


}

/// @nodoc
abstract mixin class _$MenuItemCopyWith<$Res> implements $MenuItemCopyWith<$Res> {
  factory _$MenuItemCopyWith(_MenuItem value, $Res Function(_MenuItem) _then) = __$MenuItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, String description, String? imageUrl, String categoryId, String categoryName, int basePrice, int price, bool isAvailable, bool isFeatured, int preparationMinutes, List<String> tags, List<String> dietary, String? comboRole, bool hasOptions
});




}
/// @nodoc
class __$MenuItemCopyWithImpl<$Res>
    implements _$MenuItemCopyWith<$Res> {
  __$MenuItemCopyWithImpl(this._self, this._then);

  final _MenuItem _self;
  final $Res Function(_MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? description = null,Object? imageUrl = freezed,Object? categoryId = null,Object? categoryName = null,Object? basePrice = null,Object? price = null,Object? isAvailable = null,Object? isFeatured = null,Object? preparationMinutes = null,Object? tags = null,Object? dietary = null,Object? comboRole = freezed,Object? hasOptions = null,}) {
  return _then(_MenuItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,preparationMinutes: null == preparationMinutes ? _self.preparationMinutes : preparationMinutes // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,dietary: null == dietary ? _self._dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<String>,comboRole: freezed == comboRole ? _self.comboRole : comboRole // ignore: cast_nullable_to_non_nullable
as String?,hasOptions: null == hasOptions ? _self.hasOptions : hasOptions // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MenuOption {

 String get id; String get name; int get priceDelta; bool get isDefault; bool get isActive;
/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuOptionCopyWith<MenuOption> get copyWith => _$MenuOptionCopyWithImpl<MenuOption>(this as MenuOption, _$identity);

  /// Serializes this MenuOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MenuOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuOption&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.priceDelta, _this.priceDelta) || other.priceDelta == _this.priceDelta)&&(identical(other.isDefault, _this.isDefault) || other.isDefault == _this.isDefault)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MenuOption;
  return Object.hash(runtimeType,_this.id,_this.name,_this.priceDelta,_this.isDefault,_this.isActive);
}

@override
String toString() {
  final _this = this as MenuOption;
  return 'MenuOption(id: ${_this.id}, name: ${_this.name}, priceDelta: ${_this.priceDelta}, isDefault: ${_this.isDefault}, isActive: ${_this.isActive})';
}


}

/// @nodoc
abstract mixin class $MenuOptionCopyWith<$Res>  {
  factory $MenuOptionCopyWith(MenuOption value, $Res Function(MenuOption) _then) = _$MenuOptionCopyWithImpl;
@useResult
$Res call({
 String id, String name, int priceDelta, bool isDefault, bool isActive
});




}
/// @nodoc
class _$MenuOptionCopyWithImpl<$Res>
    implements $MenuOptionCopyWith<$Res> {
  _$MenuOptionCopyWithImpl(this._self, this._then);

  final MenuOption _self;
  final $Res Function(MenuOption) _then;

/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? priceDelta = null,Object? isDefault = null,Object? isActive = null,}) {
  return _then(MenuOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceDelta: null == priceDelta ? _self.priceDelta : priceDelta // ignore: cast_nullable_to_non_nullable
as int,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuOption].
extension MenuOptionPatterns on MenuOption {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuOption value)  $default,){
final _that = this;
switch (_that) {
case _MenuOption():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuOption value)?  $default,){
final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int priceDelta,  bool isDefault,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
return $default(_that.id,_that.name,_that.priceDelta,_that.isDefault,_that.isActive);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int priceDelta,  bool isDefault,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _MenuOption():
return $default(_that.id,_that.name,_that.priceDelta,_that.isDefault,_that.isActive);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int priceDelta,  bool isDefault,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
return $default(_that.id,_that.name,_that.priceDelta,_that.isDefault,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuOption implements MenuOption {
  const _MenuOption({required this.id, required this.name, this.priceDelta = 0, this.isDefault = false, this.isActive = true});
  factory _MenuOption.fromJson(Map<String, dynamic> json) => _$MenuOptionFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  int priceDelta;
@override@JsonKey() final  bool isDefault;
@override@JsonKey() final  bool isActive;

/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuOptionCopyWith<_MenuOption> get copyWith => __$MenuOptionCopyWithImpl<_MenuOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.priceDelta, priceDelta) || other.priceDelta == priceDelta)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,priceDelta,isDefault,isActive);
}

@override
String toString() {
    return 'MenuOption(id: $id, name: $name, priceDelta: $priceDelta, isDefault: $isDefault, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$MenuOptionCopyWith<$Res> implements $MenuOptionCopyWith<$Res> {
  factory _$MenuOptionCopyWith(_MenuOption value, $Res Function(_MenuOption) _then) = __$MenuOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int priceDelta, bool isDefault, bool isActive
});




}
/// @nodoc
class __$MenuOptionCopyWithImpl<$Res>
    implements _$MenuOptionCopyWith<$Res> {
  __$MenuOptionCopyWithImpl(this._self, this._then);

  final _MenuOption _self;
  final $Res Function(_MenuOption) _then;

/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? priceDelta = null,Object? isDefault = null,Object? isActive = null,}) {
  return _then(_MenuOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceDelta: null == priceDelta ? _self.priceDelta : priceDelta // ignore: cast_nullable_to_non_nullable
as int,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MenuOptionGroup {

 String get id; String get name; int get minSelect; int get maxSelect; List<MenuOption> get options;
/// Create a copy of MenuOptionGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuOptionGroupCopyWith<MenuOptionGroup> get copyWith => _$MenuOptionGroupCopyWithImpl<MenuOptionGroup>(this as MenuOptionGroup, _$identity);

  /// Serializes this MenuOptionGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MenuOptionGroup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuOptionGroup&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.minSelect, _this.minSelect) || other.minSelect == _this.minSelect)&&(identical(other.maxSelect, _this.maxSelect) || other.maxSelect == _this.maxSelect)&&const DeepCollectionEquality().equals(other.options, _this.options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MenuOptionGroup;
  return Object.hash(runtimeType,_this.id,_this.name,_this.minSelect,_this.maxSelect,const DeepCollectionEquality().hash(_this.options));
}

@override
String toString() {
  final _this = this as MenuOptionGroup;
  return 'MenuOptionGroup(id: ${_this.id}, name: ${_this.name}, minSelect: ${_this.minSelect}, maxSelect: ${_this.maxSelect}, options: ${_this.options})';
}


}

/// @nodoc
abstract mixin class $MenuOptionGroupCopyWith<$Res>  {
  factory $MenuOptionGroupCopyWith(MenuOptionGroup value, $Res Function(MenuOptionGroup) _then) = _$MenuOptionGroupCopyWithImpl;
@useResult
$Res call({
 String id, String name, int minSelect, int maxSelect, List<MenuOption> options
});




}
/// @nodoc
class _$MenuOptionGroupCopyWithImpl<$Res>
    implements $MenuOptionGroupCopyWith<$Res> {
  _$MenuOptionGroupCopyWithImpl(this._self, this._then);

  final MenuOptionGroup _self;
  final $Res Function(MenuOptionGroup) _then;

/// Create a copy of MenuOptionGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? minSelect = null,Object? maxSelect = null,Object? options = null,}) {
  return _then(MenuOptionGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,minSelect: null == minSelect ? _self.minSelect : minSelect // ignore: cast_nullable_to_non_nullable
as int,maxSelect: null == maxSelect ? _self.maxSelect : maxSelect // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<MenuOption>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuOptionGroup].
extension MenuOptionGroupPatterns on MenuOptionGroup {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuOptionGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuOptionGroup() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuOptionGroup value)  $default,){
final _that = this;
switch (_that) {
case _MenuOptionGroup():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuOptionGroup value)?  $default,){
final _that = this;
switch (_that) {
case _MenuOptionGroup() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int minSelect,  int maxSelect,  List<MenuOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuOptionGroup() when $default != null:
return $default(_that.id,_that.name,_that.minSelect,_that.maxSelect,_that.options);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int minSelect,  int maxSelect,  List<MenuOption> options)  $default,) {final _that = this;
switch (_that) {
case _MenuOptionGroup():
return $default(_that.id,_that.name,_that.minSelect,_that.maxSelect,_that.options);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int minSelect,  int maxSelect,  List<MenuOption> options)?  $default,) {final _that = this;
switch (_that) {
case _MenuOptionGroup() when $default != null:
return $default(_that.id,_that.name,_that.minSelect,_that.maxSelect,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuOptionGroup extends MenuOptionGroup {
  const _MenuOptionGroup({required this.id, required this.name, this.minSelect = 0, this.maxSelect = 1,  List<MenuOption> options = const []}): _options = options,super._();
  factory _MenuOptionGroup.fromJson(Map<String, dynamic> json) => _$MenuOptionGroupFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  int minSelect;
@override@JsonKey() final  int maxSelect;
 final  List<MenuOption> _options;
@override@JsonKey() List<MenuOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of MenuOptionGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuOptionGroupCopyWith<_MenuOptionGroup> get copyWith => __$MenuOptionGroupCopyWithImpl<_MenuOptionGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuOptionGroupToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuOptionGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.minSelect, minSelect) || other.minSelect == minSelect)&&(identical(other.maxSelect, maxSelect) || other.maxSelect == maxSelect)&&const DeepCollectionEquality().equals(other.options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,minSelect,maxSelect,const DeepCollectionEquality().hash(_options));
}

@override
String toString() {
    return 'MenuOptionGroup(id: $id, name: $name, minSelect: $minSelect, maxSelect: $maxSelect, options: $options)';
}


}

/// @nodoc
abstract mixin class _$MenuOptionGroupCopyWith<$Res> implements $MenuOptionGroupCopyWith<$Res> {
  factory _$MenuOptionGroupCopyWith(_MenuOptionGroup value, $Res Function(_MenuOptionGroup) _then) = __$MenuOptionGroupCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int minSelect, int maxSelect, List<MenuOption> options
});




}
/// @nodoc
class __$MenuOptionGroupCopyWithImpl<$Res>
    implements _$MenuOptionGroupCopyWith<$Res> {
  __$MenuOptionGroupCopyWithImpl(this._self, this._then);

  final _MenuOptionGroup _self;
  final $Res Function(_MenuOptionGroup) _then;

/// Create a copy of MenuOptionGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? minSelect = null,Object? maxSelect = null,Object? options = null,}) {
  return _then(_MenuOptionGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,minSelect: null == minSelect ? _self.minSelect : minSelect // ignore: cast_nullable_to_non_nullable
as int,maxSelect: null == maxSelect ? _self.maxSelect : maxSelect // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<MenuOption>,
  ));
}


}


/// @nodoc
mixin _$MenuItemDetail {

 String get id; String get slug; String get name; String get description; String? get imageUrl; String get categoryId; String get categoryName; int get basePrice; int get price; bool get isAvailable; bool get isFeatured; int get preparationMinutes; List<String> get tags; List<String> get dietary; String? get comboRole; bool get hasOptions; List<MenuOptionGroup> get optionGroups; List<MenuItem> get related;
/// Create a copy of MenuItemDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemDetailCopyWith<MenuItemDetail> get copyWith => _$MenuItemDetailCopyWithImpl<MenuItemDetail>(this as MenuItemDetail, _$identity);

  /// Serializes this MenuItemDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MenuItemDetail;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItemDetail&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.categoryName, _this.categoryName) || other.categoryName == _this.categoryName)&&(identical(other.basePrice, _this.basePrice) || other.basePrice == _this.basePrice)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.isAvailable, _this.isAvailable) || other.isAvailable == _this.isAvailable)&&(identical(other.isFeatured, _this.isFeatured) || other.isFeatured == _this.isFeatured)&&(identical(other.preparationMinutes, _this.preparationMinutes) || other.preparationMinutes == _this.preparationMinutes)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&const DeepCollectionEquality().equals(other.dietary, _this.dietary)&&(identical(other.comboRole, _this.comboRole) || other.comboRole == _this.comboRole)&&(identical(other.hasOptions, _this.hasOptions) || other.hasOptions == _this.hasOptions)&&const DeepCollectionEquality().equals(other.optionGroups, _this.optionGroups)&&const DeepCollectionEquality().equals(other.related, _this.related));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MenuItemDetail;
  return Object.hash(runtimeType,_this.id,_this.slug,_this.name,_this.description,_this.imageUrl,_this.categoryId,_this.categoryName,_this.basePrice,_this.price,_this.isAvailable,_this.isFeatured,_this.preparationMinutes,const DeepCollectionEquality().hash(_this.tags),const DeepCollectionEquality().hash(_this.dietary),_this.comboRole,_this.hasOptions,const DeepCollectionEquality().hash(_this.optionGroups),const DeepCollectionEquality().hash(_this.related));
}

@override
String toString() {
  final _this = this as MenuItemDetail;
  return 'MenuItemDetail(id: ${_this.id}, slug: ${_this.slug}, name: ${_this.name}, description: ${_this.description}, imageUrl: ${_this.imageUrl}, categoryId: ${_this.categoryId}, categoryName: ${_this.categoryName}, basePrice: ${_this.basePrice}, price: ${_this.price}, isAvailable: ${_this.isAvailable}, isFeatured: ${_this.isFeatured}, preparationMinutes: ${_this.preparationMinutes}, tags: ${_this.tags}, dietary: ${_this.dietary}, comboRole: ${_this.comboRole}, hasOptions: ${_this.hasOptions}, optionGroups: ${_this.optionGroups}, related: ${_this.related})';
}


}

/// @nodoc
abstract mixin class $MenuItemDetailCopyWith<$Res>  {
  factory $MenuItemDetailCopyWith(MenuItemDetail value, $Res Function(MenuItemDetail) _then) = _$MenuItemDetailCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, String description, String? imageUrl, String categoryId, String categoryName, int basePrice, int price, bool isAvailable, bool isFeatured, int preparationMinutes, List<String> tags, List<String> dietary, String? comboRole, bool hasOptions, List<MenuOptionGroup> optionGroups, List<MenuItem> related
});




}
/// @nodoc
class _$MenuItemDetailCopyWithImpl<$Res>
    implements $MenuItemDetailCopyWith<$Res> {
  _$MenuItemDetailCopyWithImpl(this._self, this._then);

  final MenuItemDetail _self;
  final $Res Function(MenuItemDetail) _then;

/// Create a copy of MenuItemDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? description = null,Object? imageUrl = freezed,Object? categoryId = null,Object? categoryName = null,Object? basePrice = null,Object? price = null,Object? isAvailable = null,Object? isFeatured = null,Object? preparationMinutes = null,Object? tags = null,Object? dietary = null,Object? comboRole = freezed,Object? hasOptions = null,Object? optionGroups = null,Object? related = null,}) {
  return _then(MenuItemDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,preparationMinutes: null == preparationMinutes ? _self.preparationMinutes : preparationMinutes // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,dietary: null == dietary ? _self.dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<String>,comboRole: freezed == comboRole ? _self.comboRole : comboRole // ignore: cast_nullable_to_non_nullable
as String?,hasOptions: null == hasOptions ? _self.hasOptions : hasOptions // ignore: cast_nullable_to_non_nullable
as bool,optionGroups: null == optionGroups ? _self.optionGroups : optionGroups // ignore: cast_nullable_to_non_nullable
as List<MenuOptionGroup>,related: null == related ? _self.related : related // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItemDetail].
extension MenuItemDetailPatterns on MenuItemDetail {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItemDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItemDetail() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItemDetail value)  $default,){
final _that = this;
switch (_that) {
case _MenuItemDetail():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItemDetail value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItemDetail() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String description,  String? imageUrl,  String categoryId,  String categoryName,  int basePrice,  int price,  bool isAvailable,  bool isFeatured,  int preparationMinutes,  List<String> tags,  List<String> dietary,  String? comboRole,  bool hasOptions,  List<MenuOptionGroup> optionGroups,  List<MenuItem> related)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItemDetail() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.description,_that.imageUrl,_that.categoryId,_that.categoryName,_that.basePrice,_that.price,_that.isAvailable,_that.isFeatured,_that.preparationMinutes,_that.tags,_that.dietary,_that.comboRole,_that.hasOptions,_that.optionGroups,_that.related);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String description,  String? imageUrl,  String categoryId,  String categoryName,  int basePrice,  int price,  bool isAvailable,  bool isFeatured,  int preparationMinutes,  List<String> tags,  List<String> dietary,  String? comboRole,  bool hasOptions,  List<MenuOptionGroup> optionGroups,  List<MenuItem> related)  $default,) {final _that = this;
switch (_that) {
case _MenuItemDetail():
return $default(_that.id,_that.slug,_that.name,_that.description,_that.imageUrl,_that.categoryId,_that.categoryName,_that.basePrice,_that.price,_that.isAvailable,_that.isFeatured,_that.preparationMinutes,_that.tags,_that.dietary,_that.comboRole,_that.hasOptions,_that.optionGroups,_that.related);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  String description,  String? imageUrl,  String categoryId,  String categoryName,  int basePrice,  int price,  bool isAvailable,  bool isFeatured,  int preparationMinutes,  List<String> tags,  List<String> dietary,  String? comboRole,  bool hasOptions,  List<MenuOptionGroup> optionGroups,  List<MenuItem> related)?  $default,) {final _that = this;
switch (_that) {
case _MenuItemDetail() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.description,_that.imageUrl,_that.categoryId,_that.categoryName,_that.basePrice,_that.price,_that.isAvailable,_that.isFeatured,_that.preparationMinutes,_that.tags,_that.dietary,_that.comboRole,_that.hasOptions,_that.optionGroups,_that.related);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItemDetail extends MenuItemDetail {
  const _MenuItemDetail({required this.id, required this.slug, required this.name, this.description = '', this.imageUrl, required this.categoryId, this.categoryName = '', required this.basePrice, required this.price, required this.isAvailable, this.isFeatured = false, this.preparationMinutes = 0,  List<String> tags = const [],  List<String> dietary = const [], this.comboRole, this.hasOptions = false,  List<MenuOptionGroup> optionGroups = const [],  List<MenuItem> related = const []}): _tags = tags,_dietary = dietary,_optionGroups = optionGroups,_related = related,super._();
  factory _MenuItemDetail.fromJson(Map<String, dynamic> json) => _$MenuItemDetailFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override@JsonKey() final  String description;
@override final  String? imageUrl;
@override final  String categoryId;
@override@JsonKey() final  String categoryName;
@override final  int basePrice;
@override final  int price;
@override final  bool isAvailable;
@override@JsonKey() final  bool isFeatured;
@override@JsonKey() final  int preparationMinutes;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<String> _dietary;
@override@JsonKey() List<String> get dietary {
  if (_dietary is EqualUnmodifiableListView) return _dietary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietary);
}

@override final  String? comboRole;
@override@JsonKey() final  bool hasOptions;
 final  List<MenuOptionGroup> _optionGroups;
@override@JsonKey() List<MenuOptionGroup> get optionGroups {
  if (_optionGroups is EqualUnmodifiableListView) return _optionGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optionGroups);
}

 final  List<MenuItem> _related;
@override@JsonKey() List<MenuItem> get related {
  if (_related is EqualUnmodifiableListView) return _related;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_related);
}


/// Create a copy of MenuItemDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemDetailCopyWith<_MenuItemDetail> get copyWith => __$MenuItemDetailCopyWithImpl<_MenuItemDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemDetailToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItemDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.price, price) || other.price == price)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.preparationMinutes, preparationMinutes) || other.preparationMinutes == preparationMinutes)&&const DeepCollectionEquality().equals(other.tags, _tags)&&const DeepCollectionEquality().equals(other.dietary, _dietary)&&(identical(other.comboRole, comboRole) || other.comboRole == comboRole)&&(identical(other.hasOptions, hasOptions) || other.hasOptions == hasOptions)&&const DeepCollectionEquality().equals(other.optionGroups, _optionGroups)&&const DeepCollectionEquality().equals(other.related, _related));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,slug,name,description,imageUrl,categoryId,categoryName,basePrice,price,isAvailable,isFeatured,preparationMinutes,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_dietary),comboRole,hasOptions,const DeepCollectionEquality().hash(_optionGroups),const DeepCollectionEquality().hash(_related));
}

@override
String toString() {
    return 'MenuItemDetail(id: $id, slug: $slug, name: $name, description: $description, imageUrl: $imageUrl, categoryId: $categoryId, categoryName: $categoryName, basePrice: $basePrice, price: $price, isAvailable: $isAvailable, isFeatured: $isFeatured, preparationMinutes: $preparationMinutes, tags: $tags, dietary: $dietary, comboRole: $comboRole, hasOptions: $hasOptions, optionGroups: $optionGroups, related: $related)';
}


}

/// @nodoc
abstract mixin class _$MenuItemDetailCopyWith<$Res> implements $MenuItemDetailCopyWith<$Res> {
  factory _$MenuItemDetailCopyWith(_MenuItemDetail value, $Res Function(_MenuItemDetail) _then) = __$MenuItemDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, String description, String? imageUrl, String categoryId, String categoryName, int basePrice, int price, bool isAvailable, bool isFeatured, int preparationMinutes, List<String> tags, List<String> dietary, String? comboRole, bool hasOptions, List<MenuOptionGroup> optionGroups, List<MenuItem> related
});




}
/// @nodoc
class __$MenuItemDetailCopyWithImpl<$Res>
    implements _$MenuItemDetailCopyWith<$Res> {
  __$MenuItemDetailCopyWithImpl(this._self, this._then);

  final _MenuItemDetail _self;
  final $Res Function(_MenuItemDetail) _then;

/// Create a copy of MenuItemDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? description = null,Object? imageUrl = freezed,Object? categoryId = null,Object? categoryName = null,Object? basePrice = null,Object? price = null,Object? isAvailable = null,Object? isFeatured = null,Object? preparationMinutes = null,Object? tags = null,Object? dietary = null,Object? comboRole = freezed,Object? hasOptions = null,Object? optionGroups = null,Object? related = null,}) {
  return _then(_MenuItemDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,preparationMinutes: null == preparationMinutes ? _self.preparationMinutes : preparationMinutes // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,dietary: null == dietary ? _self._dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<String>,comboRole: freezed == comboRole ? _self.comboRole : comboRole // ignore: cast_nullable_to_non_nullable
as String?,hasOptions: null == hasOptions ? _self.hasOptions : hasOptions // ignore: cast_nullable_to_non_nullable
as bool,optionGroups: null == optionGroups ? _self._optionGroups : optionGroups // ignore: cast_nullable_to_non_nullable
as List<MenuOptionGroup>,related: null == related ? _self._related : related // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}


}


/// @nodoc
mixin _$MenuResponse {

 String? get branchId; List<MenuCategory> get categories; List<MenuItem> get items;
/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuResponseCopyWith<MenuResponse> get copyWith => _$MenuResponseCopyWithImpl<MenuResponse>(this as MenuResponse, _$identity);

  /// Serializes this MenuResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MenuResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuResponse&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&const DeepCollectionEquality().equals(other.categories, _this.categories)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MenuResponse;
  return Object.hash(runtimeType,_this.branchId,const DeepCollectionEquality().hash(_this.categories),const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as MenuResponse;
  return 'MenuResponse(branchId: ${_this.branchId}, categories: ${_this.categories}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $MenuResponseCopyWith<$Res>  {
  factory $MenuResponseCopyWith(MenuResponse value, $Res Function(MenuResponse) _then) = _$MenuResponseCopyWithImpl;
@useResult
$Res call({
 String? branchId, List<MenuCategory> categories, List<MenuItem> items
});




}
/// @nodoc
class _$MenuResponseCopyWithImpl<$Res>
    implements $MenuResponseCopyWith<$Res> {
  _$MenuResponseCopyWithImpl(this._self, this._then);

  final MenuResponse _self;
  final $Res Function(MenuResponse) _then;

/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branchId = freezed,Object? categories = null,Object? items = null,}) {
  return _then(MenuResponse(
branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<MenuCategory>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuResponse].
extension MenuResponsePatterns on MenuResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuResponse value)  $default,){
final _that = this;
switch (_that) {
case _MenuResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? branchId,  List<MenuCategory> categories,  List<MenuItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
return $default(_that.branchId,_that.categories,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? branchId,  List<MenuCategory> categories,  List<MenuItem> items)  $default,) {final _that = this;
switch (_that) {
case _MenuResponse():
return $default(_that.branchId,_that.categories,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? branchId,  List<MenuCategory> categories,  List<MenuItem> items)?  $default,) {final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
return $default(_that.branchId,_that.categories,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuResponse implements MenuResponse {
  const _MenuResponse({this.branchId,  List<MenuCategory> categories = const [],  List<MenuItem> items = const []}): _categories = categories,_items = items;
  factory _MenuResponse.fromJson(Map<String, dynamic> json) => _$MenuResponseFromJson(json);

@override final  String? branchId;
 final  List<MenuCategory> _categories;
@override@JsonKey() List<MenuCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<MenuItem> _items;
@override@JsonKey() List<MenuItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuResponseCopyWith<_MenuResponse> get copyWith => __$MenuResponseCopyWithImpl<_MenuResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuResponse&&(identical(other.branchId, branchId) || other.branchId == branchId)&&const DeepCollectionEquality().equals(other.categories, _categories)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,branchId,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'MenuResponse(branchId: $branchId, categories: $categories, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MenuResponseCopyWith<$Res> implements $MenuResponseCopyWith<$Res> {
  factory _$MenuResponseCopyWith(_MenuResponse value, $Res Function(_MenuResponse) _then) = __$MenuResponseCopyWithImpl;
@override @useResult
$Res call({
 String? branchId, List<MenuCategory> categories, List<MenuItem> items
});




}
/// @nodoc
class __$MenuResponseCopyWithImpl<$Res>
    implements _$MenuResponseCopyWith<$Res> {
  __$MenuResponseCopyWithImpl(this._self, this._then);

  final _MenuResponse _self;
  final $Res Function(_MenuResponse) _then;

/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branchId = freezed,Object? categories = null,Object? items = null,}) {
  return _then(_MenuResponse(
branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<MenuCategory>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}


}

// dart format on
