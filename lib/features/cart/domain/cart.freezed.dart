// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartOption {

 String get id; String get groupId; String get groupName; String get name; int get priceDelta;
/// Create a copy of CartOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartOptionCopyWith<CartOption> get copyWith => _$CartOptionCopyWithImpl<CartOption>(this as CartOption, _$identity);

  /// Serializes this CartOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CartOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartOption&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.groupId, _this.groupId) || other.groupId == _this.groupId)&&(identical(other.groupName, _this.groupName) || other.groupName == _this.groupName)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.priceDelta, _this.priceDelta) || other.priceDelta == _this.priceDelta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CartOption;
  return Object.hash(runtimeType,_this.id,_this.groupId,_this.groupName,_this.name,_this.priceDelta);
}

@override
String toString() {
  final _this = this as CartOption;
  return 'CartOption(id: ${_this.id}, groupId: ${_this.groupId}, groupName: ${_this.groupName}, name: ${_this.name}, priceDelta: ${_this.priceDelta})';
}


}

/// @nodoc
abstract mixin class $CartOptionCopyWith<$Res>  {
  factory $CartOptionCopyWith(CartOption value, $Res Function(CartOption) _then) = _$CartOptionCopyWithImpl;
@useResult
$Res call({
 String id, String groupId, String groupName, String name, int priceDelta
});




}
/// @nodoc
class _$CartOptionCopyWithImpl<$Res>
    implements $CartOptionCopyWith<$Res> {
  _$CartOptionCopyWithImpl(this._self, this._then);

  final CartOption _self;
  final $Res Function(CartOption) _then;

/// Create a copy of CartOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? groupId = null,Object? groupName = null,Object? name = null,Object? priceDelta = null,}) {
  return _then(CartOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceDelta: null == priceDelta ? _self.priceDelta : priceDelta // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CartOption].
extension CartOptionPatterns on CartOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartOption value)  $default,){
final _that = this;
switch (_that) {
case _CartOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartOption value)?  $default,){
final _that = this;
switch (_that) {
case _CartOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String groupId,  String groupName,  String name,  int priceDelta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartOption() when $default != null:
return $default(_that.id,_that.groupId,_that.groupName,_that.name,_that.priceDelta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String groupId,  String groupName,  String name,  int priceDelta)  $default,) {final _that = this;
switch (_that) {
case _CartOption():
return $default(_that.id,_that.groupId,_that.groupName,_that.name,_that.priceDelta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String groupId,  String groupName,  String name,  int priceDelta)?  $default,) {final _that = this;
switch (_that) {
case _CartOption() when $default != null:
return $default(_that.id,_that.groupId,_that.groupName,_that.name,_that.priceDelta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartOption implements CartOption {
  const _CartOption({required this.id, required this.groupId, required this.groupName, required this.name, this.priceDelta = 0});
  factory _CartOption.fromJson(Map<String, dynamic> json) => _$CartOptionFromJson(json);

@override final  String id;
@override final  String groupId;
@override final  String groupName;
@override final  String name;
@override@JsonKey() final  int priceDelta;

/// Create a copy of CartOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartOptionCopyWith<_CartOption> get copyWith => __$CartOptionCopyWithImpl<_CartOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartOption&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.name, name) || other.name == name)&&(identical(other.priceDelta, priceDelta) || other.priceDelta == priceDelta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,groupId,groupName,name,priceDelta);
}

@override
String toString() {
    return 'CartOption(id: $id, groupId: $groupId, groupName: $groupName, name: $name, priceDelta: $priceDelta)';
}


}

/// @nodoc
abstract mixin class _$CartOptionCopyWith<$Res> implements $CartOptionCopyWith<$Res> {
  factory _$CartOptionCopyWith(_CartOption value, $Res Function(_CartOption) _then) = __$CartOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String groupId, String groupName, String name, int priceDelta
});




}
/// @nodoc
class __$CartOptionCopyWithImpl<$Res>
    implements _$CartOptionCopyWith<$Res> {
  __$CartOptionCopyWithImpl(this._self, this._then);

  final _CartOption _self;
  final $Res Function(_CartOption) _then;

/// Create a copy of CartOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? groupId = null,Object? groupName = null,Object? name = null,Object? priceDelta = null,}) {
  return _then(_CartOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceDelta: null == priceDelta ? _self.priceDelta : priceDelta // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CartLine {

/// Local id, stable across edits. Not sent to the server.
 String get lineId; String get menuItemId; String get name; String? get imageUrl;/// Menu price when added (paisa). Display estimate only.
 int get unitPrice; int get quantity; List<CartOption> get options; String? get notes;
/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartLineCopyWith<CartLine> get copyWith => _$CartLineCopyWithImpl<CartLine>(this as CartLine, _$identity);

  /// Serializes this CartLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CartLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLine&&(identical(other.lineId, _this.lineId) || other.lineId == _this.lineId)&&(identical(other.menuItemId, _this.menuItemId) || other.menuItemId == _this.menuItemId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&const DeepCollectionEquality().equals(other.options, _this.options)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CartLine;
  return Object.hash(runtimeType,_this.lineId,_this.menuItemId,_this.name,_this.imageUrl,_this.unitPrice,_this.quantity,const DeepCollectionEquality().hash(_this.options),_this.notes);
}

@override
String toString() {
  final _this = this as CartLine;
  return 'CartLine(lineId: ${_this.lineId}, menuItemId: ${_this.menuItemId}, name: ${_this.name}, imageUrl: ${_this.imageUrl}, unitPrice: ${_this.unitPrice}, quantity: ${_this.quantity}, options: ${_this.options}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $CartLineCopyWith<$Res>  {
  factory $CartLineCopyWith(CartLine value, $Res Function(CartLine) _then) = _$CartLineCopyWithImpl;
@useResult
$Res call({
 String lineId, String menuItemId, String name, String? imageUrl, int unitPrice, int quantity, List<CartOption> options, String? notes
});




}
/// @nodoc
class _$CartLineCopyWithImpl<$Res>
    implements $CartLineCopyWith<$Res> {
  _$CartLineCopyWithImpl(this._self, this._then);

  final CartLine _self;
  final $Res Function(CartLine) _then;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lineId = null,Object? menuItemId = null,Object? name = null,Object? imageUrl = freezed,Object? unitPrice = null,Object? quantity = null,Object? options = null,Object? notes = freezed,}) {
  return _then(CartLine(
lineId: null == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String,menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<CartOption>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartLine].
extension CartLinePatterns on CartLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartLine value)  $default,){
final _that = this;
switch (_that) {
case _CartLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartLine value)?  $default,){
final _that = this;
switch (_that) {
case _CartLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lineId,  String menuItemId,  String name,  String? imageUrl,  int unitPrice,  int quantity,  List<CartOption> options,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartLine() when $default != null:
return $default(_that.lineId,_that.menuItemId,_that.name,_that.imageUrl,_that.unitPrice,_that.quantity,_that.options,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lineId,  String menuItemId,  String name,  String? imageUrl,  int unitPrice,  int quantity,  List<CartOption> options,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CartLine():
return $default(_that.lineId,_that.menuItemId,_that.name,_that.imageUrl,_that.unitPrice,_that.quantity,_that.options,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lineId,  String menuItemId,  String name,  String? imageUrl,  int unitPrice,  int quantity,  List<CartOption> options,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CartLine() when $default != null:
return $default(_that.lineId,_that.menuItemId,_that.name,_that.imageUrl,_that.unitPrice,_that.quantity,_that.options,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartLine extends CartLine {
  const _CartLine({required this.lineId, required this.menuItemId, required this.name, this.imageUrl, required this.unitPrice, required this.quantity,  List<CartOption> options = const [], this.notes}): _options = options,super._();
  factory _CartLine.fromJson(Map<String, dynamic> json) => _$CartLineFromJson(json);

/// Local id, stable across edits. Not sent to the server.
@override final  String lineId;
@override final  String menuItemId;
@override final  String name;
@override final  String? imageUrl;
/// Menu price when added (paisa). Display estimate only.
@override final  int unitPrice;
@override final  int quantity;
 final  List<CartOption> _options;
@override@JsonKey() List<CartOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  String? notes;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartLineCopyWith<_CartLine> get copyWith => __$CartLineCopyWithImpl<_CartLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartLine&&(identical(other.lineId, lineId) || other.lineId == lineId)&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,lineId,menuItemId,name,imageUrl,unitPrice,quantity,const DeepCollectionEquality().hash(_options),notes);
}

@override
String toString() {
    return 'CartLine(lineId: $lineId, menuItemId: $menuItemId, name: $name, imageUrl: $imageUrl, unitPrice: $unitPrice, quantity: $quantity, options: $options, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CartLineCopyWith<$Res> implements $CartLineCopyWith<$Res> {
  factory _$CartLineCopyWith(_CartLine value, $Res Function(_CartLine) _then) = __$CartLineCopyWithImpl;
@override @useResult
$Res call({
 String lineId, String menuItemId, String name, String? imageUrl, int unitPrice, int quantity, List<CartOption> options, String? notes
});




}
/// @nodoc
class __$CartLineCopyWithImpl<$Res>
    implements _$CartLineCopyWith<$Res> {
  __$CartLineCopyWithImpl(this._self, this._then);

  final _CartLine _self;
  final $Res Function(_CartLine) _then;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lineId = null,Object? menuItemId = null,Object? name = null,Object? imageUrl = freezed,Object? unitPrice = null,Object? quantity = null,Object? options = null,Object? notes = freezed,}) {
  return _then(_CartLine(
lineId: null == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String,menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<CartOption>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
