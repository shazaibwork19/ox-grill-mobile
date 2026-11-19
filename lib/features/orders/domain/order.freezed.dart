// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItem {

 String get id; String? get menuItemId; String get name; int get quantity; int get unitPrice; int get optionsTotal; int get lineTotal; String? get notes; List<PricedOption> get options;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.menuItemId, _this.menuItemId) || other.menuItemId == _this.menuItemId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.optionsTotal, _this.optionsTotal) || other.optionsTotal == _this.optionsTotal)&&(identical(other.lineTotal, _this.lineTotal) || other.lineTotal == _this.lineTotal)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.options, _this.options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderItem;
  return Object.hash(runtimeType,_this.id,_this.menuItemId,_this.name,_this.quantity,_this.unitPrice,_this.optionsTotal,_this.lineTotal,_this.notes,const DeepCollectionEquality().hash(_this.options));
}

@override
String toString() {
  final _this = this as OrderItem;
  return 'OrderItem(id: ${_this.id}, menuItemId: ${_this.menuItemId}, name: ${_this.name}, quantity: ${_this.quantity}, unitPrice: ${_this.unitPrice}, optionsTotal: ${_this.optionsTotal}, lineTotal: ${_this.lineTotal}, notes: ${_this.notes}, options: ${_this.options})';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 String id, String? menuItemId, String name, int quantity, int unitPrice, int optionsTotal, int lineTotal, String? notes, List<PricedOption> options
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? menuItemId = freezed,Object? name = null,Object? quantity = null,Object? unitPrice = null,Object? optionsTotal = null,Object? lineTotal = null,Object? notes = freezed,Object? options = null,}) {
  return _then(OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,menuItemId: freezed == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,optionsTotal: null == optionsTotal ? _self.optionsTotal : optionsTotal // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<PricedOption>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? menuItemId,  String name,  int quantity,  int unitPrice,  int optionsTotal,  int lineTotal,  String? notes,  List<PricedOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.menuItemId,_that.name,_that.quantity,_that.unitPrice,_that.optionsTotal,_that.lineTotal,_that.notes,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? menuItemId,  String name,  int quantity,  int unitPrice,  int optionsTotal,  int lineTotal,  String? notes,  List<PricedOption> options)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.id,_that.menuItemId,_that.name,_that.quantity,_that.unitPrice,_that.optionsTotal,_that.lineTotal,_that.notes,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? menuItemId,  String name,  int quantity,  int unitPrice,  int optionsTotal,  int lineTotal,  String? notes,  List<PricedOption> options)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.menuItemId,_that.name,_that.quantity,_that.unitPrice,_that.optionsTotal,_that.lineTotal,_that.notes,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItem implements OrderItem {
  const _OrderItem({required this.id, this.menuItemId, required this.name, required this.quantity, required this.unitPrice, this.optionsTotal = 0, required this.lineTotal, this.notes,  List<PricedOption> options = const []}): _options = options;
  factory _OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

@override final  String id;
@override final  String? menuItemId;
@override final  String name;
@override final  int quantity;
@override final  int unitPrice;
@override@JsonKey() final  int optionsTotal;
@override final  int lineTotal;
@override final  String? notes;
 final  List<PricedOption> _options;
@override@JsonKey() List<PricedOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.optionsTotal, optionsTotal) || other.optionsTotal == optionsTotal)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,menuItemId,name,quantity,unitPrice,optionsTotal,lineTotal,notes,const DeepCollectionEquality().hash(_options));
}

@override
String toString() {
    return 'OrderItem(id: $id, menuItemId: $menuItemId, name: $name, quantity: $quantity, unitPrice: $unitPrice, optionsTotal: $optionsTotal, lineTotal: $lineTotal, notes: $notes, options: $options)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String? menuItemId, String name, int quantity, int unitPrice, int optionsTotal, int lineTotal, String? notes, List<PricedOption> options
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? menuItemId = freezed,Object? name = null,Object? quantity = null,Object? unitPrice = null,Object? optionsTotal = null,Object? lineTotal = null,Object? notes = freezed,Object? options = null,}) {
  return _then(_OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,menuItemId: freezed == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,optionsTotal: null == optionsTotal ? _self.optionsTotal : optionsTotal // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<PricedOption>,
  ));
}


}


/// @nodoc
mixin _$DeliveryInfo {

 String? get addressLine; String? get area; String? get city; double? get latitude; double? get longitude; String? get instructions;
/// Create a copy of DeliveryInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryInfoCopyWith<DeliveryInfo> get copyWith => _$DeliveryInfoCopyWithImpl<DeliveryInfo>(this as DeliveryInfo, _$identity);

  /// Serializes this DeliveryInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DeliveryInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryInfo&&(identical(other.addressLine, _this.addressLine) || other.addressLine == _this.addressLine)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.instructions, _this.instructions) || other.instructions == _this.instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DeliveryInfo;
  return Object.hash(runtimeType,_this.addressLine,_this.area,_this.city,_this.latitude,_this.longitude,_this.instructions);
}

@override
String toString() {
  final _this = this as DeliveryInfo;
  return 'DeliveryInfo(addressLine: ${_this.addressLine}, area: ${_this.area}, city: ${_this.city}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, instructions: ${_this.instructions})';
}


}

/// @nodoc
abstract mixin class $DeliveryInfoCopyWith<$Res>  {
  factory $DeliveryInfoCopyWith(DeliveryInfo value, $Res Function(DeliveryInfo) _then) = _$DeliveryInfoCopyWithImpl;
@useResult
$Res call({
 String? addressLine, String? area, String? city, double? latitude, double? longitude, String? instructions
});




}
/// @nodoc
class _$DeliveryInfoCopyWithImpl<$Res>
    implements $DeliveryInfoCopyWith<$Res> {
  _$DeliveryInfoCopyWithImpl(this._self, this._then);

  final DeliveryInfo _self;
  final $Res Function(DeliveryInfo) _then;

/// Create a copy of DeliveryInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addressLine = freezed,Object? area = freezed,Object? city = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? instructions = freezed,}) {
  return _then(DeliveryInfo(
addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryInfo].
extension DeliveryInfoPatterns on DeliveryInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryInfo value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryInfo value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? addressLine,  String? area,  String? city,  double? latitude,  double? longitude,  String? instructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryInfo() when $default != null:
return $default(_that.addressLine,_that.area,_that.city,_that.latitude,_that.longitude,_that.instructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? addressLine,  String? area,  String? city,  double? latitude,  double? longitude,  String? instructions)  $default,) {final _that = this;
switch (_that) {
case _DeliveryInfo():
return $default(_that.addressLine,_that.area,_that.city,_that.latitude,_that.longitude,_that.instructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? addressLine,  String? area,  String? city,  double? latitude,  double? longitude,  String? instructions)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryInfo() when $default != null:
return $default(_that.addressLine,_that.area,_that.city,_that.latitude,_that.longitude,_that.instructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryInfo implements DeliveryInfo {
  const _DeliveryInfo({this.addressLine, this.area, this.city, this.latitude, this.longitude, this.instructions});
  factory _DeliveryInfo.fromJson(Map<String, dynamic> json) => _$DeliveryInfoFromJson(json);

@override final  String? addressLine;
@override final  String? area;
@override final  String? city;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? instructions;

/// Create a copy of DeliveryInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryInfoCopyWith<_DeliveryInfo> get copyWith => __$DeliveryInfoCopyWithImpl<_DeliveryInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryInfoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryInfo&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.area, area) || other.area == area)&&(identical(other.city, city) || other.city == city)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,addressLine,area,city,latitude,longitude,instructions);
}

@override
String toString() {
    return 'DeliveryInfo(addressLine: $addressLine, area: $area, city: $city, latitude: $latitude, longitude: $longitude, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class _$DeliveryInfoCopyWith<$Res> implements $DeliveryInfoCopyWith<$Res> {
  factory _$DeliveryInfoCopyWith(_DeliveryInfo value, $Res Function(_DeliveryInfo) _then) = __$DeliveryInfoCopyWithImpl;
@override @useResult
$Res call({
 String? addressLine, String? area, String? city, double? latitude, double? longitude, String? instructions
});




}
/// @nodoc
class __$DeliveryInfoCopyWithImpl<$Res>
    implements _$DeliveryInfoCopyWith<$Res> {
  __$DeliveryInfoCopyWithImpl(this._self, this._then);

  final _DeliveryInfo _self;
  final $Res Function(_DeliveryInfo) _then;

/// Create a copy of DeliveryInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addressLine = freezed,Object? area = freezed,Object? city = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? instructions = freezed,}) {
  return _then(_DeliveryInfo(
addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderAssignment {

 String get id; String get status; String get riderId; String? get riderName; String? get riderPhone; DateTime get assignedAt;
/// Create a copy of OrderAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderAssignmentCopyWith<OrderAssignment> get copyWith => _$OrderAssignmentCopyWithImpl<OrderAssignment>(this as OrderAssignment, _$identity);

  /// Serializes this OrderAssignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderAssignment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderAssignment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.riderId, _this.riderId) || other.riderId == _this.riderId)&&(identical(other.riderName, _this.riderName) || other.riderName == _this.riderName)&&(identical(other.riderPhone, _this.riderPhone) || other.riderPhone == _this.riderPhone)&&(identical(other.assignedAt, _this.assignedAt) || other.assignedAt == _this.assignedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderAssignment;
  return Object.hash(runtimeType,_this.id,_this.status,_this.riderId,_this.riderName,_this.riderPhone,_this.assignedAt);
}

@override
String toString() {
  final _this = this as OrderAssignment;
  return 'OrderAssignment(id: ${_this.id}, status: ${_this.status}, riderId: ${_this.riderId}, riderName: ${_this.riderName}, riderPhone: ${_this.riderPhone}, assignedAt: ${_this.assignedAt})';
}


}

/// @nodoc
abstract mixin class $OrderAssignmentCopyWith<$Res>  {
  factory $OrderAssignmentCopyWith(OrderAssignment value, $Res Function(OrderAssignment) _then) = _$OrderAssignmentCopyWithImpl;
@useResult
$Res call({
 String id, String status, String riderId, String? riderName, String? riderPhone, DateTime assignedAt
});




}
/// @nodoc
class _$OrderAssignmentCopyWithImpl<$Res>
    implements $OrderAssignmentCopyWith<$Res> {
  _$OrderAssignmentCopyWithImpl(this._self, this._then);

  final OrderAssignment _self;
  final $Res Function(OrderAssignment) _then;

/// Create a copy of OrderAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? riderId = null,Object? riderName = freezed,Object? riderPhone = freezed,Object? assignedAt = null,}) {
  return _then(OrderAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,riderId: null == riderId ? _self.riderId : riderId // ignore: cast_nullable_to_non_nullable
as String,riderName: freezed == riderName ? _self.riderName : riderName // ignore: cast_nullable_to_non_nullable
as String?,riderPhone: freezed == riderPhone ? _self.riderPhone : riderPhone // ignore: cast_nullable_to_non_nullable
as String?,assignedAt: null == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderAssignment].
extension OrderAssignmentPatterns on OrderAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderAssignment value)  $default,){
final _that = this;
switch (_that) {
case _OrderAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _OrderAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  String riderId,  String? riderName,  String? riderPhone,  DateTime assignedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderAssignment() when $default != null:
return $default(_that.id,_that.status,_that.riderId,_that.riderName,_that.riderPhone,_that.assignedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  String riderId,  String? riderName,  String? riderPhone,  DateTime assignedAt)  $default,) {final _that = this;
switch (_that) {
case _OrderAssignment():
return $default(_that.id,_that.status,_that.riderId,_that.riderName,_that.riderPhone,_that.assignedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  String riderId,  String? riderName,  String? riderPhone,  DateTime assignedAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderAssignment() when $default != null:
return $default(_that.id,_that.status,_that.riderId,_that.riderName,_that.riderPhone,_that.assignedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderAssignment implements OrderAssignment {
  const _OrderAssignment({required this.id, required this.status, required this.riderId, this.riderName, this.riderPhone, required this.assignedAt});
  factory _OrderAssignment.fromJson(Map<String, dynamic> json) => _$OrderAssignmentFromJson(json);

@override final  String id;
@override final  String status;
@override final  String riderId;
@override final  String? riderName;
@override final  String? riderPhone;
@override final  DateTime assignedAt;

/// Create a copy of OrderAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderAssignmentCopyWith<_OrderAssignment> get copyWith => __$OrderAssignmentCopyWithImpl<_OrderAssignment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderAssignmentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.riderId, riderId) || other.riderId == riderId)&&(identical(other.riderName, riderName) || other.riderName == riderName)&&(identical(other.riderPhone, riderPhone) || other.riderPhone == riderPhone)&&(identical(other.assignedAt, assignedAt) || other.assignedAt == assignedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,status,riderId,riderName,riderPhone,assignedAt);
}

@override
String toString() {
    return 'OrderAssignment(id: $id, status: $status, riderId: $riderId, riderName: $riderName, riderPhone: $riderPhone, assignedAt: $assignedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderAssignmentCopyWith<$Res> implements $OrderAssignmentCopyWith<$Res> {
  factory _$OrderAssignmentCopyWith(_OrderAssignment value, $Res Function(_OrderAssignment) _then) = __$OrderAssignmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, String riderId, String? riderName, String? riderPhone, DateTime assignedAt
});




}
/// @nodoc
class __$OrderAssignmentCopyWithImpl<$Res>
    implements _$OrderAssignmentCopyWith<$Res> {
  __$OrderAssignmentCopyWithImpl(this._self, this._then);

  final _OrderAssignment _self;
  final $Res Function(_OrderAssignment) _then;

/// Create a copy of OrderAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? riderId = null,Object? riderName = freezed,Object? riderPhone = freezed,Object? assignedAt = null,}) {
  return _then(_OrderAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,riderId: null == riderId ? _self.riderId : riderId // ignore: cast_nullable_to_non_nullable
as String,riderName: freezed == riderName ? _self.riderName : riderName // ignore: cast_nullable_to_non_nullable
as String?,riderPhone: freezed == riderPhone ? _self.riderPhone : riderPhone // ignore: cast_nullable_to_non_nullable
as String?,assignedAt: null == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Payment {

 String get id;@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod get method; String get provider;@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus get status; int get amount; int get refundedAmount; DateTime? get paidAt; String? get checkoutUrl;
/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCopyWith<Payment> get copyWith => _$PaymentCopyWithImpl<Payment>(this as Payment, _$identity);

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Payment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.provider, _this.provider) || other.provider == _this.provider)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.refundedAmount, _this.refundedAmount) || other.refundedAmount == _this.refundedAmount)&&(identical(other.paidAt, _this.paidAt) || other.paidAt == _this.paidAt)&&(identical(other.checkoutUrl, _this.checkoutUrl) || other.checkoutUrl == _this.checkoutUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Payment;
  return Object.hash(runtimeType,_this.id,_this.method,_this.provider,_this.status,_this.amount,_this.refundedAmount,_this.paidAt,_this.checkoutUrl);
}

@override
String toString() {
  final _this = this as Payment;
  return 'Payment(id: ${_this.id}, method: ${_this.method}, provider: ${_this.provider}, status: ${_this.status}, amount: ${_this.amount}, refundedAmount: ${_this.refundedAmount}, paidAt: ${_this.paidAt}, checkoutUrl: ${_this.checkoutUrl})';
}


}

/// @nodoc
abstract mixin class $PaymentCopyWith<$Res>  {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) _then) = _$PaymentCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod method, String provider,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus status, int amount, int refundedAmount, DateTime? paidAt, String? checkoutUrl
});




}
/// @nodoc
class _$PaymentCopyWithImpl<$Res>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._self, this._then);

  final Payment _self;
  final $Res Function(Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? method = null,Object? provider = null,Object? status = null,Object? amount = null,Object? refundedAmount = null,Object? paidAt = freezed,Object? checkoutUrl = freezed,}) {
  return _then(Payment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,refundedAmount: null == refundedAmount ? _self.refundedAmount : refundedAmount // ignore: cast_nullable_to_non_nullable
as int,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,checkoutUrl: freezed == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Payment].
extension PaymentPatterns on Payment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payment value)  $default,){
final _that = this;
switch (_that) {
case _Payment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payment value)?  $default,){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method,  String provider, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus status,  int amount,  int refundedAmount,  DateTime? paidAt,  String? checkoutUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.method,_that.provider,_that.status,_that.amount,_that.refundedAmount,_that.paidAt,_that.checkoutUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method,  String provider, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus status,  int amount,  int refundedAmount,  DateTime? paidAt,  String? checkoutUrl)  $default,) {final _that = this;
switch (_that) {
case _Payment():
return $default(_that.id,_that.method,_that.provider,_that.status,_that.amount,_that.refundedAmount,_that.paidAt,_that.checkoutUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method,  String provider, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus status,  int amount,  int refundedAmount,  DateTime? paidAt,  String? checkoutUrl)?  $default,) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.method,_that.provider,_that.status,_that.amount,_that.refundedAmount,_that.paidAt,_that.checkoutUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Payment implements Payment {
  const _Payment({required this.id, @JsonKey(unknownEnumValue: PaymentMethod.unknown) required this.method, this.provider = '', @JsonKey(unknownEnumValue: PaymentStatus.unknown) required this.status, required this.amount, this.refundedAmount = 0, this.paidAt, this.checkoutUrl});
  factory _Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

@override final  String id;
@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod method;
@override@JsonKey() final  String provider;
@override@JsonKey(unknownEnumValue: PaymentStatus.unknown) final  PaymentStatus status;
@override final  int amount;
@override@JsonKey() final  int refundedAmount;
@override final  DateTime? paidAt;
@override final  String? checkoutUrl;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCopyWith<_Payment> get copyWith => __$PaymentCopyWithImpl<_Payment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.status, status) || other.status == status)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.refundedAmount, refundedAmount) || other.refundedAmount == refundedAmount)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,method,provider,status,amount,refundedAmount,paidAt,checkoutUrl);
}

@override
String toString() {
    return 'Payment(id: $id, method: $method, provider: $provider, status: $status, amount: $amount, refundedAmount: $refundedAmount, paidAt: $paidAt, checkoutUrl: $checkoutUrl)';
}


}

/// @nodoc
abstract mixin class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) _then) = __$PaymentCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod method, String provider,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus status, int amount, int refundedAmount, DateTime? paidAt, String? checkoutUrl
});




}
/// @nodoc
class __$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(this._self, this._then);

  final _Payment _self;
  final $Res Function(_Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? method = null,Object? provider = null,Object? status = null,Object? amount = null,Object? refundedAmount = null,Object? paidAt = freezed,Object? checkoutUrl = freezed,}) {
  return _then(_Payment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,refundedAmount: null == refundedAmount ? _self.refundedAmount : refundedAmount // ignore: cast_nullable_to_non_nullable
as int,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,checkoutUrl: freezed == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderStatusHistory {

 String get id;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus? get fromStatus;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get toStatus; String get actorRole; String? get actorName; String? get reason; DateTime get createdAt;
/// Create a copy of OrderStatusHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderStatusHistoryCopyWith<OrderStatusHistory> get copyWith => _$OrderStatusHistoryCopyWithImpl<OrderStatusHistory>(this as OrderStatusHistory, _$identity);

  /// Serializes this OrderStatusHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderStatusHistory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderStatusHistory&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.fromStatus, _this.fromStatus) || other.fromStatus == _this.fromStatus)&&(identical(other.toStatus, _this.toStatus) || other.toStatus == _this.toStatus)&&(identical(other.actorRole, _this.actorRole) || other.actorRole == _this.actorRole)&&(identical(other.actorName, _this.actorName) || other.actorName == _this.actorName)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderStatusHistory;
  return Object.hash(runtimeType,_this.id,_this.fromStatus,_this.toStatus,_this.actorRole,_this.actorName,_this.reason,_this.createdAt);
}

@override
String toString() {
  final _this = this as OrderStatusHistory;
  return 'OrderStatusHistory(id: ${_this.id}, fromStatus: ${_this.fromStatus}, toStatus: ${_this.toStatus}, actorRole: ${_this.actorRole}, actorName: ${_this.actorName}, reason: ${_this.reason}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $OrderStatusHistoryCopyWith<$Res>  {
  factory $OrderStatusHistoryCopyWith(OrderStatusHistory value, $Res Function(OrderStatusHistory) _then) = _$OrderStatusHistoryCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus? fromStatus,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus toStatus, String actorRole, String? actorName, String? reason, DateTime createdAt
});




}
/// @nodoc
class _$OrderStatusHistoryCopyWithImpl<$Res>
    implements $OrderStatusHistoryCopyWith<$Res> {
  _$OrderStatusHistoryCopyWithImpl(this._self, this._then);

  final OrderStatusHistory _self;
  final $Res Function(OrderStatusHistory) _then;

/// Create a copy of OrderStatusHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fromStatus = freezed,Object? toStatus = null,Object? actorRole = null,Object? actorName = freezed,Object? reason = freezed,Object? createdAt = null,}) {
  return _then(OrderStatusHistory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fromStatus: freezed == fromStatus ? _self.fromStatus : fromStatus // ignore: cast_nullable_to_non_nullable
as OrderStatus?,toStatus: null == toStatus ? _self.toStatus : toStatus // ignore: cast_nullable_to_non_nullable
as OrderStatus,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String,actorName: freezed == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderStatusHistory].
extension OrderStatusHistoryPatterns on OrderStatusHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderStatusHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderStatusHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderStatusHistory value)  $default,){
final _that = this;
switch (_that) {
case _OrderStatusHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderStatusHistory value)?  $default,){
final _that = this;
switch (_that) {
case _OrderStatusHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus? fromStatus, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus toStatus,  String actorRole,  String? actorName,  String? reason,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderStatusHistory() when $default != null:
return $default(_that.id,_that.fromStatus,_that.toStatus,_that.actorRole,_that.actorName,_that.reason,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus? fromStatus, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus toStatus,  String actorRole,  String? actorName,  String? reason,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _OrderStatusHistory():
return $default(_that.id,_that.fromStatus,_that.toStatus,_that.actorRole,_that.actorName,_that.reason,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus? fromStatus, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus toStatus,  String actorRole,  String? actorName,  String? reason,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderStatusHistory() when $default != null:
return $default(_that.id,_that.fromStatus,_that.toStatus,_that.actorRole,_that.actorName,_that.reason,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderStatusHistory implements OrderStatusHistory {
  const _OrderStatusHistory({required this.id, @JsonKey(unknownEnumValue: OrderStatus.unknown) this.fromStatus, @JsonKey(unknownEnumValue: OrderStatus.unknown) required this.toStatus, this.actorRole = 'SYSTEM', this.actorName, this.reason, required this.createdAt});
  factory _OrderStatusHistory.fromJson(Map<String, dynamic> json) => _$OrderStatusHistoryFromJson(json);

@override final  String id;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus? fromStatus;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus toStatus;
@override@JsonKey() final  String actorRole;
@override final  String? actorName;
@override final  String? reason;
@override final  DateTime createdAt;

/// Create a copy of OrderStatusHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderStatusHistoryCopyWith<_OrderStatusHistory> get copyWith => __$OrderStatusHistoryCopyWithImpl<_OrderStatusHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderStatusHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderStatusHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.fromStatus, fromStatus) || other.fromStatus == fromStatus)&&(identical(other.toStatus, toStatus) || other.toStatus == toStatus)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.actorName, actorName) || other.actorName == actorName)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,fromStatus,toStatus,actorRole,actorName,reason,createdAt);
}

@override
String toString() {
    return 'OrderStatusHistory(id: $id, fromStatus: $fromStatus, toStatus: $toStatus, actorRole: $actorRole, actorName: $actorName, reason: $reason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OrderStatusHistoryCopyWith<$Res> implements $OrderStatusHistoryCopyWith<$Res> {
  factory _$OrderStatusHistoryCopyWith(_OrderStatusHistory value, $Res Function(_OrderStatusHistory) _then) = __$OrderStatusHistoryCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus? fromStatus,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus toStatus, String actorRole, String? actorName, String? reason, DateTime createdAt
});




}
/// @nodoc
class __$OrderStatusHistoryCopyWithImpl<$Res>
    implements _$OrderStatusHistoryCopyWith<$Res> {
  __$OrderStatusHistoryCopyWithImpl(this._self, this._then);

  final _OrderStatusHistory _self;
  final $Res Function(_OrderStatusHistory) _then;

/// Create a copy of OrderStatusHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fromStatus = freezed,Object? toStatus = null,Object? actorRole = null,Object? actorName = freezed,Object? reason = freezed,Object? createdAt = null,}) {
  return _then(_OrderStatusHistory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fromStatus: freezed == fromStatus ? _self.fromStatus : fromStatus // ignore: cast_nullable_to_non_nullable
as OrderStatus?,toStatus: null == toStatus ? _self.toStatus : toStatus // ignore: cast_nullable_to_non_nullable
as OrderStatus,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String,actorName: freezed == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Order {

 String get id; String get orderNumber; String get branchId; String get branchName;@JsonKey(unknownEnumValue: OrderType.unknown) OrderType get type;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get status; String get source;@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod get paymentMethod;@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus get paymentStatus; String? get customerName; String? get customerPhone; int get itemCount; int get total; String get currency; String? get tableRef; DateTime get placedAt; DateTime get updatedAt; List<OrderItem> get items; Totals get totals; String? get notes; String? get pickupName; DeliveryInfo? get delivery; Payment? get payment; OrderAssignment? get assignment; DateTime? get estimatedReadyAt; DateTime? get confirmedAt; DateTime? get readyAt; DateTime? get completedAt; DateTime? get cancelledAt; String? get cancelReason; bool get canCancel;/// Statuses the signed-in caller may move this order to (staff screens
/// show buttons only for these).
@JsonKey(unknownEnumValue: OrderStatus.unknown) List<OrderStatus> get allowedTransitions; List<OrderStatusHistory> get history;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Order;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.paymentMethod, _this.paymentMethod) || other.paymentMethod == _this.paymentMethod)&&(identical(other.paymentStatus, _this.paymentStatus) || other.paymentStatus == _this.paymentStatus)&&(identical(other.customerName, _this.customerName) || other.customerName == _this.customerName)&&(identical(other.customerPhone, _this.customerPhone) || other.customerPhone == _this.customerPhone)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.tableRef, _this.tableRef) || other.tableRef == _this.tableRef)&&(identical(other.placedAt, _this.placedAt) || other.placedAt == _this.placedAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.totals, _this.totals) || other.totals == _this.totals)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.pickupName, _this.pickupName) || other.pickupName == _this.pickupName)&&(identical(other.delivery, _this.delivery) || other.delivery == _this.delivery)&&(identical(other.payment, _this.payment) || other.payment == _this.payment)&&(identical(other.assignment, _this.assignment) || other.assignment == _this.assignment)&&(identical(other.estimatedReadyAt, _this.estimatedReadyAt) || other.estimatedReadyAt == _this.estimatedReadyAt)&&(identical(other.confirmedAt, _this.confirmedAt) || other.confirmedAt == _this.confirmedAt)&&(identical(other.readyAt, _this.readyAt) || other.readyAt == _this.readyAt)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&(identical(other.cancelledAt, _this.cancelledAt) || other.cancelledAt == _this.cancelledAt)&&(identical(other.cancelReason, _this.cancelReason) || other.cancelReason == _this.cancelReason)&&(identical(other.canCancel, _this.canCancel) || other.canCancel == _this.canCancel)&&const DeepCollectionEquality().equals(other.allowedTransitions, _this.allowedTransitions)&&const DeepCollectionEquality().equals(other.history, _this.history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Order;
  return Object.hashAll([runtimeType,_this.id,_this.orderNumber,_this.branchId,_this.branchName,_this.type,_this.status,_this.source,_this.paymentMethod,_this.paymentStatus,_this.customerName,_this.customerPhone,_this.itemCount,_this.total,_this.currency,_this.tableRef,_this.placedAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.items),_this.totals,_this.notes,_this.pickupName,_this.delivery,_this.payment,_this.assignment,_this.estimatedReadyAt,_this.confirmedAt,_this.readyAt,_this.completedAt,_this.cancelledAt,_this.cancelReason,_this.canCancel,const DeepCollectionEquality().hash(_this.allowedTransitions),const DeepCollectionEquality().hash(_this.history)]);
}

@override
String toString() {
  final _this = this as Order;
  return 'Order(id: ${_this.id}, orderNumber: ${_this.orderNumber}, branchId: ${_this.branchId}, branchName: ${_this.branchName}, type: ${_this.type}, status: ${_this.status}, source: ${_this.source}, paymentMethod: ${_this.paymentMethod}, paymentStatus: ${_this.paymentStatus}, customerName: ${_this.customerName}, customerPhone: ${_this.customerPhone}, itemCount: ${_this.itemCount}, total: ${_this.total}, currency: ${_this.currency}, tableRef: ${_this.tableRef}, placedAt: ${_this.placedAt}, updatedAt: ${_this.updatedAt}, items: ${_this.items}, totals: ${_this.totals}, notes: ${_this.notes}, pickupName: ${_this.pickupName}, delivery: ${_this.delivery}, payment: ${_this.payment}, assignment: ${_this.assignment}, estimatedReadyAt: ${_this.estimatedReadyAt}, confirmedAt: ${_this.confirmedAt}, readyAt: ${_this.readyAt}, completedAt: ${_this.completedAt}, cancelledAt: ${_this.cancelledAt}, cancelReason: ${_this.cancelReason}, canCancel: ${_this.canCancel}, allowedTransitions: ${_this.allowedTransitions}, history: ${_this.history})';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, String orderNumber, String branchId, String branchName,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType type,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, String source,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod paymentMethod,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus paymentStatus, String? customerName, String? customerPhone, int itemCount, int total, String currency, String? tableRef, DateTime placedAt, DateTime updatedAt, List<OrderItem> items, Totals totals, String? notes, String? pickupName, DeliveryInfo? delivery, Payment? payment, OrderAssignment? assignment, DateTime? estimatedReadyAt, DateTime? confirmedAt, DateTime? readyAt, DateTime? completedAt, DateTime? cancelledAt, String? cancelReason, bool canCancel,@JsonKey(unknownEnumValue: OrderStatus.unknown) List<OrderStatus> allowedTransitions, List<OrderStatusHistory> history
});


$TotalsCopyWith<$Res> get totals;$DeliveryInfoCopyWith<$Res>? get delivery;$PaymentCopyWith<$Res>? get payment;$OrderAssignmentCopyWith<$Res>? get assignment;

}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? branchId = null,Object? branchName = null,Object? type = null,Object? status = null,Object? source = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? customerName = freezed,Object? customerPhone = freezed,Object? itemCount = null,Object? total = null,Object? currency = null,Object? tableRef = freezed,Object? placedAt = null,Object? updatedAt = null,Object? items = null,Object? totals = null,Object? notes = freezed,Object? pickupName = freezed,Object? delivery = freezed,Object? payment = freezed,Object? assignment = freezed,Object? estimatedReadyAt = freezed,Object? confirmedAt = freezed,Object? readyAt = freezed,Object? completedAt = freezed,Object? cancelledAt = freezed,Object? cancelReason = freezed,Object? canCancel = null,Object? allowedTransitions = null,Object? history = null,}) {
  return _then(Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,tableRef: freezed == tableRef ? _self.tableRef : tableRef // ignore: cast_nullable_to_non_nullable
as String?,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as Totals,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,pickupName: freezed == pickupName ? _self.pickupName : pickupName // ignore: cast_nullable_to_non_nullable
as String?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as DeliveryInfo?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as Payment?,assignment: freezed == assignment ? _self.assignment : assignment // ignore: cast_nullable_to_non_nullable
as OrderAssignment?,estimatedReadyAt: freezed == estimatedReadyAt ? _self.estimatedReadyAt : estimatedReadyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readyAt: freezed == readyAt ? _self.readyAt : readyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,allowedTransitions: null == allowedTransitions ? _self.allowedTransitions : allowedTransitions // ignore: cast_nullable_to_non_nullable
as List<OrderStatus>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<OrderStatusHistory>,
  ));
}
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotalsCopyWith<$Res> get totals {
  
  return $TotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryInfoCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
    return null;
  }

  return $DeliveryInfoCopyWith<$Res>(_self.delivery!, (value) {
    return _then(_self.copyWith(delivery: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderAssignmentCopyWith<$Res>? get assignment {
    if (_self.assignment == null) {
    return null;
  }

  return $OrderAssignmentCopyWith<$Res>(_self.assignment!, (value) {
    return _then(_self.copyWith(assignment: value));
  });
}
}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderNumber,  String branchId,  String branchName, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String source, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  String? customerName,  String? customerPhone,  int itemCount,  int total,  String currency,  String? tableRef,  DateTime placedAt,  DateTime updatedAt,  List<OrderItem> items,  Totals totals,  String? notes,  String? pickupName,  DeliveryInfo? delivery,  Payment? payment,  OrderAssignment? assignment,  DateTime? estimatedReadyAt,  DateTime? confirmedAt,  DateTime? readyAt,  DateTime? completedAt,  DateTime? cancelledAt,  String? cancelReason,  bool canCancel, @JsonKey(unknownEnumValue: OrderStatus.unknown)  List<OrderStatus> allowedTransitions,  List<OrderStatusHistory> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.orderNumber,_that.branchId,_that.branchName,_that.type,_that.status,_that.source,_that.paymentMethod,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.itemCount,_that.total,_that.currency,_that.tableRef,_that.placedAt,_that.updatedAt,_that.items,_that.totals,_that.notes,_that.pickupName,_that.delivery,_that.payment,_that.assignment,_that.estimatedReadyAt,_that.confirmedAt,_that.readyAt,_that.completedAt,_that.cancelledAt,_that.cancelReason,_that.canCancel,_that.allowedTransitions,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderNumber,  String branchId,  String branchName, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String source, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  String? customerName,  String? customerPhone,  int itemCount,  int total,  String currency,  String? tableRef,  DateTime placedAt,  DateTime updatedAt,  List<OrderItem> items,  Totals totals,  String? notes,  String? pickupName,  DeliveryInfo? delivery,  Payment? payment,  OrderAssignment? assignment,  DateTime? estimatedReadyAt,  DateTime? confirmedAt,  DateTime? readyAt,  DateTime? completedAt,  DateTime? cancelledAt,  String? cancelReason,  bool canCancel, @JsonKey(unknownEnumValue: OrderStatus.unknown)  List<OrderStatus> allowedTransitions,  List<OrderStatusHistory> history)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.orderNumber,_that.branchId,_that.branchName,_that.type,_that.status,_that.source,_that.paymentMethod,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.itemCount,_that.total,_that.currency,_that.tableRef,_that.placedAt,_that.updatedAt,_that.items,_that.totals,_that.notes,_that.pickupName,_that.delivery,_that.payment,_that.assignment,_that.estimatedReadyAt,_that.confirmedAt,_that.readyAt,_that.completedAt,_that.cancelledAt,_that.cancelReason,_that.canCancel,_that.allowedTransitions,_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderNumber,  String branchId,  String branchName, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String source, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  String? customerName,  String? customerPhone,  int itemCount,  int total,  String currency,  String? tableRef,  DateTime placedAt,  DateTime updatedAt,  List<OrderItem> items,  Totals totals,  String? notes,  String? pickupName,  DeliveryInfo? delivery,  Payment? payment,  OrderAssignment? assignment,  DateTime? estimatedReadyAt,  DateTime? confirmedAt,  DateTime? readyAt,  DateTime? completedAt,  DateTime? cancelledAt,  String? cancelReason,  bool canCancel, @JsonKey(unknownEnumValue: OrderStatus.unknown)  List<OrderStatus> allowedTransitions,  List<OrderStatusHistory> history)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.orderNumber,_that.branchId,_that.branchName,_that.type,_that.status,_that.source,_that.paymentMethod,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.itemCount,_that.total,_that.currency,_that.tableRef,_that.placedAt,_that.updatedAt,_that.items,_that.totals,_that.notes,_that.pickupName,_that.delivery,_that.payment,_that.assignment,_that.estimatedReadyAt,_that.confirmedAt,_that.readyAt,_that.completedAt,_that.cancelledAt,_that.cancelReason,_that.canCancel,_that.allowedTransitions,_that.history);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order implements Order {
  const _Order({required this.id, required this.orderNumber, required this.branchId, required this.branchName, @JsonKey(unknownEnumValue: OrderType.unknown) required this.type, @JsonKey(unknownEnumValue: OrderStatus.unknown) required this.status, this.source = 'MOBILE', @JsonKey(unknownEnumValue: PaymentMethod.unknown) required this.paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown) required this.paymentStatus, this.customerName, this.customerPhone, this.itemCount = 0, required this.total, this.currency = 'PKR', this.tableRef, required this.placedAt, required this.updatedAt,  List<OrderItem> items = const [], required this.totals, this.notes, this.pickupName, this.delivery, this.payment, this.assignment, this.estimatedReadyAt, this.confirmedAt, this.readyAt, this.completedAt, this.cancelledAt, this.cancelReason, this.canCancel = false, @JsonKey(unknownEnumValue: OrderStatus.unknown)  List<OrderStatus> allowedTransitions = const [],  List<OrderStatusHistory> history = const []}): _items = items,_allowedTransitions = allowedTransitions,_history = history;
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  String id;
@override final  String orderNumber;
@override final  String branchId;
@override final  String branchName;
@override@JsonKey(unknownEnumValue: OrderType.unknown) final  OrderType type;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus status;
@override@JsonKey() final  String source;
@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod paymentMethod;
@override@JsonKey(unknownEnumValue: PaymentStatus.unknown) final  PaymentStatus paymentStatus;
@override final  String? customerName;
@override final  String? customerPhone;
@override@JsonKey() final  int itemCount;
@override final  int total;
@override@JsonKey() final  String currency;
@override final  String? tableRef;
@override final  DateTime placedAt;
@override final  DateTime updatedAt;
 final  List<OrderItem> _items;
@override@JsonKey() List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  Totals totals;
@override final  String? notes;
@override final  String? pickupName;
@override final  DeliveryInfo? delivery;
@override final  Payment? payment;
@override final  OrderAssignment? assignment;
@override final  DateTime? estimatedReadyAt;
@override final  DateTime? confirmedAt;
@override final  DateTime? readyAt;
@override final  DateTime? completedAt;
@override final  DateTime? cancelledAt;
@override final  String? cancelReason;
@override@JsonKey() final  bool canCancel;
/// Statuses the signed-in caller may move this order to (staff screens
/// show buttons only for these).
 final  List<OrderStatus> _allowedTransitions;
/// Statuses the signed-in caller may move this order to (staff screens
/// show buttons only for these).
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) List<OrderStatus> get allowedTransitions {
  if (_allowedTransitions is EqualUnmodifiableListView) return _allowedTransitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedTransitions);
}

 final  List<OrderStatusHistory> _history;
@override@JsonKey() List<OrderStatusHistory> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.source, source) || other.source == source)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.total, total) || other.total == total)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.tableRef, tableRef) || other.tableRef == tableRef)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.pickupName, pickupName) || other.pickupName == pickupName)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.assignment, assignment) || other.assignment == assignment)&&(identical(other.estimatedReadyAt, estimatedReadyAt) || other.estimatedReadyAt == estimatedReadyAt)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.readyAt, readyAt) || other.readyAt == readyAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.cancelReason, cancelReason) || other.cancelReason == cancelReason)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&const DeepCollectionEquality().equals(other.allowedTransitions, _allowedTransitions)&&const DeepCollectionEquality().equals(other.history, _history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,orderNumber,branchId,branchName,type,status,source,paymentMethod,paymentStatus,customerName,customerPhone,itemCount,total,currency,tableRef,placedAt,updatedAt,const DeepCollectionEquality().hash(_items),totals,notes,pickupName,delivery,payment,assignment,estimatedReadyAt,confirmedAt,readyAt,completedAt,cancelledAt,cancelReason,canCancel,const DeepCollectionEquality().hash(_allowedTransitions),const DeepCollectionEquality().hash(_history)]);
}

@override
String toString() {
    return 'Order(id: $id, orderNumber: $orderNumber, branchId: $branchId, branchName: $branchName, type: $type, status: $status, source: $source, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, customerName: $customerName, customerPhone: $customerPhone, itemCount: $itemCount, total: $total, currency: $currency, tableRef: $tableRef, placedAt: $placedAt, updatedAt: $updatedAt, items: $items, totals: $totals, notes: $notes, pickupName: $pickupName, delivery: $delivery, payment: $payment, assignment: $assignment, estimatedReadyAt: $estimatedReadyAt, confirmedAt: $confirmedAt, readyAt: $readyAt, completedAt: $completedAt, cancelledAt: $cancelledAt, cancelReason: $cancelReason, canCancel: $canCancel, allowedTransitions: $allowedTransitions, history: $history)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderNumber, String branchId, String branchName,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType type,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, String source,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod paymentMethod,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus paymentStatus, String? customerName, String? customerPhone, int itemCount, int total, String currency, String? tableRef, DateTime placedAt, DateTime updatedAt, List<OrderItem> items, Totals totals, String? notes, String? pickupName, DeliveryInfo? delivery, Payment? payment, OrderAssignment? assignment, DateTime? estimatedReadyAt, DateTime? confirmedAt, DateTime? readyAt, DateTime? completedAt, DateTime? cancelledAt, String? cancelReason, bool canCancel,@JsonKey(unknownEnumValue: OrderStatus.unknown) List<OrderStatus> allowedTransitions, List<OrderStatusHistory> history
});


@override $TotalsCopyWith<$Res> get totals;@override $DeliveryInfoCopyWith<$Res>? get delivery;@override $PaymentCopyWith<$Res>? get payment;@override $OrderAssignmentCopyWith<$Res>? get assignment;

}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? branchId = null,Object? branchName = null,Object? type = null,Object? status = null,Object? source = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? customerName = freezed,Object? customerPhone = freezed,Object? itemCount = null,Object? total = null,Object? currency = null,Object? tableRef = freezed,Object? placedAt = null,Object? updatedAt = null,Object? items = null,Object? totals = null,Object? notes = freezed,Object? pickupName = freezed,Object? delivery = freezed,Object? payment = freezed,Object? assignment = freezed,Object? estimatedReadyAt = freezed,Object? confirmedAt = freezed,Object? readyAt = freezed,Object? completedAt = freezed,Object? cancelledAt = freezed,Object? cancelReason = freezed,Object? canCancel = null,Object? allowedTransitions = null,Object? history = null,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,tableRef: freezed == tableRef ? _self.tableRef : tableRef // ignore: cast_nullable_to_non_nullable
as String?,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as Totals,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,pickupName: freezed == pickupName ? _self.pickupName : pickupName // ignore: cast_nullable_to_non_nullable
as String?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as DeliveryInfo?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as Payment?,assignment: freezed == assignment ? _self.assignment : assignment // ignore: cast_nullable_to_non_nullable
as OrderAssignment?,estimatedReadyAt: freezed == estimatedReadyAt ? _self.estimatedReadyAt : estimatedReadyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readyAt: freezed == readyAt ? _self.readyAt : readyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,allowedTransitions: null == allowedTransitions ? _self._allowedTransitions : allowedTransitions // ignore: cast_nullable_to_non_nullable
as List<OrderStatus>,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<OrderStatusHistory>,
  ));
}

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotalsCopyWith<$Res> get totals {
  
  return $TotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryInfoCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
    return null;
  }

  return $DeliveryInfoCopyWith<$Res>(_self.delivery!, (value) {
    return _then(_self.copyWith(delivery: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderAssignmentCopyWith<$Res>? get assignment {
    if (_self.assignment == null) {
    return null;
  }

  return $OrderAssignmentCopyWith<$Res>(_self.assignment!, (value) {
    return _then(_self.copyWith(assignment: value));
  });
}
}


/// @nodoc
mixin _$OrderSummary {

 String get id; String get orderNumber; String get branchId; String get branchName;@JsonKey(unknownEnumValue: OrderType.unknown) OrderType get type;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get status; String get source;@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod get paymentMethod;@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus get paymentStatus; String? get customerName; String? get customerPhone; int get itemCount; int get total; String? get tableRef; DateTime get placedAt; DateTime get updatedAt;
/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderSummaryCopyWith<OrderSummary> get copyWith => _$OrderSummaryCopyWithImpl<OrderSummary>(this as OrderSummary, _$identity);

  /// Serializes this OrderSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderSummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.paymentMethod, _this.paymentMethod) || other.paymentMethod == _this.paymentMethod)&&(identical(other.paymentStatus, _this.paymentStatus) || other.paymentStatus == _this.paymentStatus)&&(identical(other.customerName, _this.customerName) || other.customerName == _this.customerName)&&(identical(other.customerPhone, _this.customerPhone) || other.customerPhone == _this.customerPhone)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.tableRef, _this.tableRef) || other.tableRef == _this.tableRef)&&(identical(other.placedAt, _this.placedAt) || other.placedAt == _this.placedAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderSummary;
  return Object.hash(runtimeType,_this.id,_this.orderNumber,_this.branchId,_this.branchName,_this.type,_this.status,_this.source,_this.paymentMethod,_this.paymentStatus,_this.customerName,_this.customerPhone,_this.itemCount,_this.total,_this.tableRef,_this.placedAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as OrderSummary;
  return 'OrderSummary(id: ${_this.id}, orderNumber: ${_this.orderNumber}, branchId: ${_this.branchId}, branchName: ${_this.branchName}, type: ${_this.type}, status: ${_this.status}, source: ${_this.source}, paymentMethod: ${_this.paymentMethod}, paymentStatus: ${_this.paymentStatus}, customerName: ${_this.customerName}, customerPhone: ${_this.customerPhone}, itemCount: ${_this.itemCount}, total: ${_this.total}, tableRef: ${_this.tableRef}, placedAt: ${_this.placedAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $OrderSummaryCopyWith<$Res>  {
  factory $OrderSummaryCopyWith(OrderSummary value, $Res Function(OrderSummary) _then) = _$OrderSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String orderNumber, String branchId, String branchName,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType type,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, String source,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod paymentMethod,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus paymentStatus, String? customerName, String? customerPhone, int itemCount, int total, String? tableRef, DateTime placedAt, DateTime updatedAt
});




}
/// @nodoc
class _$OrderSummaryCopyWithImpl<$Res>
    implements $OrderSummaryCopyWith<$Res> {
  _$OrderSummaryCopyWithImpl(this._self, this._then);

  final OrderSummary _self;
  final $Res Function(OrderSummary) _then;

/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? branchId = null,Object? branchName = null,Object? type = null,Object? status = null,Object? source = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? customerName = freezed,Object? customerPhone = freezed,Object? itemCount = null,Object? total = null,Object? tableRef = freezed,Object? placedAt = null,Object? updatedAt = null,}) {
  return _then(OrderSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,tableRef: freezed == tableRef ? _self.tableRef : tableRef // ignore: cast_nullable_to_non_nullable
as String?,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderSummary].
extension OrderSummaryPatterns on OrderSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderSummary value)  $default,){
final _that = this;
switch (_that) {
case _OrderSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderSummary value)?  $default,){
final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderNumber,  String branchId,  String branchName, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String source, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  String? customerName,  String? customerPhone,  int itemCount,  int total,  String? tableRef,  DateTime placedAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
return $default(_that.id,_that.orderNumber,_that.branchId,_that.branchName,_that.type,_that.status,_that.source,_that.paymentMethod,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.itemCount,_that.total,_that.tableRef,_that.placedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderNumber,  String branchId,  String branchName, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String source, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  String? customerName,  String? customerPhone,  int itemCount,  int total,  String? tableRef,  DateTime placedAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _OrderSummary():
return $default(_that.id,_that.orderNumber,_that.branchId,_that.branchName,_that.type,_that.status,_that.source,_that.paymentMethod,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.itemCount,_that.total,_that.tableRef,_that.placedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderNumber,  String branchId,  String branchName, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String source, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  String? customerName,  String? customerPhone,  int itemCount,  int total,  String? tableRef,  DateTime placedAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
return $default(_that.id,_that.orderNumber,_that.branchId,_that.branchName,_that.type,_that.status,_that.source,_that.paymentMethod,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.itemCount,_that.total,_that.tableRef,_that.placedAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderSummary implements OrderSummary {
  const _OrderSummary({required this.id, required this.orderNumber, required this.branchId, this.branchName = '', @JsonKey(unknownEnumValue: OrderType.unknown) required this.type, @JsonKey(unknownEnumValue: OrderStatus.unknown) required this.status, this.source = 'WEB', @JsonKey(unknownEnumValue: PaymentMethod.unknown) required this.paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown) required this.paymentStatus, this.customerName, this.customerPhone, this.itemCount = 0, required this.total, this.tableRef, required this.placedAt, required this.updatedAt});
  factory _OrderSummary.fromJson(Map<String, dynamic> json) => _$OrderSummaryFromJson(json);

@override final  String id;
@override final  String orderNumber;
@override final  String branchId;
@override@JsonKey() final  String branchName;
@override@JsonKey(unknownEnumValue: OrderType.unknown) final  OrderType type;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus status;
@override@JsonKey() final  String source;
@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod paymentMethod;
@override@JsonKey(unknownEnumValue: PaymentStatus.unknown) final  PaymentStatus paymentStatus;
@override final  String? customerName;
@override final  String? customerPhone;
@override@JsonKey() final  int itemCount;
@override final  int total;
@override final  String? tableRef;
@override final  DateTime placedAt;
@override final  DateTime updatedAt;

/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderSummaryCopyWith<_OrderSummary> get copyWith => __$OrderSummaryCopyWithImpl<_OrderSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.source, source) || other.source == source)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.total, total) || other.total == total)&&(identical(other.tableRef, tableRef) || other.tableRef == tableRef)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orderNumber,branchId,branchName,type,status,source,paymentMethod,paymentStatus,customerName,customerPhone,itemCount,total,tableRef,placedAt,updatedAt);
}

@override
String toString() {
    return 'OrderSummary(id: $id, orderNumber: $orderNumber, branchId: $branchId, branchName: $branchName, type: $type, status: $status, source: $source, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, customerName: $customerName, customerPhone: $customerPhone, itemCount: $itemCount, total: $total, tableRef: $tableRef, placedAt: $placedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderSummaryCopyWith<$Res> implements $OrderSummaryCopyWith<$Res> {
  factory _$OrderSummaryCopyWith(_OrderSummary value, $Res Function(_OrderSummary) _then) = __$OrderSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderNumber, String branchId, String branchName,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType type,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, String source,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod paymentMethod,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus paymentStatus, String? customerName, String? customerPhone, int itemCount, int total, String? tableRef, DateTime placedAt, DateTime updatedAt
});




}
/// @nodoc
class __$OrderSummaryCopyWithImpl<$Res>
    implements _$OrderSummaryCopyWith<$Res> {
  __$OrderSummaryCopyWithImpl(this._self, this._then);

  final _OrderSummary _self;
  final $Res Function(_OrderSummary) _then;

/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? branchId = null,Object? branchName = null,Object? type = null,Object? status = null,Object? source = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? customerName = freezed,Object? customerPhone = freezed,Object? itemCount = null,Object? total = null,Object? tableRef = freezed,Object? placedAt = null,Object? updatedAt = null,}) {
  return _then(_OrderSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,tableRef: freezed == tableRef ? _self.tableRef : tableRef // ignore: cast_nullable_to_non_nullable
as String?,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$TrackingStep {

@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get status; String get label; DateTime? get reachedAt;@JsonKey(unknownEnumValue: TrackingStepState.unknown) TrackingStepState get state;
/// Create a copy of TrackingStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingStepCopyWith<TrackingStep> get copyWith => _$TrackingStepCopyWithImpl<TrackingStep>(this as TrackingStep, _$identity);

  /// Serializes this TrackingStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TrackingStep;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingStep&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.reachedAt, _this.reachedAt) || other.reachedAt == _this.reachedAt)&&(identical(other.state, _this.state) || other.state == _this.state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TrackingStep;
  return Object.hash(runtimeType,_this.status,_this.label,_this.reachedAt,_this.state);
}

@override
String toString() {
  final _this = this as TrackingStep;
  return 'TrackingStep(status: ${_this.status}, label: ${_this.label}, reachedAt: ${_this.reachedAt}, state: ${_this.state})';
}


}

/// @nodoc
abstract mixin class $TrackingStepCopyWith<$Res>  {
  factory $TrackingStepCopyWith(TrackingStep value, $Res Function(TrackingStep) _then) = _$TrackingStepCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, String label, DateTime? reachedAt,@JsonKey(unknownEnumValue: TrackingStepState.unknown) TrackingStepState state
});




}
/// @nodoc
class _$TrackingStepCopyWithImpl<$Res>
    implements $TrackingStepCopyWith<$Res> {
  _$TrackingStepCopyWithImpl(this._self, this._then);

  final TrackingStep _self;
  final $Res Function(TrackingStep) _then;

/// Create a copy of TrackingStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? label = null,Object? reachedAt = freezed,Object? state = null,}) {
  return _then(TrackingStep(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,reachedAt: freezed == reachedAt ? _self.reachedAt : reachedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as TrackingStepState,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingStep].
extension TrackingStepPatterns on TrackingStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingStep value)  $default,){
final _that = this;
switch (_that) {
case _TrackingStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingStep value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String label,  DateTime? reachedAt, @JsonKey(unknownEnumValue: TrackingStepState.unknown)  TrackingStepState state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingStep() when $default != null:
return $default(_that.status,_that.label,_that.reachedAt,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String label,  DateTime? reachedAt, @JsonKey(unknownEnumValue: TrackingStepState.unknown)  TrackingStepState state)  $default,) {final _that = this;
switch (_that) {
case _TrackingStep():
return $default(_that.status,_that.label,_that.reachedAt,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String label,  DateTime? reachedAt, @JsonKey(unknownEnumValue: TrackingStepState.unknown)  TrackingStepState state)?  $default,) {final _that = this;
switch (_that) {
case _TrackingStep() when $default != null:
return $default(_that.status,_that.label,_that.reachedAt,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingStep implements TrackingStep {
  const _TrackingStep({@JsonKey(unknownEnumValue: OrderStatus.unknown) required this.status, required this.label, this.reachedAt, @JsonKey(unknownEnumValue: TrackingStepState.unknown) required this.state});
  factory _TrackingStep.fromJson(Map<String, dynamic> json) => _$TrackingStepFromJson(json);

@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus status;
@override final  String label;
@override final  DateTime? reachedAt;
@override@JsonKey(unknownEnumValue: TrackingStepState.unknown) final  TrackingStepState state;

/// Create a copy of TrackingStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingStepCopyWith<_TrackingStep> get copyWith => __$TrackingStepCopyWithImpl<_TrackingStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingStepToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingStep&&(identical(other.status, status) || other.status == status)&&(identical(other.label, label) || other.label == label)&&(identical(other.reachedAt, reachedAt) || other.reachedAt == reachedAt)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,label,reachedAt,state);
}

@override
String toString() {
    return 'TrackingStep(status: $status, label: $label, reachedAt: $reachedAt, state: $state)';
}


}

/// @nodoc
abstract mixin class _$TrackingStepCopyWith<$Res> implements $TrackingStepCopyWith<$Res> {
  factory _$TrackingStepCopyWith(_TrackingStep value, $Res Function(_TrackingStep) _then) = __$TrackingStepCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, String label, DateTime? reachedAt,@JsonKey(unknownEnumValue: TrackingStepState.unknown) TrackingStepState state
});




}
/// @nodoc
class __$TrackingStepCopyWithImpl<$Res>
    implements _$TrackingStepCopyWith<$Res> {
  __$TrackingStepCopyWithImpl(this._self, this._then);

  final _TrackingStep _self;
  final $Res Function(_TrackingStep) _then;

/// Create a copy of TrackingStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? label = null,Object? reachedAt = freezed,Object? state = null,}) {
  return _then(_TrackingStep(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,reachedAt: freezed == reachedAt ? _self.reachedAt : reachedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as TrackingStepState,
  ));
}


}


/// @nodoc
mixin _$TrackingContact {

 String? get name; String? get phone;
/// Create a copy of TrackingContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingContactCopyWith<TrackingContact> get copyWith => _$TrackingContactCopyWithImpl<TrackingContact>(this as TrackingContact, _$identity);

  /// Serializes this TrackingContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TrackingContact;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingContact&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TrackingContact;
  return Object.hash(runtimeType,_this.name,_this.phone);
}

@override
String toString() {
  final _this = this as TrackingContact;
  return 'TrackingContact(name: ${_this.name}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $TrackingContactCopyWith<$Res>  {
  factory $TrackingContactCopyWith(TrackingContact value, $Res Function(TrackingContact) _then) = _$TrackingContactCopyWithImpl;
@useResult
$Res call({
 String? name, String? phone
});




}
/// @nodoc
class _$TrackingContactCopyWithImpl<$Res>
    implements $TrackingContactCopyWith<$Res> {
  _$TrackingContactCopyWithImpl(this._self, this._then);

  final TrackingContact _self;
  final $Res Function(TrackingContact) _then;

/// Create a copy of TrackingContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? phone = freezed,}) {
  return _then(TrackingContact(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingContact].
extension TrackingContactPatterns on TrackingContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingContact value)  $default,){
final _that = this;
switch (_that) {
case _TrackingContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingContact value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingContact() when $default != null:
return $default(_that.name,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _TrackingContact():
return $default(_that.name,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _TrackingContact() when $default != null:
return $default(_that.name,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingContact implements TrackingContact {
  const _TrackingContact({this.name, this.phone});
  factory _TrackingContact.fromJson(Map<String, dynamic> json) => _$TrackingContactFromJson(json);

@override final  String? name;
@override final  String? phone;

/// Create a copy of TrackingContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingContactCopyWith<_TrackingContact> get copyWith => __$TrackingContactCopyWithImpl<_TrackingContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingContactToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingContact&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,phone);
}

@override
String toString() {
    return 'TrackingContact(name: $name, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$TrackingContactCopyWith<$Res> implements $TrackingContactCopyWith<$Res> {
  factory _$TrackingContactCopyWith(_TrackingContact value, $Res Function(_TrackingContact) _then) = __$TrackingContactCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? phone
});




}
/// @nodoc
class __$TrackingContactCopyWithImpl<$Res>
    implements _$TrackingContactCopyWith<$Res> {
  __$TrackingContactCopyWithImpl(this._self, this._then);

  final _TrackingContact _self;
  final $Res Function(_TrackingContact) _then;

/// Create a copy of TrackingContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? phone = freezed,}) {
  return _then(_TrackingContact(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TrackingBranch {

 String get id; String get name; String get phone;
/// Create a copy of TrackingBranch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingBranchCopyWith<TrackingBranch> get copyWith => _$TrackingBranchCopyWithImpl<TrackingBranch>(this as TrackingBranch, _$identity);

  /// Serializes this TrackingBranch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TrackingBranch;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingBranch&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TrackingBranch;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone);
}

@override
String toString() {
  final _this = this as TrackingBranch;
  return 'TrackingBranch(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $TrackingBranchCopyWith<$Res>  {
  factory $TrackingBranchCopyWith(TrackingBranch value, $Res Function(TrackingBranch) _then) = _$TrackingBranchCopyWithImpl;
@useResult
$Res call({
 String id, String name, String phone
});




}
/// @nodoc
class _$TrackingBranchCopyWithImpl<$Res>
    implements $TrackingBranchCopyWith<$Res> {
  _$TrackingBranchCopyWithImpl(this._self, this._then);

  final TrackingBranch _self;
  final $Res Function(TrackingBranch) _then;

/// Create a copy of TrackingBranch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,}) {
  return _then(TrackingBranch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingBranch].
extension TrackingBranchPatterns on TrackingBranch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingBranch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingBranch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingBranch value)  $default,){
final _that = this;
switch (_that) {
case _TrackingBranch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingBranch value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingBranch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingBranch() when $default != null:
return $default(_that.id,_that.name,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String phone)  $default,) {final _that = this;
switch (_that) {
case _TrackingBranch():
return $default(_that.id,_that.name,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String phone)?  $default,) {final _that = this;
switch (_that) {
case _TrackingBranch() when $default != null:
return $default(_that.id,_that.name,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingBranch implements TrackingBranch {
  const _TrackingBranch({required this.id, required this.name, required this.phone});
  factory _TrackingBranch.fromJson(Map<String, dynamic> json) => _$TrackingBranchFromJson(json);

@override final  String id;
@override final  String name;
@override final  String phone;

/// Create a copy of TrackingBranch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingBranchCopyWith<_TrackingBranch> get copyWith => __$TrackingBranchCopyWithImpl<_TrackingBranch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingBranchToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingBranch&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone);
}

@override
String toString() {
    return 'TrackingBranch(id: $id, name: $name, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$TrackingBranchCopyWith<$Res> implements $TrackingBranchCopyWith<$Res> {
  factory _$TrackingBranchCopyWith(_TrackingBranch value, $Res Function(_TrackingBranch) _then) = __$TrackingBranchCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String phone
});




}
/// @nodoc
class __$TrackingBranchCopyWithImpl<$Res>
    implements _$TrackingBranchCopyWith<$Res> {
  __$TrackingBranchCopyWithImpl(this._self, this._then);

  final _TrackingBranch _self;
  final $Res Function(_TrackingBranch) _then;

/// Create a copy of TrackingBranch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,}) {
  return _then(_TrackingBranch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LocationPoint {

 double get latitude; double get longitude; DateTime get recordedAt;
/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationPointCopyWith<LocationPoint> get copyWith => _$LocationPointCopyWithImpl<LocationPoint>(this as LocationPoint, _$identity);

  /// Serializes this LocationPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LocationPoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationPoint&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.recordedAt, _this.recordedAt) || other.recordedAt == _this.recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LocationPoint;
  return Object.hash(runtimeType,_this.latitude,_this.longitude,_this.recordedAt);
}

@override
String toString() {
  final _this = this as LocationPoint;
  return 'LocationPoint(latitude: ${_this.latitude}, longitude: ${_this.longitude}, recordedAt: ${_this.recordedAt})';
}


}

/// @nodoc
abstract mixin class $LocationPointCopyWith<$Res>  {
  factory $LocationPointCopyWith(LocationPoint value, $Res Function(LocationPoint) _then) = _$LocationPointCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, DateTime recordedAt
});




}
/// @nodoc
class _$LocationPointCopyWithImpl<$Res>
    implements $LocationPointCopyWith<$Res> {
  _$LocationPointCopyWithImpl(this._self, this._then);

  final LocationPoint _self;
  final $Res Function(LocationPoint) _then;

/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? recordedAt = null,}) {
  return _then(LocationPoint(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationPoint].
extension LocationPointPatterns on LocationPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationPoint value)  $default,){
final _that = this;
switch (_that) {
case _LocationPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationPoint value)?  $default,){
final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  DateTime recordedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
return $default(_that.latitude,_that.longitude,_that.recordedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  DateTime recordedAt)  $default,) {final _that = this;
switch (_that) {
case _LocationPoint():
return $default(_that.latitude,_that.longitude,_that.recordedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  DateTime recordedAt)?  $default,) {final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
return $default(_that.latitude,_that.longitude,_that.recordedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationPoint implements LocationPoint {
  const _LocationPoint({required this.latitude, required this.longitude, required this.recordedAt});
  factory _LocationPoint.fromJson(Map<String, dynamic> json) => _$LocationPointFromJson(json);

@override final  double latitude;
@override final  double longitude;
@override final  DateTime recordedAt;

/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationPointCopyWith<_LocationPoint> get copyWith => __$LocationPointCopyWithImpl<_LocationPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationPointToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationPoint&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,latitude,longitude,recordedAt);
}

@override
String toString() {
    return 'LocationPoint(latitude: $latitude, longitude: $longitude, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class _$LocationPointCopyWith<$Res> implements $LocationPointCopyWith<$Res> {
  factory _$LocationPointCopyWith(_LocationPoint value, $Res Function(_LocationPoint) _then) = __$LocationPointCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, DateTime recordedAt
});




}
/// @nodoc
class __$LocationPointCopyWithImpl<$Res>
    implements _$LocationPointCopyWith<$Res> {
  __$LocationPointCopyWithImpl(this._self, this._then);

  final _LocationPoint _self;
  final $Res Function(_LocationPoint) _then;

/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? recordedAt = null,}) {
  return _then(_LocationPoint(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$OrderTracking {

 String get orderId; String get orderNumber;@JsonKey(unknownEnumValue: OrderType.unknown) OrderType get type;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get status; List<TrackingStep> get steps; List<OrderStatusHistory> get history; DateTime? get estimatedReadyAt; TrackingContact? get rider; LocationPoint? get riderLocation; TrackingBranch get branch;
/// Create a copy of OrderTracking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderTrackingCopyWith<OrderTracking> get copyWith => _$OrderTrackingCopyWithImpl<OrderTracking>(this as OrderTracking, _$identity);

  /// Serializes this OrderTracking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderTracking;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderTracking&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.steps, _this.steps)&&const DeepCollectionEquality().equals(other.history, _this.history)&&(identical(other.estimatedReadyAt, _this.estimatedReadyAt) || other.estimatedReadyAt == _this.estimatedReadyAt)&&(identical(other.rider, _this.rider) || other.rider == _this.rider)&&(identical(other.riderLocation, _this.riderLocation) || other.riderLocation == _this.riderLocation)&&(identical(other.branch, _this.branch) || other.branch == _this.branch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderTracking;
  return Object.hash(runtimeType,_this.orderId,_this.orderNumber,_this.type,_this.status,const DeepCollectionEquality().hash(_this.steps),const DeepCollectionEquality().hash(_this.history),_this.estimatedReadyAt,_this.rider,_this.riderLocation,_this.branch);
}

@override
String toString() {
  final _this = this as OrderTracking;
  return 'OrderTracking(orderId: ${_this.orderId}, orderNumber: ${_this.orderNumber}, type: ${_this.type}, status: ${_this.status}, steps: ${_this.steps}, history: ${_this.history}, estimatedReadyAt: ${_this.estimatedReadyAt}, rider: ${_this.rider}, riderLocation: ${_this.riderLocation}, branch: ${_this.branch})';
}


}

/// @nodoc
abstract mixin class $OrderTrackingCopyWith<$Res>  {
  factory $OrderTrackingCopyWith(OrderTracking value, $Res Function(OrderTracking) _then) = _$OrderTrackingCopyWithImpl;
@useResult
$Res call({
 String orderId, String orderNumber,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType type,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, List<TrackingStep> steps, List<OrderStatusHistory> history, DateTime? estimatedReadyAt, TrackingContact? rider, LocationPoint? riderLocation, TrackingBranch branch
});


$TrackingContactCopyWith<$Res>? get rider;$LocationPointCopyWith<$Res>? get riderLocation;$TrackingBranchCopyWith<$Res> get branch;

}
/// @nodoc
class _$OrderTrackingCopyWithImpl<$Res>
    implements $OrderTrackingCopyWith<$Res> {
  _$OrderTrackingCopyWithImpl(this._self, this._then);

  final OrderTracking _self;
  final $Res Function(OrderTracking) _then;

/// Create a copy of OrderTracking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? orderNumber = null,Object? type = null,Object? status = null,Object? steps = null,Object? history = null,Object? estimatedReadyAt = freezed,Object? rider = freezed,Object? riderLocation = freezed,Object? branch = null,}) {
  return _then(OrderTracking(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<TrackingStep>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<OrderStatusHistory>,estimatedReadyAt: freezed == estimatedReadyAt ? _self.estimatedReadyAt : estimatedReadyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rider: freezed == rider ? _self.rider : rider // ignore: cast_nullable_to_non_nullable
as TrackingContact?,riderLocation: freezed == riderLocation ? _self.riderLocation : riderLocation // ignore: cast_nullable_to_non_nullable
as LocationPoint?,branch: null == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as TrackingBranch,
  ));
}
/// Create a copy of OrderTracking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackingContactCopyWith<$Res>? get rider {
    if (_self.rider == null) {
    return null;
  }

  return $TrackingContactCopyWith<$Res>(_self.rider!, (value) {
    return _then(_self.copyWith(rider: value));
  });
}/// Create a copy of OrderTracking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res>? get riderLocation {
    if (_self.riderLocation == null) {
    return null;
  }

  return $LocationPointCopyWith<$Res>(_self.riderLocation!, (value) {
    return _then(_self.copyWith(riderLocation: value));
  });
}/// Create a copy of OrderTracking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackingBranchCopyWith<$Res> get branch {
  
  return $TrackingBranchCopyWith<$Res>(_self.branch, (value) {
    return _then(_self.copyWith(branch: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderTracking].
extension OrderTrackingPatterns on OrderTracking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderTracking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderTracking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderTracking value)  $default,){
final _that = this;
switch (_that) {
case _OrderTracking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderTracking value)?  $default,){
final _that = this;
switch (_that) {
case _OrderTracking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String orderNumber, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<TrackingStep> steps,  List<OrderStatusHistory> history,  DateTime? estimatedReadyAt,  TrackingContact? rider,  LocationPoint? riderLocation,  TrackingBranch branch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderTracking() when $default != null:
return $default(_that.orderId,_that.orderNumber,_that.type,_that.status,_that.steps,_that.history,_that.estimatedReadyAt,_that.rider,_that.riderLocation,_that.branch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String orderNumber, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<TrackingStep> steps,  List<OrderStatusHistory> history,  DateTime? estimatedReadyAt,  TrackingContact? rider,  LocationPoint? riderLocation,  TrackingBranch branch)  $default,) {final _that = this;
switch (_that) {
case _OrderTracking():
return $default(_that.orderId,_that.orderNumber,_that.type,_that.status,_that.steps,_that.history,_that.estimatedReadyAt,_that.rider,_that.riderLocation,_that.branch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String orderNumber, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<TrackingStep> steps,  List<OrderStatusHistory> history,  DateTime? estimatedReadyAt,  TrackingContact? rider,  LocationPoint? riderLocation,  TrackingBranch branch)?  $default,) {final _that = this;
switch (_that) {
case _OrderTracking() when $default != null:
return $default(_that.orderId,_that.orderNumber,_that.type,_that.status,_that.steps,_that.history,_that.estimatedReadyAt,_that.rider,_that.riderLocation,_that.branch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderTracking implements OrderTracking {
  const _OrderTracking({required this.orderId, required this.orderNumber, @JsonKey(unknownEnumValue: OrderType.unknown) required this.type, @JsonKey(unknownEnumValue: OrderStatus.unknown) required this.status,  List<TrackingStep> steps = const [],  List<OrderStatusHistory> history = const [], this.estimatedReadyAt, this.rider, this.riderLocation, required this.branch}): _steps = steps,_history = history;
  factory _OrderTracking.fromJson(Map<String, dynamic> json) => _$OrderTrackingFromJson(json);

@override final  String orderId;
@override final  String orderNumber;
@override@JsonKey(unknownEnumValue: OrderType.unknown) final  OrderType type;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus status;
 final  List<TrackingStep> _steps;
@override@JsonKey() List<TrackingStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

 final  List<OrderStatusHistory> _history;
@override@JsonKey() List<OrderStatusHistory> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override final  DateTime? estimatedReadyAt;
@override final  TrackingContact? rider;
@override final  LocationPoint? riderLocation;
@override final  TrackingBranch branch;

/// Create a copy of OrderTracking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderTrackingCopyWith<_OrderTracking> get copyWith => __$OrderTrackingCopyWithImpl<_OrderTracking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderTrackingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderTracking&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.steps, _steps)&&const DeepCollectionEquality().equals(other.history, _history)&&(identical(other.estimatedReadyAt, estimatedReadyAt) || other.estimatedReadyAt == estimatedReadyAt)&&(identical(other.rider, rider) || other.rider == rider)&&(identical(other.riderLocation, riderLocation) || other.riderLocation == riderLocation)&&(identical(other.branch, branch) || other.branch == branch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,orderId,orderNumber,type,status,const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_history),estimatedReadyAt,rider,riderLocation,branch);
}

@override
String toString() {
    return 'OrderTracking(orderId: $orderId, orderNumber: $orderNumber, type: $type, status: $status, steps: $steps, history: $history, estimatedReadyAt: $estimatedReadyAt, rider: $rider, riderLocation: $riderLocation, branch: $branch)';
}


}

/// @nodoc
abstract mixin class _$OrderTrackingCopyWith<$Res> implements $OrderTrackingCopyWith<$Res> {
  factory _$OrderTrackingCopyWith(_OrderTracking value, $Res Function(_OrderTracking) _then) = __$OrderTrackingCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String orderNumber,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType type,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, List<TrackingStep> steps, List<OrderStatusHistory> history, DateTime? estimatedReadyAt, TrackingContact? rider, LocationPoint? riderLocation, TrackingBranch branch
});


@override $TrackingContactCopyWith<$Res>? get rider;@override $LocationPointCopyWith<$Res>? get riderLocation;@override $TrackingBranchCopyWith<$Res> get branch;

}
/// @nodoc
class __$OrderTrackingCopyWithImpl<$Res>
    implements _$OrderTrackingCopyWith<$Res> {
  __$OrderTrackingCopyWithImpl(this._self, this._then);

  final _OrderTracking _self;
  final $Res Function(_OrderTracking) _then;

/// Create a copy of OrderTracking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? orderNumber = null,Object? type = null,Object? status = null,Object? steps = null,Object? history = null,Object? estimatedReadyAt = freezed,Object? rider = freezed,Object? riderLocation = freezed,Object? branch = null,}) {
  return _then(_OrderTracking(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<TrackingStep>,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<OrderStatusHistory>,estimatedReadyAt: freezed == estimatedReadyAt ? _self.estimatedReadyAt : estimatedReadyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rider: freezed == rider ? _self.rider : rider // ignore: cast_nullable_to_non_nullable
as TrackingContact?,riderLocation: freezed == riderLocation ? _self.riderLocation : riderLocation // ignore: cast_nullable_to_non_nullable
as LocationPoint?,branch: null == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as TrackingBranch,
  ));
}

/// Create a copy of OrderTracking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackingContactCopyWith<$Res>? get rider {
    if (_self.rider == null) {
    return null;
  }

  return $TrackingContactCopyWith<$Res>(_self.rider!, (value) {
    return _then(_self.copyWith(rider: value));
  });
}/// Create a copy of OrderTracking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res>? get riderLocation {
    if (_self.riderLocation == null) {
    return null;
  }

  return $LocationPointCopyWith<$Res>(_self.riderLocation!, (value) {
    return _then(_self.copyWith(riderLocation: value));
  });
}/// Create a copy of OrderTracking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackingBranchCopyWith<$Res> get branch {
  
  return $TrackingBranchCopyWith<$Res>(_self.branch, (value) {
    return _then(_self.copyWith(branch: value));
  });
}
}


/// @nodoc
mixin _$PublicOrderStatus {

 Order get order; OrderTracking get tracking;
/// Create a copy of PublicOrderStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicOrderStatusCopyWith<PublicOrderStatus> get copyWith => _$PublicOrderStatusCopyWithImpl<PublicOrderStatus>(this as PublicOrderStatus, _$identity);

  /// Serializes this PublicOrderStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PublicOrderStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicOrderStatus&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.tracking, _this.tracking) || other.tracking == _this.tracking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PublicOrderStatus;
  return Object.hash(runtimeType,_this.order,_this.tracking);
}

@override
String toString() {
  final _this = this as PublicOrderStatus;
  return 'PublicOrderStatus(order: ${_this.order}, tracking: ${_this.tracking})';
}


}

/// @nodoc
abstract mixin class $PublicOrderStatusCopyWith<$Res>  {
  factory $PublicOrderStatusCopyWith(PublicOrderStatus value, $Res Function(PublicOrderStatus) _then) = _$PublicOrderStatusCopyWithImpl;
@useResult
$Res call({
 Order order, OrderTracking tracking
});


$OrderCopyWith<$Res> get order;$OrderTrackingCopyWith<$Res> get tracking;

}
/// @nodoc
class _$PublicOrderStatusCopyWithImpl<$Res>
    implements $PublicOrderStatusCopyWith<$Res> {
  _$PublicOrderStatusCopyWithImpl(this._self, this._then);

  final PublicOrderStatus _self;
  final $Res Function(PublicOrderStatus) _then;

/// Create a copy of PublicOrderStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? tracking = null,}) {
  return _then(PublicOrderStatus(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,tracking: null == tracking ? _self.tracking : tracking // ignore: cast_nullable_to_non_nullable
as OrderTracking,
  ));
}
/// Create a copy of PublicOrderStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}/// Create a copy of PublicOrderStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTrackingCopyWith<$Res> get tracking {
  
  return $OrderTrackingCopyWith<$Res>(_self.tracking, (value) {
    return _then(_self.copyWith(tracking: value));
  });
}
}


/// Adds pattern-matching-related methods to [PublicOrderStatus].
extension PublicOrderStatusPatterns on PublicOrderStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicOrderStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicOrderStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicOrderStatus value)  $default,){
final _that = this;
switch (_that) {
case _PublicOrderStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicOrderStatus value)?  $default,){
final _that = this;
switch (_that) {
case _PublicOrderStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Order order,  OrderTracking tracking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicOrderStatus() when $default != null:
return $default(_that.order,_that.tracking);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Order order,  OrderTracking tracking)  $default,) {final _that = this;
switch (_that) {
case _PublicOrderStatus():
return $default(_that.order,_that.tracking);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Order order,  OrderTracking tracking)?  $default,) {final _that = this;
switch (_that) {
case _PublicOrderStatus() when $default != null:
return $default(_that.order,_that.tracking);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublicOrderStatus implements PublicOrderStatus {
  const _PublicOrderStatus({required this.order, required this.tracking});
  factory _PublicOrderStatus.fromJson(Map<String, dynamic> json) => _$PublicOrderStatusFromJson(json);

@override final  Order order;
@override final  OrderTracking tracking;

/// Create a copy of PublicOrderStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicOrderStatusCopyWith<_PublicOrderStatus> get copyWith => __$PublicOrderStatusCopyWithImpl<_PublicOrderStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicOrderStatusToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicOrderStatus&&(identical(other.order, order) || other.order == order)&&(identical(other.tracking, tracking) || other.tracking == tracking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,order,tracking);
}

@override
String toString() {
    return 'PublicOrderStatus(order: $order, tracking: $tracking)';
}


}

/// @nodoc
abstract mixin class _$PublicOrderStatusCopyWith<$Res> implements $PublicOrderStatusCopyWith<$Res> {
  factory _$PublicOrderStatusCopyWith(_PublicOrderStatus value, $Res Function(_PublicOrderStatus) _then) = __$PublicOrderStatusCopyWithImpl;
@override @useResult
$Res call({
 Order order, OrderTracking tracking
});


@override $OrderCopyWith<$Res> get order;@override $OrderTrackingCopyWith<$Res> get tracking;

}
/// @nodoc
class __$PublicOrderStatusCopyWithImpl<$Res>
    implements _$PublicOrderStatusCopyWith<$Res> {
  __$PublicOrderStatusCopyWithImpl(this._self, this._then);

  final _PublicOrderStatus _self;
  final $Res Function(_PublicOrderStatus) _then;

/// Create a copy of PublicOrderStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? tracking = null,}) {
  return _then(_PublicOrderStatus(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,tracking: null == tracking ? _self.tracking : tracking // ignore: cast_nullable_to_non_nullable
as OrderTracking,
  ));
}

/// Create a copy of PublicOrderStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}/// Create a copy of PublicOrderStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTrackingCopyWith<$Res> get tracking {
  
  return $OrderTrackingCopyWith<$Res>(_self.tracking, (value) {
    return _then(_self.copyWith(tracking: value));
  });
}
}


/// @nodoc
mixin _$PaymentAction {

 String get type; String get url;
/// Create a copy of PaymentAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentActionCopyWith<PaymentAction> get copyWith => _$PaymentActionCopyWithImpl<PaymentAction>(this as PaymentAction, _$identity);

  /// Serializes this PaymentAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PaymentAction;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentAction&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.url, _this.url) || other.url == _this.url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PaymentAction;
  return Object.hash(runtimeType,_this.type,_this.url);
}

@override
String toString() {
  final _this = this as PaymentAction;
  return 'PaymentAction(type: ${_this.type}, url: ${_this.url})';
}


}

/// @nodoc
abstract mixin class $PaymentActionCopyWith<$Res>  {
  factory $PaymentActionCopyWith(PaymentAction value, $Res Function(PaymentAction) _then) = _$PaymentActionCopyWithImpl;
@useResult
$Res call({
 String type, String url
});




}
/// @nodoc
class _$PaymentActionCopyWithImpl<$Res>
    implements $PaymentActionCopyWith<$Res> {
  _$PaymentActionCopyWithImpl(this._self, this._then);

  final PaymentAction _self;
  final $Res Function(PaymentAction) _then;

/// Create a copy of PaymentAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? url = null,}) {
  return _then(PaymentAction(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentAction].
extension PaymentActionPatterns on PaymentAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentAction value)  $default,){
final _that = this;
switch (_that) {
case _PaymentAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentAction value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentAction() when $default != null:
return $default(_that.type,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String url)  $default,) {final _that = this;
switch (_that) {
case _PaymentAction():
return $default(_that.type,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String url)?  $default,) {final _that = this;
switch (_that) {
case _PaymentAction() when $default != null:
return $default(_that.type,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentAction implements PaymentAction {
  const _PaymentAction({required this.type, required this.url});
  factory _PaymentAction.fromJson(Map<String, dynamic> json) => _$PaymentActionFromJson(json);

@override final  String type;
@override final  String url;

/// Create a copy of PaymentAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentActionCopyWith<_PaymentAction> get copyWith => __$PaymentActionCopyWithImpl<_PaymentAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentActionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentAction&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,url);
}

@override
String toString() {
    return 'PaymentAction(type: $type, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PaymentActionCopyWith<$Res> implements $PaymentActionCopyWith<$Res> {
  factory _$PaymentActionCopyWith(_PaymentAction value, $Res Function(_PaymentAction) _then) = __$PaymentActionCopyWithImpl;
@override @useResult
$Res call({
 String type, String url
});




}
/// @nodoc
class __$PaymentActionCopyWithImpl<$Res>
    implements _$PaymentActionCopyWith<$Res> {
  __$PaymentActionCopyWithImpl(this._self, this._then);

  final _PaymentAction _self;
  final $Res Function(_PaymentAction) _then;

/// Create a copy of PaymentAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? url = null,}) {
  return _then(_PaymentAction(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreateOrderResult {

 Order get order; PaymentAction? get paymentAction; int? get changeDue; String? get trackingToken;
/// Create a copy of CreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderResultCopyWith<CreateOrderResult> get copyWith => _$CreateOrderResultCopyWithImpl<CreateOrderResult>(this as CreateOrderResult, _$identity);

  /// Serializes this CreateOrderResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CreateOrderResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderResult&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.paymentAction, _this.paymentAction) || other.paymentAction == _this.paymentAction)&&(identical(other.changeDue, _this.changeDue) || other.changeDue == _this.changeDue)&&(identical(other.trackingToken, _this.trackingToken) || other.trackingToken == _this.trackingToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CreateOrderResult;
  return Object.hash(runtimeType,_this.order,_this.paymentAction,_this.changeDue,_this.trackingToken);
}

@override
String toString() {
  final _this = this as CreateOrderResult;
  return 'CreateOrderResult(order: ${_this.order}, paymentAction: ${_this.paymentAction}, changeDue: ${_this.changeDue}, trackingToken: ${_this.trackingToken})';
}


}

/// @nodoc
abstract mixin class $CreateOrderResultCopyWith<$Res>  {
  factory $CreateOrderResultCopyWith(CreateOrderResult value, $Res Function(CreateOrderResult) _then) = _$CreateOrderResultCopyWithImpl;
@useResult
$Res call({
 Order order, PaymentAction? paymentAction, int? changeDue, String? trackingToken
});


$OrderCopyWith<$Res> get order;$PaymentActionCopyWith<$Res>? get paymentAction;

}
/// @nodoc
class _$CreateOrderResultCopyWithImpl<$Res>
    implements $CreateOrderResultCopyWith<$Res> {
  _$CreateOrderResultCopyWithImpl(this._self, this._then);

  final CreateOrderResult _self;
  final $Res Function(CreateOrderResult) _then;

/// Create a copy of CreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? paymentAction = freezed,Object? changeDue = freezed,Object? trackingToken = freezed,}) {
  return _then(CreateOrderResult(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,paymentAction: freezed == paymentAction ? _self.paymentAction : paymentAction // ignore: cast_nullable_to_non_nullable
as PaymentAction?,changeDue: freezed == changeDue ? _self.changeDue : changeDue // ignore: cast_nullable_to_non_nullable
as int?,trackingToken: freezed == trackingToken ? _self.trackingToken : trackingToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}/// Create a copy of CreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentActionCopyWith<$Res>? get paymentAction {
    if (_self.paymentAction == null) {
    return null;
  }

  return $PaymentActionCopyWith<$Res>(_self.paymentAction!, (value) {
    return _then(_self.copyWith(paymentAction: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateOrderResult].
extension CreateOrderResultPatterns on CreateOrderResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderResult value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderResult value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Order order,  PaymentAction? paymentAction,  int? changeDue,  String? trackingToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderResult() when $default != null:
return $default(_that.order,_that.paymentAction,_that.changeDue,_that.trackingToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Order order,  PaymentAction? paymentAction,  int? changeDue,  String? trackingToken)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderResult():
return $default(_that.order,_that.paymentAction,_that.changeDue,_that.trackingToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Order order,  PaymentAction? paymentAction,  int? changeDue,  String? trackingToken)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderResult() when $default != null:
return $default(_that.order,_that.paymentAction,_that.changeDue,_that.trackingToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderResult implements CreateOrderResult {
  const _CreateOrderResult({required this.order, this.paymentAction, this.changeDue, this.trackingToken});
  factory _CreateOrderResult.fromJson(Map<String, dynamic> json) => _$CreateOrderResultFromJson(json);

@override final  Order order;
@override final  PaymentAction? paymentAction;
@override final  int? changeDue;
@override final  String? trackingToken;

/// Create a copy of CreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderResultCopyWith<_CreateOrderResult> get copyWith => __$CreateOrderResultCopyWithImpl<_CreateOrderResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderResult&&(identical(other.order, order) || other.order == order)&&(identical(other.paymentAction, paymentAction) || other.paymentAction == paymentAction)&&(identical(other.changeDue, changeDue) || other.changeDue == changeDue)&&(identical(other.trackingToken, trackingToken) || other.trackingToken == trackingToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,order,paymentAction,changeDue,trackingToken);
}

@override
String toString() {
    return 'CreateOrderResult(order: $order, paymentAction: $paymentAction, changeDue: $changeDue, trackingToken: $trackingToken)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderResultCopyWith<$Res> implements $CreateOrderResultCopyWith<$Res> {
  factory _$CreateOrderResultCopyWith(_CreateOrderResult value, $Res Function(_CreateOrderResult) _then) = __$CreateOrderResultCopyWithImpl;
@override @useResult
$Res call({
 Order order, PaymentAction? paymentAction, int? changeDue, String? trackingToken
});


@override $OrderCopyWith<$Res> get order;@override $PaymentActionCopyWith<$Res>? get paymentAction;

}
/// @nodoc
class __$CreateOrderResultCopyWithImpl<$Res>
    implements _$CreateOrderResultCopyWith<$Res> {
  __$CreateOrderResultCopyWithImpl(this._self, this._then);

  final _CreateOrderResult _self;
  final $Res Function(_CreateOrderResult) _then;

/// Create a copy of CreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? paymentAction = freezed,Object? changeDue = freezed,Object? trackingToken = freezed,}) {
  return _then(_CreateOrderResult(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,paymentAction: freezed == paymentAction ? _self.paymentAction : paymentAction // ignore: cast_nullable_to_non_nullable
as PaymentAction?,changeDue: freezed == changeDue ? _self.changeDue : changeDue // ignore: cast_nullable_to_non_nullable
as int?,trackingToken: freezed == trackingToken ? _self.trackingToken : trackingToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}/// Create a copy of CreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentActionCopyWith<$Res>? get paymentAction {
    if (_self.paymentAction == null) {
    return null;
  }

  return $PaymentActionCopyWith<$Res>(_self.paymentAction!, (value) {
    return _then(_self.copyWith(paymentAction: value));
  });
}
}

// dart format on
