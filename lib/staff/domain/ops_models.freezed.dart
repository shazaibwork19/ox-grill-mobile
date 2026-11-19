// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ops_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KitchenTicketItem {

 String get name; int get quantity; String? get notes; List<String> get options;
/// Create a copy of KitchenTicketItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KitchenTicketItemCopyWith<KitchenTicketItem> get copyWith => _$KitchenTicketItemCopyWithImpl<KitchenTicketItem>(this as KitchenTicketItem, _$identity);

  /// Serializes this KitchenTicketItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as KitchenTicketItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KitchenTicketItem&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.options, _this.options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as KitchenTicketItem;
  return Object.hash(runtimeType,_this.name,_this.quantity,_this.notes,const DeepCollectionEquality().hash(_this.options));
}

@override
String toString() {
  final _this = this as KitchenTicketItem;
  return 'KitchenTicketItem(name: ${_this.name}, quantity: ${_this.quantity}, notes: ${_this.notes}, options: ${_this.options})';
}


}

/// @nodoc
abstract mixin class $KitchenTicketItemCopyWith<$Res>  {
  factory $KitchenTicketItemCopyWith(KitchenTicketItem value, $Res Function(KitchenTicketItem) _then) = _$KitchenTicketItemCopyWithImpl;
@useResult
$Res call({
 String name, int quantity, String? notes, List<String> options
});




}
/// @nodoc
class _$KitchenTicketItemCopyWithImpl<$Res>
    implements $KitchenTicketItemCopyWith<$Res> {
  _$KitchenTicketItemCopyWithImpl(this._self, this._then);

  final KitchenTicketItem _self;
  final $Res Function(KitchenTicketItem) _then;

/// Create a copy of KitchenTicketItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? quantity = null,Object? notes = freezed,Object? options = null,}) {
  return _then(KitchenTicketItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [KitchenTicketItem].
extension KitchenTicketItemPatterns on KitchenTicketItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KitchenTicketItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KitchenTicketItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KitchenTicketItem value)  $default,){
final _that = this;
switch (_that) {
case _KitchenTicketItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KitchenTicketItem value)?  $default,){
final _that = this;
switch (_that) {
case _KitchenTicketItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int quantity,  String? notes,  List<String> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KitchenTicketItem() when $default != null:
return $default(_that.name,_that.quantity,_that.notes,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int quantity,  String? notes,  List<String> options)  $default,) {final _that = this;
switch (_that) {
case _KitchenTicketItem():
return $default(_that.name,_that.quantity,_that.notes,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int quantity,  String? notes,  List<String> options)?  $default,) {final _that = this;
switch (_that) {
case _KitchenTicketItem() when $default != null:
return $default(_that.name,_that.quantity,_that.notes,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KitchenTicketItem implements KitchenTicketItem {
  const _KitchenTicketItem({required this.name, required this.quantity, this.notes,  List<String> options = const []}): _options = options;
  factory _KitchenTicketItem.fromJson(Map<String, dynamic> json) => _$KitchenTicketItemFromJson(json);

@override final  String name;
@override final  int quantity;
@override final  String? notes;
 final  List<String> _options;
@override@JsonKey() List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of KitchenTicketItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KitchenTicketItemCopyWith<_KitchenTicketItem> get copyWith => __$KitchenTicketItemCopyWithImpl<_KitchenTicketItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KitchenTicketItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _KitchenTicketItem&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,quantity,notes,const DeepCollectionEquality().hash(_options));
}

@override
String toString() {
    return 'KitchenTicketItem(name: $name, quantity: $quantity, notes: $notes, options: $options)';
}


}

/// @nodoc
abstract mixin class _$KitchenTicketItemCopyWith<$Res> implements $KitchenTicketItemCopyWith<$Res> {
  factory _$KitchenTicketItemCopyWith(_KitchenTicketItem value, $Res Function(_KitchenTicketItem) _then) = __$KitchenTicketItemCopyWithImpl;
@override @useResult
$Res call({
 String name, int quantity, String? notes, List<String> options
});




}
/// @nodoc
class __$KitchenTicketItemCopyWithImpl<$Res>
    implements _$KitchenTicketItemCopyWith<$Res> {
  __$KitchenTicketItemCopyWithImpl(this._self, this._then);

  final _KitchenTicketItem _self;
  final $Res Function(_KitchenTicketItem) _then;

/// Create a copy of KitchenTicketItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? quantity = null,Object? notes = freezed,Object? options = null,}) {
  return _then(_KitchenTicketItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$KitchenTicket {

 String get id; String get orderNumber; String get branchId;@JsonKey(unknownEnumValue: OrderType.unknown) OrderType get type;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get status; String? get tableRef; String? get pickupName; String? get customerName; String? get notes; List<KitchenTicketItem> get items; DateTime get placedAt; DateTime? get confirmedAt; DateTime? get preparingAt; DateTime? get readyAt;
/// Create a copy of KitchenTicket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KitchenTicketCopyWith<KitchenTicket> get copyWith => _$KitchenTicketCopyWithImpl<KitchenTicket>(this as KitchenTicket, _$identity);

  /// Serializes this KitchenTicket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as KitchenTicket;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KitchenTicket&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.tableRef, _this.tableRef) || other.tableRef == _this.tableRef)&&(identical(other.pickupName, _this.pickupName) || other.pickupName == _this.pickupName)&&(identical(other.customerName, _this.customerName) || other.customerName == _this.customerName)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.placedAt, _this.placedAt) || other.placedAt == _this.placedAt)&&(identical(other.confirmedAt, _this.confirmedAt) || other.confirmedAt == _this.confirmedAt)&&(identical(other.preparingAt, _this.preparingAt) || other.preparingAt == _this.preparingAt)&&(identical(other.readyAt, _this.readyAt) || other.readyAt == _this.readyAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as KitchenTicket;
  return Object.hash(runtimeType,_this.id,_this.orderNumber,_this.branchId,_this.type,_this.status,_this.tableRef,_this.pickupName,_this.customerName,_this.notes,const DeepCollectionEquality().hash(_this.items),_this.placedAt,_this.confirmedAt,_this.preparingAt,_this.readyAt);
}

@override
String toString() {
  final _this = this as KitchenTicket;
  return 'KitchenTicket(id: ${_this.id}, orderNumber: ${_this.orderNumber}, branchId: ${_this.branchId}, type: ${_this.type}, status: ${_this.status}, tableRef: ${_this.tableRef}, pickupName: ${_this.pickupName}, customerName: ${_this.customerName}, notes: ${_this.notes}, items: ${_this.items}, placedAt: ${_this.placedAt}, confirmedAt: ${_this.confirmedAt}, preparingAt: ${_this.preparingAt}, readyAt: ${_this.readyAt})';
}


}

/// @nodoc
abstract mixin class $KitchenTicketCopyWith<$Res>  {
  factory $KitchenTicketCopyWith(KitchenTicket value, $Res Function(KitchenTicket) _then) = _$KitchenTicketCopyWithImpl;
@useResult
$Res call({
 String id, String orderNumber, String branchId,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType type,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, String? tableRef, String? pickupName, String? customerName, String? notes, List<KitchenTicketItem> items, DateTime placedAt, DateTime? confirmedAt, DateTime? preparingAt, DateTime? readyAt
});




}
/// @nodoc
class _$KitchenTicketCopyWithImpl<$Res>
    implements $KitchenTicketCopyWith<$Res> {
  _$KitchenTicketCopyWithImpl(this._self, this._then);

  final KitchenTicket _self;
  final $Res Function(KitchenTicket) _then;

/// Create a copy of KitchenTicket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? branchId = null,Object? type = null,Object? status = null,Object? tableRef = freezed,Object? pickupName = freezed,Object? customerName = freezed,Object? notes = freezed,Object? items = null,Object? placedAt = null,Object? confirmedAt = freezed,Object? preparingAt = freezed,Object? readyAt = freezed,}) {
  return _then(KitchenTicket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,tableRef: freezed == tableRef ? _self.tableRef : tableRef // ignore: cast_nullable_to_non_nullable
as String?,pickupName: freezed == pickupName ? _self.pickupName : pickupName // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<KitchenTicketItem>,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,preparingAt: freezed == preparingAt ? _self.preparingAt : preparingAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readyAt: freezed == readyAt ? _self.readyAt : readyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [KitchenTicket].
extension KitchenTicketPatterns on KitchenTicket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KitchenTicket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KitchenTicket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KitchenTicket value)  $default,){
final _that = this;
switch (_that) {
case _KitchenTicket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KitchenTicket value)?  $default,){
final _that = this;
switch (_that) {
case _KitchenTicket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderNumber,  String branchId, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String? tableRef,  String? pickupName,  String? customerName,  String? notes,  List<KitchenTicketItem> items,  DateTime placedAt,  DateTime? confirmedAt,  DateTime? preparingAt,  DateTime? readyAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KitchenTicket() when $default != null:
return $default(_that.id,_that.orderNumber,_that.branchId,_that.type,_that.status,_that.tableRef,_that.pickupName,_that.customerName,_that.notes,_that.items,_that.placedAt,_that.confirmedAt,_that.preparingAt,_that.readyAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderNumber,  String branchId, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String? tableRef,  String? pickupName,  String? customerName,  String? notes,  List<KitchenTicketItem> items,  DateTime placedAt,  DateTime? confirmedAt,  DateTime? preparingAt,  DateTime? readyAt)  $default,) {final _that = this;
switch (_that) {
case _KitchenTicket():
return $default(_that.id,_that.orderNumber,_that.branchId,_that.type,_that.status,_that.tableRef,_that.pickupName,_that.customerName,_that.notes,_that.items,_that.placedAt,_that.confirmedAt,_that.preparingAt,_that.readyAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderNumber,  String branchId, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  String? tableRef,  String? pickupName,  String? customerName,  String? notes,  List<KitchenTicketItem> items,  DateTime placedAt,  DateTime? confirmedAt,  DateTime? preparingAt,  DateTime? readyAt)?  $default,) {final _that = this;
switch (_that) {
case _KitchenTicket() when $default != null:
return $default(_that.id,_that.orderNumber,_that.branchId,_that.type,_that.status,_that.tableRef,_that.pickupName,_that.customerName,_that.notes,_that.items,_that.placedAt,_that.confirmedAt,_that.preparingAt,_that.readyAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KitchenTicket implements KitchenTicket {
  const _KitchenTicket({required this.id, required this.orderNumber, required this.branchId, @JsonKey(unknownEnumValue: OrderType.unknown) required this.type, @JsonKey(unknownEnumValue: OrderStatus.unknown) required this.status, this.tableRef, this.pickupName, this.customerName, this.notes,  List<KitchenTicketItem> items = const [], required this.placedAt, this.confirmedAt, this.preparingAt, this.readyAt}): _items = items;
  factory _KitchenTicket.fromJson(Map<String, dynamic> json) => _$KitchenTicketFromJson(json);

@override final  String id;
@override final  String orderNumber;
@override final  String branchId;
@override@JsonKey(unknownEnumValue: OrderType.unknown) final  OrderType type;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus status;
@override final  String? tableRef;
@override final  String? pickupName;
@override final  String? customerName;
@override final  String? notes;
 final  List<KitchenTicketItem> _items;
@override@JsonKey() List<KitchenTicketItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime placedAt;
@override final  DateTime? confirmedAt;
@override final  DateTime? preparingAt;
@override final  DateTime? readyAt;

/// Create a copy of KitchenTicket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KitchenTicketCopyWith<_KitchenTicket> get copyWith => __$KitchenTicketCopyWithImpl<_KitchenTicket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KitchenTicketToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _KitchenTicket&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.tableRef, tableRef) || other.tableRef == tableRef)&&(identical(other.pickupName, pickupName) || other.pickupName == pickupName)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.preparingAt, preparingAt) || other.preparingAt == preparingAt)&&(identical(other.readyAt, readyAt) || other.readyAt == readyAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orderNumber,branchId,type,status,tableRef,pickupName,customerName,notes,const DeepCollectionEquality().hash(_items),placedAt,confirmedAt,preparingAt,readyAt);
}

@override
String toString() {
    return 'KitchenTicket(id: $id, orderNumber: $orderNumber, branchId: $branchId, type: $type, status: $status, tableRef: $tableRef, pickupName: $pickupName, customerName: $customerName, notes: $notes, items: $items, placedAt: $placedAt, confirmedAt: $confirmedAt, preparingAt: $preparingAt, readyAt: $readyAt)';
}


}

/// @nodoc
abstract mixin class _$KitchenTicketCopyWith<$Res> implements $KitchenTicketCopyWith<$Res> {
  factory _$KitchenTicketCopyWith(_KitchenTicket value, $Res Function(_KitchenTicket) _then) = __$KitchenTicketCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderNumber, String branchId,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType type,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, String? tableRef, String? pickupName, String? customerName, String? notes, List<KitchenTicketItem> items, DateTime placedAt, DateTime? confirmedAt, DateTime? preparingAt, DateTime? readyAt
});




}
/// @nodoc
class __$KitchenTicketCopyWithImpl<$Res>
    implements _$KitchenTicketCopyWith<$Res> {
  __$KitchenTicketCopyWithImpl(this._self, this._then);

  final _KitchenTicket _self;
  final $Res Function(_KitchenTicket) _then;

/// Create a copy of KitchenTicket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? branchId = null,Object? type = null,Object? status = null,Object? tableRef = freezed,Object? pickupName = freezed,Object? customerName = freezed,Object? notes = freezed,Object? items = null,Object? placedAt = null,Object? confirmedAt = freezed,Object? preparingAt = freezed,Object? readyAt = freezed,}) {
  return _then(_KitchenTicket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,tableRef: freezed == tableRef ? _self.tableRef : tableRef // ignore: cast_nullable_to_non_nullable
as String?,pickupName: freezed == pickupName ? _self.pickupName : pickupName // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<KitchenTicketItem>,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,preparingAt: freezed == preparingAt ? _self.preparingAt : preparingAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readyAt: freezed == readyAt ? _self.readyAt : readyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DeliveryAssignment {

 String get id; String get orderId; String get orderNumber; String get branchId; String get branchName; String get branchAddress;@JsonKey(unknownEnumValue: AssignmentStatus.unknown) AssignmentStatus get status; String? get customerName; String? get customerPhone; DeliveryInfo? get delivery; List<OrderItem> get items; int get total;@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod get paymentMethod; int get amountToCollect;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get orderStatus; DateTime get assignedAt; DateTime? get acceptedAt; DateTime? get pickedUpAt; DateTime? get deliveredAt;
/// Create a copy of DeliveryAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryAssignmentCopyWith<DeliveryAssignment> get copyWith => _$DeliveryAssignmentCopyWithImpl<DeliveryAssignment>(this as DeliveryAssignment, _$identity);

  /// Serializes this DeliveryAssignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DeliveryAssignment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAssignment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.branchAddress, _this.branchAddress) || other.branchAddress == _this.branchAddress)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.customerName, _this.customerName) || other.customerName == _this.customerName)&&(identical(other.customerPhone, _this.customerPhone) || other.customerPhone == _this.customerPhone)&&(identical(other.delivery, _this.delivery) || other.delivery == _this.delivery)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.paymentMethod, _this.paymentMethod) || other.paymentMethod == _this.paymentMethod)&&(identical(other.amountToCollect, _this.amountToCollect) || other.amountToCollect == _this.amountToCollect)&&(identical(other.orderStatus, _this.orderStatus) || other.orderStatus == _this.orderStatus)&&(identical(other.assignedAt, _this.assignedAt) || other.assignedAt == _this.assignedAt)&&(identical(other.acceptedAt, _this.acceptedAt) || other.acceptedAt == _this.acceptedAt)&&(identical(other.pickedUpAt, _this.pickedUpAt) || other.pickedUpAt == _this.pickedUpAt)&&(identical(other.deliveredAt, _this.deliveredAt) || other.deliveredAt == _this.deliveredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DeliveryAssignment;
  return Object.hashAll([runtimeType,_this.id,_this.orderId,_this.orderNumber,_this.branchId,_this.branchName,_this.branchAddress,_this.status,_this.customerName,_this.customerPhone,_this.delivery,const DeepCollectionEquality().hash(_this.items),_this.total,_this.paymentMethod,_this.amountToCollect,_this.orderStatus,_this.assignedAt,_this.acceptedAt,_this.pickedUpAt,_this.deliveredAt]);
}

@override
String toString() {
  final _this = this as DeliveryAssignment;
  return 'DeliveryAssignment(id: ${_this.id}, orderId: ${_this.orderId}, orderNumber: ${_this.orderNumber}, branchId: ${_this.branchId}, branchName: ${_this.branchName}, branchAddress: ${_this.branchAddress}, status: ${_this.status}, customerName: ${_this.customerName}, customerPhone: ${_this.customerPhone}, delivery: ${_this.delivery}, items: ${_this.items}, total: ${_this.total}, paymentMethod: ${_this.paymentMethod}, amountToCollect: ${_this.amountToCollect}, orderStatus: ${_this.orderStatus}, assignedAt: ${_this.assignedAt}, acceptedAt: ${_this.acceptedAt}, pickedUpAt: ${_this.pickedUpAt}, deliveredAt: ${_this.deliveredAt})';
}


}

/// @nodoc
abstract mixin class $DeliveryAssignmentCopyWith<$Res>  {
  factory $DeliveryAssignmentCopyWith(DeliveryAssignment value, $Res Function(DeliveryAssignment) _then) = _$DeliveryAssignmentCopyWithImpl;
@useResult
$Res call({
 String id, String orderId, String orderNumber, String branchId, String branchName, String branchAddress,@JsonKey(unknownEnumValue: AssignmentStatus.unknown) AssignmentStatus status, String? customerName, String? customerPhone, DeliveryInfo? delivery, List<OrderItem> items, int total,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod paymentMethod, int amountToCollect,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus orderStatus, DateTime assignedAt, DateTime? acceptedAt, DateTime? pickedUpAt, DateTime? deliveredAt
});


$DeliveryInfoCopyWith<$Res>? get delivery;

}
/// @nodoc
class _$DeliveryAssignmentCopyWithImpl<$Res>
    implements $DeliveryAssignmentCopyWith<$Res> {
  _$DeliveryAssignmentCopyWithImpl(this._self, this._then);

  final DeliveryAssignment _self;
  final $Res Function(DeliveryAssignment) _then;

/// Create a copy of DeliveryAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? orderNumber = null,Object? branchId = null,Object? branchName = null,Object? branchAddress = null,Object? status = null,Object? customerName = freezed,Object? customerPhone = freezed,Object? delivery = freezed,Object? items = null,Object? total = null,Object? paymentMethod = null,Object? amountToCollect = null,Object? orderStatus = null,Object? assignedAt = null,Object? acceptedAt = freezed,Object? pickedUpAt = freezed,Object? deliveredAt = freezed,}) {
  return _then(DeliveryAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,branchAddress: null == branchAddress ? _self.branchAddress : branchAddress // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AssignmentStatus,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as DeliveryInfo?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,amountToCollect: null == amountToCollect ? _self.amountToCollect : amountToCollect // ignore: cast_nullable_to_non_nullable
as int,orderStatus: null == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as OrderStatus,assignedAt: null == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pickedUpAt: freezed == pickedUpAt ? _self.pickedUpAt : pickedUpAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of DeliveryAssignment
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
}
}


/// Adds pattern-matching-related methods to [DeliveryAssignment].
extension DeliveryAssignmentPatterns on DeliveryAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryAssignment value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderId,  String orderNumber,  String branchId,  String branchName,  String branchAddress, @JsonKey(unknownEnumValue: AssignmentStatus.unknown)  AssignmentStatus status,  String? customerName,  String? customerPhone,  DeliveryInfo? delivery,  List<OrderItem> items,  int total, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod,  int amountToCollect, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus orderStatus,  DateTime assignedAt,  DateTime? acceptedAt,  DateTime? pickedUpAt,  DateTime? deliveredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryAssignment() when $default != null:
return $default(_that.id,_that.orderId,_that.orderNumber,_that.branchId,_that.branchName,_that.branchAddress,_that.status,_that.customerName,_that.customerPhone,_that.delivery,_that.items,_that.total,_that.paymentMethod,_that.amountToCollect,_that.orderStatus,_that.assignedAt,_that.acceptedAt,_that.pickedUpAt,_that.deliveredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderId,  String orderNumber,  String branchId,  String branchName,  String branchAddress, @JsonKey(unknownEnumValue: AssignmentStatus.unknown)  AssignmentStatus status,  String? customerName,  String? customerPhone,  DeliveryInfo? delivery,  List<OrderItem> items,  int total, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod,  int amountToCollect, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus orderStatus,  DateTime assignedAt,  DateTime? acceptedAt,  DateTime? pickedUpAt,  DateTime? deliveredAt)  $default,) {final _that = this;
switch (_that) {
case _DeliveryAssignment():
return $default(_that.id,_that.orderId,_that.orderNumber,_that.branchId,_that.branchName,_that.branchAddress,_that.status,_that.customerName,_that.customerPhone,_that.delivery,_that.items,_that.total,_that.paymentMethod,_that.amountToCollect,_that.orderStatus,_that.assignedAt,_that.acceptedAt,_that.pickedUpAt,_that.deliveredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderId,  String orderNumber,  String branchId,  String branchName,  String branchAddress, @JsonKey(unknownEnumValue: AssignmentStatus.unknown)  AssignmentStatus status,  String? customerName,  String? customerPhone,  DeliveryInfo? delivery,  List<OrderItem> items,  int total, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod,  int amountToCollect, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus orderStatus,  DateTime assignedAt,  DateTime? acceptedAt,  DateTime? pickedUpAt,  DateTime? deliveredAt)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryAssignment() when $default != null:
return $default(_that.id,_that.orderId,_that.orderNumber,_that.branchId,_that.branchName,_that.branchAddress,_that.status,_that.customerName,_that.customerPhone,_that.delivery,_that.items,_that.total,_that.paymentMethod,_that.amountToCollect,_that.orderStatus,_that.assignedAt,_that.acceptedAt,_that.pickedUpAt,_that.deliveredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryAssignment implements DeliveryAssignment {
  const _DeliveryAssignment({required this.id, required this.orderId, required this.orderNumber, required this.branchId, this.branchName = '', this.branchAddress = '', @JsonKey(unknownEnumValue: AssignmentStatus.unknown) required this.status, this.customerName, this.customerPhone, this.delivery,  List<OrderItem> items = const [], required this.total, @JsonKey(unknownEnumValue: PaymentMethod.unknown) required this.paymentMethod, this.amountToCollect = 0, @JsonKey(unknownEnumValue: OrderStatus.unknown) required this.orderStatus, required this.assignedAt, this.acceptedAt, this.pickedUpAt, this.deliveredAt}): _items = items;
  factory _DeliveryAssignment.fromJson(Map<String, dynamic> json) => _$DeliveryAssignmentFromJson(json);

@override final  String id;
@override final  String orderId;
@override final  String orderNumber;
@override final  String branchId;
@override@JsonKey() final  String branchName;
@override@JsonKey() final  String branchAddress;
@override@JsonKey(unknownEnumValue: AssignmentStatus.unknown) final  AssignmentStatus status;
@override final  String? customerName;
@override final  String? customerPhone;
@override final  DeliveryInfo? delivery;
 final  List<OrderItem> _items;
@override@JsonKey() List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod paymentMethod;
@override@JsonKey() final  int amountToCollect;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus orderStatus;
@override final  DateTime assignedAt;
@override final  DateTime? acceptedAt;
@override final  DateTime? pickedUpAt;
@override final  DateTime? deliveredAt;

/// Create a copy of DeliveryAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryAssignmentCopyWith<_DeliveryAssignment> get copyWith => __$DeliveryAssignmentCopyWithImpl<_DeliveryAssignment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryAssignmentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.branchAddress, branchAddress) || other.branchAddress == branchAddress)&&(identical(other.status, status) || other.status == status)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.amountToCollect, amountToCollect) || other.amountToCollect == amountToCollect)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.assignedAt, assignedAt) || other.assignedAt == assignedAt)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.pickedUpAt, pickedUpAt) || other.pickedUpAt == pickedUpAt)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,orderId,orderNumber,branchId,branchName,branchAddress,status,customerName,customerPhone,delivery,const DeepCollectionEquality().hash(_items),total,paymentMethod,amountToCollect,orderStatus,assignedAt,acceptedAt,pickedUpAt,deliveredAt]);
}

@override
String toString() {
    return 'DeliveryAssignment(id: $id, orderId: $orderId, orderNumber: $orderNumber, branchId: $branchId, branchName: $branchName, branchAddress: $branchAddress, status: $status, customerName: $customerName, customerPhone: $customerPhone, delivery: $delivery, items: $items, total: $total, paymentMethod: $paymentMethod, amountToCollect: $amountToCollect, orderStatus: $orderStatus, assignedAt: $assignedAt, acceptedAt: $acceptedAt, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt)';
}


}

/// @nodoc
abstract mixin class _$DeliveryAssignmentCopyWith<$Res> implements $DeliveryAssignmentCopyWith<$Res> {
  factory _$DeliveryAssignmentCopyWith(_DeliveryAssignment value, $Res Function(_DeliveryAssignment) _then) = __$DeliveryAssignmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderId, String orderNumber, String branchId, String branchName, String branchAddress,@JsonKey(unknownEnumValue: AssignmentStatus.unknown) AssignmentStatus status, String? customerName, String? customerPhone, DeliveryInfo? delivery, List<OrderItem> items, int total,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod paymentMethod, int amountToCollect,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus orderStatus, DateTime assignedAt, DateTime? acceptedAt, DateTime? pickedUpAt, DateTime? deliveredAt
});


@override $DeliveryInfoCopyWith<$Res>? get delivery;

}
/// @nodoc
class __$DeliveryAssignmentCopyWithImpl<$Res>
    implements _$DeliveryAssignmentCopyWith<$Res> {
  __$DeliveryAssignmentCopyWithImpl(this._self, this._then);

  final _DeliveryAssignment _self;
  final $Res Function(_DeliveryAssignment) _then;

/// Create a copy of DeliveryAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? orderNumber = null,Object? branchId = null,Object? branchName = null,Object? branchAddress = null,Object? status = null,Object? customerName = freezed,Object? customerPhone = freezed,Object? delivery = freezed,Object? items = null,Object? total = null,Object? paymentMethod = null,Object? amountToCollect = null,Object? orderStatus = null,Object? assignedAt = null,Object? acceptedAt = freezed,Object? pickedUpAt = freezed,Object? deliveredAt = freezed,}) {
  return _then(_DeliveryAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,branchAddress: null == branchAddress ? _self.branchAddress : branchAddress // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AssignmentStatus,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as DeliveryInfo?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,amountToCollect: null == amountToCollect ? _self.amountToCollect : amountToCollect // ignore: cast_nullable_to_non_nullable
as int,orderStatus: null == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as OrderStatus,assignedAt: null == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pickedUpAt: freezed == pickedUpAt ? _self.pickedUpAt : pickedUpAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of DeliveryAssignment
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
}
}


/// @nodoc
mixin _$Rider {

 String get id; String? get name; String? get phone; bool get onDuty; int get activeAssignments;
/// Create a copy of Rider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RiderCopyWith<Rider> get copyWith => _$RiderCopyWithImpl<Rider>(this as Rider, _$identity);

  /// Serializes this Rider to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Rider;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Rider&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.onDuty, _this.onDuty) || other.onDuty == _this.onDuty)&&(identical(other.activeAssignments, _this.activeAssignments) || other.activeAssignments == _this.activeAssignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Rider;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.onDuty,_this.activeAssignments);
}

@override
String toString() {
  final _this = this as Rider;
  return 'Rider(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, onDuty: ${_this.onDuty}, activeAssignments: ${_this.activeAssignments})';
}


}

/// @nodoc
abstract mixin class $RiderCopyWith<$Res>  {
  factory $RiderCopyWith(Rider value, $Res Function(Rider) _then) = _$RiderCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? phone, bool onDuty, int activeAssignments
});




}
/// @nodoc
class _$RiderCopyWithImpl<$Res>
    implements $RiderCopyWith<$Res> {
  _$RiderCopyWithImpl(this._self, this._then);

  final Rider _self;
  final $Res Function(Rider) _then;

/// Create a copy of Rider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? phone = freezed,Object? onDuty = null,Object? activeAssignments = null,}) {
  return _then(Rider(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,onDuty: null == onDuty ? _self.onDuty : onDuty // ignore: cast_nullable_to_non_nullable
as bool,activeAssignments: null == activeAssignments ? _self.activeAssignments : activeAssignments // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Rider].
extension RiderPatterns on Rider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Rider value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Rider() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Rider value)  $default,){
final _that = this;
switch (_that) {
case _Rider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Rider value)?  $default,){
final _that = this;
switch (_that) {
case _Rider() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? phone,  bool onDuty,  int activeAssignments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Rider() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.onDuty,_that.activeAssignments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? phone,  bool onDuty,  int activeAssignments)  $default,) {final _that = this;
switch (_that) {
case _Rider():
return $default(_that.id,_that.name,_that.phone,_that.onDuty,_that.activeAssignments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? phone,  bool onDuty,  int activeAssignments)?  $default,) {final _that = this;
switch (_that) {
case _Rider() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.onDuty,_that.activeAssignments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Rider implements Rider {
  const _Rider({required this.id, this.name, this.phone, this.onDuty = false, this.activeAssignments = 0});
  factory _Rider.fromJson(Map<String, dynamic> json) => _$RiderFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? phone;
@override@JsonKey() final  bool onDuty;
@override@JsonKey() final  int activeAssignments;

/// Create a copy of Rider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RiderCopyWith<_Rider> get copyWith => __$RiderCopyWithImpl<_Rider>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RiderToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Rider&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.onDuty, onDuty) || other.onDuty == onDuty)&&(identical(other.activeAssignments, activeAssignments) || other.activeAssignments == activeAssignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,onDuty,activeAssignments);
}

@override
String toString() {
    return 'Rider(id: $id, name: $name, phone: $phone, onDuty: $onDuty, activeAssignments: $activeAssignments)';
}


}

/// @nodoc
abstract mixin class _$RiderCopyWith<$Res> implements $RiderCopyWith<$Res> {
  factory _$RiderCopyWith(_Rider value, $Res Function(_Rider) _then) = __$RiderCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? phone, bool onDuty, int activeAssignments
});




}
/// @nodoc
class __$RiderCopyWithImpl<$Res>
    implements _$RiderCopyWith<$Res> {
  __$RiderCopyWithImpl(this._self, this._then);

  final _Rider _self;
  final $Res Function(_Rider) _then;

/// Create a copy of Rider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? phone = freezed,Object? onDuty = null,Object? activeAssignments = null,}) {
  return _then(_Rider(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,onDuty: null == onDuty ? _self.onDuty : onDuty // ignore: cast_nullable_to_non_nullable
as bool,activeAssignments: null == activeAssignments ? _self.activeAssignments : activeAssignments // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ReceiptBranch {

 String get name; String get addressLine; String get phone;
/// Create a copy of ReceiptBranch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptBranchCopyWith<ReceiptBranch> get copyWith => _$ReceiptBranchCopyWithImpl<ReceiptBranch>(this as ReceiptBranch, _$identity);

  /// Serializes this ReceiptBranch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReceiptBranch;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptBranch&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.addressLine, _this.addressLine) || other.addressLine == _this.addressLine)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReceiptBranch;
  return Object.hash(runtimeType,_this.name,_this.addressLine,_this.phone);
}

@override
String toString() {
  final _this = this as ReceiptBranch;
  return 'ReceiptBranch(name: ${_this.name}, addressLine: ${_this.addressLine}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $ReceiptBranchCopyWith<$Res>  {
  factory $ReceiptBranchCopyWith(ReceiptBranch value, $Res Function(ReceiptBranch) _then) = _$ReceiptBranchCopyWithImpl;
@useResult
$Res call({
 String name, String addressLine, String phone
});




}
/// @nodoc
class _$ReceiptBranchCopyWithImpl<$Res>
    implements $ReceiptBranchCopyWith<$Res> {
  _$ReceiptBranchCopyWithImpl(this._self, this._then);

  final ReceiptBranch _self;
  final $Res Function(ReceiptBranch) _then;

/// Create a copy of ReceiptBranch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? addressLine = null,Object? phone = null,}) {
  return _then(ReceiptBranch(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceiptBranch].
extension ReceiptBranchPatterns on ReceiptBranch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiptBranch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiptBranch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiptBranch value)  $default,){
final _that = this;
switch (_that) {
case _ReceiptBranch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiptBranch value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiptBranch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String addressLine,  String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiptBranch() when $default != null:
return $default(_that.name,_that.addressLine,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String addressLine,  String phone)  $default,) {final _that = this;
switch (_that) {
case _ReceiptBranch():
return $default(_that.name,_that.addressLine,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String addressLine,  String phone)?  $default,) {final _that = this;
switch (_that) {
case _ReceiptBranch() when $default != null:
return $default(_that.name,_that.addressLine,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReceiptBranch implements ReceiptBranch {
  const _ReceiptBranch({required this.name, this.addressLine = '', this.phone = ''});
  factory _ReceiptBranch.fromJson(Map<String, dynamic> json) => _$ReceiptBranchFromJson(json);

@override final  String name;
@override@JsonKey() final  String addressLine;
@override@JsonKey() final  String phone;

/// Create a copy of ReceiptBranch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptBranchCopyWith<_ReceiptBranch> get copyWith => __$ReceiptBranchCopyWithImpl<_ReceiptBranch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptBranchToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptBranch&&(identical(other.name, name) || other.name == name)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,addressLine,phone);
}

@override
String toString() {
    return 'ReceiptBranch(name: $name, addressLine: $addressLine, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$ReceiptBranchCopyWith<$Res> implements $ReceiptBranchCopyWith<$Res> {
  factory _$ReceiptBranchCopyWith(_ReceiptBranch value, $Res Function(_ReceiptBranch) _then) = __$ReceiptBranchCopyWithImpl;
@override @useResult
$Res call({
 String name, String addressLine, String phone
});




}
/// @nodoc
class __$ReceiptBranchCopyWithImpl<$Res>
    implements _$ReceiptBranchCopyWith<$Res> {
  __$ReceiptBranchCopyWithImpl(this._self, this._then);

  final _ReceiptBranch _self;
  final $Res Function(_ReceiptBranch) _then;

/// Create a copy of ReceiptBranch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? addressLine = null,Object? phone = null,}) {
  return _then(_ReceiptBranch(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Receipt {

 String get orderNumber; ReceiptBranch get branch;@JsonKey(unknownEnumValue: OrderType.unknown) OrderType get type; DateTime get placedAt; String? get cashierName; String? get customerName; String? get tableRef; List<OrderItem> get lines; Totals get totals;@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod get paymentMethod;@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus get paymentStatus; int? get amountTendered; int? get changeDue;
/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptCopyWith<Receipt> get copyWith => _$ReceiptCopyWithImpl<Receipt>(this as Receipt, _$identity);

  /// Serializes this Receipt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Receipt;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Receipt&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.branch, _this.branch) || other.branch == _this.branch)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.placedAt, _this.placedAt) || other.placedAt == _this.placedAt)&&(identical(other.cashierName, _this.cashierName) || other.cashierName == _this.cashierName)&&(identical(other.customerName, _this.customerName) || other.customerName == _this.customerName)&&(identical(other.tableRef, _this.tableRef) || other.tableRef == _this.tableRef)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.totals, _this.totals) || other.totals == _this.totals)&&(identical(other.paymentMethod, _this.paymentMethod) || other.paymentMethod == _this.paymentMethod)&&(identical(other.paymentStatus, _this.paymentStatus) || other.paymentStatus == _this.paymentStatus)&&(identical(other.amountTendered, _this.amountTendered) || other.amountTendered == _this.amountTendered)&&(identical(other.changeDue, _this.changeDue) || other.changeDue == _this.changeDue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Receipt;
  return Object.hash(runtimeType,_this.orderNumber,_this.branch,_this.type,_this.placedAt,_this.cashierName,_this.customerName,_this.tableRef,const DeepCollectionEquality().hash(_this.lines),_this.totals,_this.paymentMethod,_this.paymentStatus,_this.amountTendered,_this.changeDue);
}

@override
String toString() {
  final _this = this as Receipt;
  return 'Receipt(orderNumber: ${_this.orderNumber}, branch: ${_this.branch}, type: ${_this.type}, placedAt: ${_this.placedAt}, cashierName: ${_this.cashierName}, customerName: ${_this.customerName}, tableRef: ${_this.tableRef}, lines: ${_this.lines}, totals: ${_this.totals}, paymentMethod: ${_this.paymentMethod}, paymentStatus: ${_this.paymentStatus}, amountTendered: ${_this.amountTendered}, changeDue: ${_this.changeDue})';
}


}

/// @nodoc
abstract mixin class $ReceiptCopyWith<$Res>  {
  factory $ReceiptCopyWith(Receipt value, $Res Function(Receipt) _then) = _$ReceiptCopyWithImpl;
@useResult
$Res call({
 String orderNumber, ReceiptBranch branch,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType type, DateTime placedAt, String? cashierName, String? customerName, String? tableRef, List<OrderItem> lines, Totals totals,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod paymentMethod,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus paymentStatus, int? amountTendered, int? changeDue
});


$ReceiptBranchCopyWith<$Res> get branch;$TotalsCopyWith<$Res> get totals;

}
/// @nodoc
class _$ReceiptCopyWithImpl<$Res>
    implements $ReceiptCopyWith<$Res> {
  _$ReceiptCopyWithImpl(this._self, this._then);

  final Receipt _self;
  final $Res Function(Receipt) _then;

/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderNumber = null,Object? branch = null,Object? type = null,Object? placedAt = null,Object? cashierName = freezed,Object? customerName = freezed,Object? tableRef = freezed,Object? lines = null,Object? totals = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? amountTendered = freezed,Object? changeDue = freezed,}) {
  return _then(Receipt(
orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,branch: null == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as ReceiptBranch,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,cashierName: freezed == cashierName ? _self.cashierName : cashierName // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,tableRef: freezed == tableRef ? _self.tableRef : tableRef // ignore: cast_nullable_to_non_nullable
as String?,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as Totals,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,amountTendered: freezed == amountTendered ? _self.amountTendered : amountTendered // ignore: cast_nullable_to_non_nullable
as int?,changeDue: freezed == changeDue ? _self.changeDue : changeDue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceiptBranchCopyWith<$Res> get branch {
  
  return $ReceiptBranchCopyWith<$Res>(_self.branch, (value) {
    return _then(_self.copyWith(branch: value));
  });
}/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotalsCopyWith<$Res> get totals {
  
  return $TotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [Receipt].
extension ReceiptPatterns on Receipt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Receipt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Receipt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Receipt value)  $default,){
final _that = this;
switch (_that) {
case _Receipt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Receipt value)?  $default,){
final _that = this;
switch (_that) {
case _Receipt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderNumber,  ReceiptBranch branch, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type,  DateTime placedAt,  String? cashierName,  String? customerName,  String? tableRef,  List<OrderItem> lines,  Totals totals, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  int? amountTendered,  int? changeDue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Receipt() when $default != null:
return $default(_that.orderNumber,_that.branch,_that.type,_that.placedAt,_that.cashierName,_that.customerName,_that.tableRef,_that.lines,_that.totals,_that.paymentMethod,_that.paymentStatus,_that.amountTendered,_that.changeDue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderNumber,  ReceiptBranch branch, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type,  DateTime placedAt,  String? cashierName,  String? customerName,  String? tableRef,  List<OrderItem> lines,  Totals totals, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  int? amountTendered,  int? changeDue)  $default,) {final _that = this;
switch (_that) {
case _Receipt():
return $default(_that.orderNumber,_that.branch,_that.type,_that.placedAt,_that.cashierName,_that.customerName,_that.tableRef,_that.lines,_that.totals,_that.paymentMethod,_that.paymentStatus,_that.amountTendered,_that.changeDue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderNumber,  ReceiptBranch branch, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType type,  DateTime placedAt,  String? cashierName,  String? customerName,  String? tableRef,  List<OrderItem> lines,  Totals totals, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  int? amountTendered,  int? changeDue)?  $default,) {final _that = this;
switch (_that) {
case _Receipt() when $default != null:
return $default(_that.orderNumber,_that.branch,_that.type,_that.placedAt,_that.cashierName,_that.customerName,_that.tableRef,_that.lines,_that.totals,_that.paymentMethod,_that.paymentStatus,_that.amountTendered,_that.changeDue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Receipt implements Receipt {
  const _Receipt({required this.orderNumber, required this.branch, @JsonKey(unknownEnumValue: OrderType.unknown) required this.type, required this.placedAt, this.cashierName, this.customerName, this.tableRef,  List<OrderItem> lines = const [], required this.totals, @JsonKey(unknownEnumValue: PaymentMethod.unknown) required this.paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown) required this.paymentStatus, this.amountTendered, this.changeDue}): _lines = lines;
  factory _Receipt.fromJson(Map<String, dynamic> json) => _$ReceiptFromJson(json);

@override final  String orderNumber;
@override final  ReceiptBranch branch;
@override@JsonKey(unknownEnumValue: OrderType.unknown) final  OrderType type;
@override final  DateTime placedAt;
@override final  String? cashierName;
@override final  String? customerName;
@override final  String? tableRef;
 final  List<OrderItem> _lines;
@override@JsonKey() List<OrderItem> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override final  Totals totals;
@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod paymentMethod;
@override@JsonKey(unknownEnumValue: PaymentStatus.unknown) final  PaymentStatus paymentStatus;
@override final  int? amountTendered;
@override final  int? changeDue;

/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptCopyWith<_Receipt> get copyWith => __$ReceiptCopyWithImpl<_Receipt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Receipt&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.type, type) || other.type == type)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.cashierName, cashierName) || other.cashierName == cashierName)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.tableRef, tableRef) || other.tableRef == tableRef)&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.amountTendered, amountTendered) || other.amountTendered == amountTendered)&&(identical(other.changeDue, changeDue) || other.changeDue == changeDue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,orderNumber,branch,type,placedAt,cashierName,customerName,tableRef,const DeepCollectionEquality().hash(_lines),totals,paymentMethod,paymentStatus,amountTendered,changeDue);
}

@override
String toString() {
    return 'Receipt(orderNumber: $orderNumber, branch: $branch, type: $type, placedAt: $placedAt, cashierName: $cashierName, customerName: $customerName, tableRef: $tableRef, lines: $lines, totals: $totals, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, amountTendered: $amountTendered, changeDue: $changeDue)';
}


}

/// @nodoc
abstract mixin class _$ReceiptCopyWith<$Res> implements $ReceiptCopyWith<$Res> {
  factory _$ReceiptCopyWith(_Receipt value, $Res Function(_Receipt) _then) = __$ReceiptCopyWithImpl;
@override @useResult
$Res call({
 String orderNumber, ReceiptBranch branch,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType type, DateTime placedAt, String? cashierName, String? customerName, String? tableRef, List<OrderItem> lines, Totals totals,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod paymentMethod,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus paymentStatus, int? amountTendered, int? changeDue
});


@override $ReceiptBranchCopyWith<$Res> get branch;@override $TotalsCopyWith<$Res> get totals;

}
/// @nodoc
class __$ReceiptCopyWithImpl<$Res>
    implements _$ReceiptCopyWith<$Res> {
  __$ReceiptCopyWithImpl(this._self, this._then);

  final _Receipt _self;
  final $Res Function(_Receipt) _then;

/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderNumber = null,Object? branch = null,Object? type = null,Object? placedAt = null,Object? cashierName = freezed,Object? customerName = freezed,Object? tableRef = freezed,Object? lines = null,Object? totals = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? amountTendered = freezed,Object? changeDue = freezed,}) {
  return _then(_Receipt(
orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,branch: null == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as ReceiptBranch,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,cashierName: freezed == cashierName ? _self.cashierName : cashierName // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,tableRef: freezed == tableRef ? _self.tableRef : tableRef // ignore: cast_nullable_to_non_nullable
as String?,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as Totals,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,amountTendered: freezed == amountTendered ? _self.amountTendered : amountTendered // ignore: cast_nullable_to_non_nullable
as int?,changeDue: freezed == changeDue ? _self.changeDue : changeDue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceiptBranchCopyWith<$Res> get branch {
  
  return $ReceiptBranchCopyWith<$Res>(_self.branch, (value) {
    return _then(_self.copyWith(branch: value));
  });
}/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotalsCopyWith<$Res> get totals {
  
  return $TotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// @nodoc
mixin _$BranchMenuItem {

 String get menuItemId; String get branchId; String get name; String get categoryName; String? get imageUrl; int get basePrice; int? get priceOverride; int get effectivePrice; bool get isAvailable; bool get isActiveGlobally; int? get stockQuantity; DateTime? get updatedAt;
/// Create a copy of BranchMenuItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchMenuItemCopyWith<BranchMenuItem> get copyWith => _$BranchMenuItemCopyWithImpl<BranchMenuItem>(this as BranchMenuItem, _$identity);

  /// Serializes this BranchMenuItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BranchMenuItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchMenuItem&&(identical(other.menuItemId, _this.menuItemId) || other.menuItemId == _this.menuItemId)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.categoryName, _this.categoryName) || other.categoryName == _this.categoryName)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.basePrice, _this.basePrice) || other.basePrice == _this.basePrice)&&(identical(other.priceOverride, _this.priceOverride) || other.priceOverride == _this.priceOverride)&&(identical(other.effectivePrice, _this.effectivePrice) || other.effectivePrice == _this.effectivePrice)&&(identical(other.isAvailable, _this.isAvailable) || other.isAvailable == _this.isAvailable)&&(identical(other.isActiveGlobally, _this.isActiveGlobally) || other.isActiveGlobally == _this.isActiveGlobally)&&(identical(other.stockQuantity, _this.stockQuantity) || other.stockQuantity == _this.stockQuantity)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BranchMenuItem;
  return Object.hash(runtimeType,_this.menuItemId,_this.branchId,_this.name,_this.categoryName,_this.imageUrl,_this.basePrice,_this.priceOverride,_this.effectivePrice,_this.isAvailable,_this.isActiveGlobally,_this.stockQuantity,_this.updatedAt);
}

@override
String toString() {
  final _this = this as BranchMenuItem;
  return 'BranchMenuItem(menuItemId: ${_this.menuItemId}, branchId: ${_this.branchId}, name: ${_this.name}, categoryName: ${_this.categoryName}, imageUrl: ${_this.imageUrl}, basePrice: ${_this.basePrice}, priceOverride: ${_this.priceOverride}, effectivePrice: ${_this.effectivePrice}, isAvailable: ${_this.isAvailable}, isActiveGlobally: ${_this.isActiveGlobally}, stockQuantity: ${_this.stockQuantity}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $BranchMenuItemCopyWith<$Res>  {
  factory $BranchMenuItemCopyWith(BranchMenuItem value, $Res Function(BranchMenuItem) _then) = _$BranchMenuItemCopyWithImpl;
@useResult
$Res call({
 String menuItemId, String branchId, String name, String categoryName, String? imageUrl, int basePrice, int? priceOverride, int effectivePrice, bool isAvailable, bool isActiveGlobally, int? stockQuantity, DateTime? updatedAt
});




}
/// @nodoc
class _$BranchMenuItemCopyWithImpl<$Res>
    implements $BranchMenuItemCopyWith<$Res> {
  _$BranchMenuItemCopyWithImpl(this._self, this._then);

  final BranchMenuItem _self;
  final $Res Function(BranchMenuItem) _then;

/// Create a copy of BranchMenuItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuItemId = null,Object? branchId = null,Object? name = null,Object? categoryName = null,Object? imageUrl = freezed,Object? basePrice = null,Object? priceOverride = freezed,Object? effectivePrice = null,Object? isAvailable = null,Object? isActiveGlobally = null,Object? stockQuantity = freezed,Object? updatedAt = freezed,}) {
  return _then(BranchMenuItem(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int,priceOverride: freezed == priceOverride ? _self.priceOverride : priceOverride // ignore: cast_nullable_to_non_nullable
as int?,effectivePrice: null == effectivePrice ? _self.effectivePrice : effectivePrice // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isActiveGlobally: null == isActiveGlobally ? _self.isActiveGlobally : isActiveGlobally // ignore: cast_nullable_to_non_nullable
as bool,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BranchMenuItem].
extension BranchMenuItemPatterns on BranchMenuItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchMenuItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchMenuItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchMenuItem value)  $default,){
final _that = this;
switch (_that) {
case _BranchMenuItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchMenuItem value)?  $default,){
final _that = this;
switch (_that) {
case _BranchMenuItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String menuItemId,  String branchId,  String name,  String categoryName,  String? imageUrl,  int basePrice,  int? priceOverride,  int effectivePrice,  bool isAvailable,  bool isActiveGlobally,  int? stockQuantity,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchMenuItem() when $default != null:
return $default(_that.menuItemId,_that.branchId,_that.name,_that.categoryName,_that.imageUrl,_that.basePrice,_that.priceOverride,_that.effectivePrice,_that.isAvailable,_that.isActiveGlobally,_that.stockQuantity,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String menuItemId,  String branchId,  String name,  String categoryName,  String? imageUrl,  int basePrice,  int? priceOverride,  int effectivePrice,  bool isAvailable,  bool isActiveGlobally,  int? stockQuantity,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BranchMenuItem():
return $default(_that.menuItemId,_that.branchId,_that.name,_that.categoryName,_that.imageUrl,_that.basePrice,_that.priceOverride,_that.effectivePrice,_that.isAvailable,_that.isActiveGlobally,_that.stockQuantity,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String menuItemId,  String branchId,  String name,  String categoryName,  String? imageUrl,  int basePrice,  int? priceOverride,  int effectivePrice,  bool isAvailable,  bool isActiveGlobally,  int? stockQuantity,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BranchMenuItem() when $default != null:
return $default(_that.menuItemId,_that.branchId,_that.name,_that.categoryName,_that.imageUrl,_that.basePrice,_that.priceOverride,_that.effectivePrice,_that.isAvailable,_that.isActiveGlobally,_that.stockQuantity,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchMenuItem implements BranchMenuItem {
  const _BranchMenuItem({required this.menuItemId, required this.branchId, required this.name, this.categoryName = '', this.imageUrl, required this.basePrice, this.priceOverride, required this.effectivePrice, required this.isAvailable, this.isActiveGlobally = true, this.stockQuantity, this.updatedAt});
  factory _BranchMenuItem.fromJson(Map<String, dynamic> json) => _$BranchMenuItemFromJson(json);

@override final  String menuItemId;
@override final  String branchId;
@override final  String name;
@override@JsonKey() final  String categoryName;
@override final  String? imageUrl;
@override final  int basePrice;
@override final  int? priceOverride;
@override final  int effectivePrice;
@override final  bool isAvailable;
@override@JsonKey() final  bool isActiveGlobally;
@override final  int? stockQuantity;
@override final  DateTime? updatedAt;

/// Create a copy of BranchMenuItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchMenuItemCopyWith<_BranchMenuItem> get copyWith => __$BranchMenuItemCopyWithImpl<_BranchMenuItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchMenuItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchMenuItem&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.priceOverride, priceOverride) || other.priceOverride == priceOverride)&&(identical(other.effectivePrice, effectivePrice) || other.effectivePrice == effectivePrice)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isActiveGlobally, isActiveGlobally) || other.isActiveGlobally == isActiveGlobally)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,menuItemId,branchId,name,categoryName,imageUrl,basePrice,priceOverride,effectivePrice,isAvailable,isActiveGlobally,stockQuantity,updatedAt);
}

@override
String toString() {
    return 'BranchMenuItem(menuItemId: $menuItemId, branchId: $branchId, name: $name, categoryName: $categoryName, imageUrl: $imageUrl, basePrice: $basePrice, priceOverride: $priceOverride, effectivePrice: $effectivePrice, isAvailable: $isAvailable, isActiveGlobally: $isActiveGlobally, stockQuantity: $stockQuantity, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BranchMenuItemCopyWith<$Res> implements $BranchMenuItemCopyWith<$Res> {
  factory _$BranchMenuItemCopyWith(_BranchMenuItem value, $Res Function(_BranchMenuItem) _then) = __$BranchMenuItemCopyWithImpl;
@override @useResult
$Res call({
 String menuItemId, String branchId, String name, String categoryName, String? imageUrl, int basePrice, int? priceOverride, int effectivePrice, bool isAvailable, bool isActiveGlobally, int? stockQuantity, DateTime? updatedAt
});




}
/// @nodoc
class __$BranchMenuItemCopyWithImpl<$Res>
    implements _$BranchMenuItemCopyWith<$Res> {
  __$BranchMenuItemCopyWithImpl(this._self, this._then);

  final _BranchMenuItem _self;
  final $Res Function(_BranchMenuItem) _then;

/// Create a copy of BranchMenuItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuItemId = null,Object? branchId = null,Object? name = null,Object? categoryName = null,Object? imageUrl = freezed,Object? basePrice = null,Object? priceOverride = freezed,Object? effectivePrice = null,Object? isAvailable = null,Object? isActiveGlobally = null,Object? stockQuantity = freezed,Object? updatedAt = freezed,}) {
  return _then(_BranchMenuItem(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int,priceOverride: freezed == priceOverride ? _self.priceOverride : priceOverride // ignore: cast_nullable_to_non_nullable
as int?,effectivePrice: null == effectivePrice ? _self.effectivePrice : effectivePrice // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isActiveGlobally: null == isActiveGlobally ? _self.isActiveGlobally : isActiveGlobally // ignore: cast_nullable_to_non_nullable
as bool,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DashboardToday {

 int get revenue; int get orders; int get averageOrderValue; int get activeOrders; int get pendingOrders; int get cancelledOrders;
/// Create a copy of DashboardToday
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardTodayCopyWith<DashboardToday> get copyWith => _$DashboardTodayCopyWithImpl<DashboardToday>(this as DashboardToday, _$identity);

  /// Serializes this DashboardToday to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardToday;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardToday&&(identical(other.revenue, _this.revenue) || other.revenue == _this.revenue)&&(identical(other.orders, _this.orders) || other.orders == _this.orders)&&(identical(other.averageOrderValue, _this.averageOrderValue) || other.averageOrderValue == _this.averageOrderValue)&&(identical(other.activeOrders, _this.activeOrders) || other.activeOrders == _this.activeOrders)&&(identical(other.pendingOrders, _this.pendingOrders) || other.pendingOrders == _this.pendingOrders)&&(identical(other.cancelledOrders, _this.cancelledOrders) || other.cancelledOrders == _this.cancelledOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardToday;
  return Object.hash(runtimeType,_this.revenue,_this.orders,_this.averageOrderValue,_this.activeOrders,_this.pendingOrders,_this.cancelledOrders);
}

@override
String toString() {
  final _this = this as DashboardToday;
  return 'DashboardToday(revenue: ${_this.revenue}, orders: ${_this.orders}, averageOrderValue: ${_this.averageOrderValue}, activeOrders: ${_this.activeOrders}, pendingOrders: ${_this.pendingOrders}, cancelledOrders: ${_this.cancelledOrders})';
}


}

/// @nodoc
abstract mixin class $DashboardTodayCopyWith<$Res>  {
  factory $DashboardTodayCopyWith(DashboardToday value, $Res Function(DashboardToday) _then) = _$DashboardTodayCopyWithImpl;
@useResult
$Res call({
 int revenue, int orders, int averageOrderValue, int activeOrders, int pendingOrders, int cancelledOrders
});




}
/// @nodoc
class _$DashboardTodayCopyWithImpl<$Res>
    implements $DashboardTodayCopyWith<$Res> {
  _$DashboardTodayCopyWithImpl(this._self, this._then);

  final DashboardToday _self;
  final $Res Function(DashboardToday) _then;

/// Create a copy of DashboardToday
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? revenue = null,Object? orders = null,Object? averageOrderValue = null,Object? activeOrders = null,Object? pendingOrders = null,Object? cancelledOrders = null,}) {
  return _then(DashboardToday(
revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,averageOrderValue: null == averageOrderValue ? _self.averageOrderValue : averageOrderValue // ignore: cast_nullable_to_non_nullable
as int,activeOrders: null == activeOrders ? _self.activeOrders : activeOrders // ignore: cast_nullable_to_non_nullable
as int,pendingOrders: null == pendingOrders ? _self.pendingOrders : pendingOrders // ignore: cast_nullable_to_non_nullable
as int,cancelledOrders: null == cancelledOrders ? _self.cancelledOrders : cancelledOrders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardToday].
extension DashboardTodayPatterns on DashboardToday {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardToday value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardToday() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardToday value)  $default,){
final _that = this;
switch (_that) {
case _DashboardToday():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardToday value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardToday() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int revenue,  int orders,  int averageOrderValue,  int activeOrders,  int pendingOrders,  int cancelledOrders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardToday() when $default != null:
return $default(_that.revenue,_that.orders,_that.averageOrderValue,_that.activeOrders,_that.pendingOrders,_that.cancelledOrders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int revenue,  int orders,  int averageOrderValue,  int activeOrders,  int pendingOrders,  int cancelledOrders)  $default,) {final _that = this;
switch (_that) {
case _DashboardToday():
return $default(_that.revenue,_that.orders,_that.averageOrderValue,_that.activeOrders,_that.pendingOrders,_that.cancelledOrders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int revenue,  int orders,  int averageOrderValue,  int activeOrders,  int pendingOrders,  int cancelledOrders)?  $default,) {final _that = this;
switch (_that) {
case _DashboardToday() when $default != null:
return $default(_that.revenue,_that.orders,_that.averageOrderValue,_that.activeOrders,_that.pendingOrders,_that.cancelledOrders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardToday implements DashboardToday {
  const _DashboardToday({this.revenue = 0, this.orders = 0, this.averageOrderValue = 0, this.activeOrders = 0, this.pendingOrders = 0, this.cancelledOrders = 0});
  factory _DashboardToday.fromJson(Map<String, dynamic> json) => _$DashboardTodayFromJson(json);

@override@JsonKey() final  int revenue;
@override@JsonKey() final  int orders;
@override@JsonKey() final  int averageOrderValue;
@override@JsonKey() final  int activeOrders;
@override@JsonKey() final  int pendingOrders;
@override@JsonKey() final  int cancelledOrders;

/// Create a copy of DashboardToday
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardTodayCopyWith<_DashboardToday> get copyWith => __$DashboardTodayCopyWithImpl<_DashboardToday>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardTodayToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardToday&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.orders, orders) || other.orders == orders)&&(identical(other.averageOrderValue, averageOrderValue) || other.averageOrderValue == averageOrderValue)&&(identical(other.activeOrders, activeOrders) || other.activeOrders == activeOrders)&&(identical(other.pendingOrders, pendingOrders) || other.pendingOrders == pendingOrders)&&(identical(other.cancelledOrders, cancelledOrders) || other.cancelledOrders == cancelledOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,revenue,orders,averageOrderValue,activeOrders,pendingOrders,cancelledOrders);
}

@override
String toString() {
    return 'DashboardToday(revenue: $revenue, orders: $orders, averageOrderValue: $averageOrderValue, activeOrders: $activeOrders, pendingOrders: $pendingOrders, cancelledOrders: $cancelledOrders)';
}


}

/// @nodoc
abstract mixin class _$DashboardTodayCopyWith<$Res> implements $DashboardTodayCopyWith<$Res> {
  factory _$DashboardTodayCopyWith(_DashboardToday value, $Res Function(_DashboardToday) _then) = __$DashboardTodayCopyWithImpl;
@override @useResult
$Res call({
 int revenue, int orders, int averageOrderValue, int activeOrders, int pendingOrders, int cancelledOrders
});




}
/// @nodoc
class __$DashboardTodayCopyWithImpl<$Res>
    implements _$DashboardTodayCopyWith<$Res> {
  __$DashboardTodayCopyWithImpl(this._self, this._then);

  final _DashboardToday _self;
  final $Res Function(_DashboardToday) _then;

/// Create a copy of DashboardToday
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? revenue = null,Object? orders = null,Object? averageOrderValue = null,Object? activeOrders = null,Object? pendingOrders = null,Object? cancelledOrders = null,}) {
  return _then(_DashboardToday(
revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,averageOrderValue: null == averageOrderValue ? _self.averageOrderValue : averageOrderValue // ignore: cast_nullable_to_non_nullable
as int,activeOrders: null == activeOrders ? _self.activeOrders : activeOrders // ignore: cast_nullable_to_non_nullable
as int,pendingOrders: null == pendingOrders ? _self.pendingOrders : pendingOrders // ignore: cast_nullable_to_non_nullable
as int,cancelledOrders: null == cancelledOrders ? _self.cancelledOrders : cancelledOrders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$NamedAmount {

 String? get branchId; String? get branchName; String? get name; String? get method; int get quantity; int get orders; int get revenue;
/// Create a copy of NamedAmount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NamedAmountCopyWith<NamedAmount> get copyWith => _$NamedAmountCopyWithImpl<NamedAmount>(this as NamedAmount, _$identity);

  /// Serializes this NamedAmount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NamedAmount;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NamedAmount&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.orders, _this.orders) || other.orders == _this.orders)&&(identical(other.revenue, _this.revenue) || other.revenue == _this.revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NamedAmount;
  return Object.hash(runtimeType,_this.branchId,_this.branchName,_this.name,_this.method,_this.quantity,_this.orders,_this.revenue);
}

@override
String toString() {
  final _this = this as NamedAmount;
  return 'NamedAmount(branchId: ${_this.branchId}, branchName: ${_this.branchName}, name: ${_this.name}, method: ${_this.method}, quantity: ${_this.quantity}, orders: ${_this.orders}, revenue: ${_this.revenue})';
}


}

/// @nodoc
abstract mixin class $NamedAmountCopyWith<$Res>  {
  factory $NamedAmountCopyWith(NamedAmount value, $Res Function(NamedAmount) _then) = _$NamedAmountCopyWithImpl;
@useResult
$Res call({
 String? branchId, String? branchName, String? name, String? method, int quantity, int orders, int revenue
});




}
/// @nodoc
class _$NamedAmountCopyWithImpl<$Res>
    implements $NamedAmountCopyWith<$Res> {
  _$NamedAmountCopyWithImpl(this._self, this._then);

  final NamedAmount _self;
  final $Res Function(NamedAmount) _then;

/// Create a copy of NamedAmount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branchId = freezed,Object? branchName = freezed,Object? name = freezed,Object? method = freezed,Object? quantity = null,Object? orders = null,Object? revenue = null,}) {
  return _then(NamedAmount(
branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NamedAmount].
extension NamedAmountPatterns on NamedAmount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NamedAmount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NamedAmount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NamedAmount value)  $default,){
final _that = this;
switch (_that) {
case _NamedAmount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NamedAmount value)?  $default,){
final _that = this;
switch (_that) {
case _NamedAmount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? branchId,  String? branchName,  String? name,  String? method,  int quantity,  int orders,  int revenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NamedAmount() when $default != null:
return $default(_that.branchId,_that.branchName,_that.name,_that.method,_that.quantity,_that.orders,_that.revenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? branchId,  String? branchName,  String? name,  String? method,  int quantity,  int orders,  int revenue)  $default,) {final _that = this;
switch (_that) {
case _NamedAmount():
return $default(_that.branchId,_that.branchName,_that.name,_that.method,_that.quantity,_that.orders,_that.revenue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? branchId,  String? branchName,  String? name,  String? method,  int quantity,  int orders,  int revenue)?  $default,) {final _that = this;
switch (_that) {
case _NamedAmount() when $default != null:
return $default(_that.branchId,_that.branchName,_that.name,_that.method,_that.quantity,_that.orders,_that.revenue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NamedAmount implements NamedAmount {
  const _NamedAmount({this.branchId, this.branchName, this.name, this.method, this.quantity = 0, this.orders = 0, this.revenue = 0});
  factory _NamedAmount.fromJson(Map<String, dynamic> json) => _$NamedAmountFromJson(json);

@override final  String? branchId;
@override final  String? branchName;
@override final  String? name;
@override final  String? method;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  int orders;
@override@JsonKey() final  int revenue;

/// Create a copy of NamedAmount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NamedAmountCopyWith<_NamedAmount> get copyWith => __$NamedAmountCopyWithImpl<_NamedAmount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NamedAmountToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NamedAmount&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.name, name) || other.name == name)&&(identical(other.method, method) || other.method == method)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.orders, orders) || other.orders == orders)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,branchId,branchName,name,method,quantity,orders,revenue);
}

@override
String toString() {
    return 'NamedAmount(branchId: $branchId, branchName: $branchName, name: $name, method: $method, quantity: $quantity, orders: $orders, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class _$NamedAmountCopyWith<$Res> implements $NamedAmountCopyWith<$Res> {
  factory _$NamedAmountCopyWith(_NamedAmount value, $Res Function(_NamedAmount) _then) = __$NamedAmountCopyWithImpl;
@override @useResult
$Res call({
 String? branchId, String? branchName, String? name, String? method, int quantity, int orders, int revenue
});




}
/// @nodoc
class __$NamedAmountCopyWithImpl<$Res>
    implements _$NamedAmountCopyWith<$Res> {
  __$NamedAmountCopyWithImpl(this._self, this._then);

  final _NamedAmount _self;
  final $Res Function(_NamedAmount) _then;

/// Create a copy of NamedAmount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branchId = freezed,Object? branchName = freezed,Object? name = freezed,Object? method = freezed,Object? quantity = null,Object? orders = null,Object? revenue = null,}) {
  return _then(_NamedAmount(
branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ActivityEntry {

 String get id; String get action; String get entityType; String? get actorName; DateTime get createdAt;
/// Create a copy of ActivityEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityEntryCopyWith<ActivityEntry> get copyWith => _$ActivityEntryCopyWithImpl<ActivityEntry>(this as ActivityEntry, _$identity);

  /// Serializes this ActivityEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ActivityEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.action, _this.action) || other.action == _this.action)&&(identical(other.entityType, _this.entityType) || other.entityType == _this.entityType)&&(identical(other.actorName, _this.actorName) || other.actorName == _this.actorName)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ActivityEntry;
  return Object.hash(runtimeType,_this.id,_this.action,_this.entityType,_this.actorName,_this.createdAt);
}

@override
String toString() {
  final _this = this as ActivityEntry;
  return 'ActivityEntry(id: ${_this.id}, action: ${_this.action}, entityType: ${_this.entityType}, actorName: ${_this.actorName}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ActivityEntryCopyWith<$Res>  {
  factory $ActivityEntryCopyWith(ActivityEntry value, $Res Function(ActivityEntry) _then) = _$ActivityEntryCopyWithImpl;
@useResult
$Res call({
 String id, String action, String entityType, String? actorName, DateTime createdAt
});




}
/// @nodoc
class _$ActivityEntryCopyWithImpl<$Res>
    implements $ActivityEntryCopyWith<$Res> {
  _$ActivityEntryCopyWithImpl(this._self, this._then);

  final ActivityEntry _self;
  final $Res Function(ActivityEntry) _then;

/// Create a copy of ActivityEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? action = null,Object? entityType = null,Object? actorName = freezed,Object? createdAt = null,}) {
  return _then(ActivityEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,entityType: null == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String,actorName: freezed == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityEntry].
extension ActivityEntryPatterns on ActivityEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityEntry value)  $default,){
final _that = this;
switch (_that) {
case _ActivityEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String action,  String entityType,  String? actorName,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityEntry() when $default != null:
return $default(_that.id,_that.action,_that.entityType,_that.actorName,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String action,  String entityType,  String? actorName,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ActivityEntry():
return $default(_that.id,_that.action,_that.entityType,_that.actorName,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String action,  String entityType,  String? actorName,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ActivityEntry() when $default != null:
return $default(_that.id,_that.action,_that.entityType,_that.actorName,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityEntry implements ActivityEntry {
  const _ActivityEntry({required this.id, required this.action, this.entityType = '', this.actorName, required this.createdAt});
  factory _ActivityEntry.fromJson(Map<String, dynamic> json) => _$ActivityEntryFromJson(json);

@override final  String id;
@override final  String action;
@override@JsonKey() final  String entityType;
@override final  String? actorName;
@override final  DateTime createdAt;

/// Create a copy of ActivityEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityEntryCopyWith<_ActivityEntry> get copyWith => __$ActivityEntryCopyWithImpl<_ActivityEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.actorName, actorName) || other.actorName == actorName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,action,entityType,actorName,createdAt);
}

@override
String toString() {
    return 'ActivityEntry(id: $id, action: $action, entityType: $entityType, actorName: $actorName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ActivityEntryCopyWith<$Res> implements $ActivityEntryCopyWith<$Res> {
  factory _$ActivityEntryCopyWith(_ActivityEntry value, $Res Function(_ActivityEntry) _then) = __$ActivityEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String action, String entityType, String? actorName, DateTime createdAt
});




}
/// @nodoc
class __$ActivityEntryCopyWithImpl<$Res>
    implements _$ActivityEntryCopyWith<$Res> {
  __$ActivityEntryCopyWithImpl(this._self, this._then);

  final _ActivityEntry _self;
  final $Res Function(_ActivityEntry) _then;

/// Create a copy of ActivityEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? action = null,Object? entityType = null,Object? actorName = freezed,Object? createdAt = null,}) {
  return _then(_ActivityEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,entityType: null == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String,actorName: freezed == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Dashboard {

 DashboardToday get today; List<NamedAmount> get topItems; List<NamedAmount> get salesByBranch; List<NamedAmount> get paymentBreakdown; List<OrderSummary> get recentOrders; List<ActivityEntry> get recentActivity;
/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardCopyWith<Dashboard> get copyWith => _$DashboardCopyWithImpl<Dashboard>(this as Dashboard, _$identity);

  /// Serializes this Dashboard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Dashboard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dashboard&&(identical(other.today, _this.today) || other.today == _this.today)&&const DeepCollectionEquality().equals(other.topItems, _this.topItems)&&const DeepCollectionEquality().equals(other.salesByBranch, _this.salesByBranch)&&const DeepCollectionEquality().equals(other.paymentBreakdown, _this.paymentBreakdown)&&const DeepCollectionEquality().equals(other.recentOrders, _this.recentOrders)&&const DeepCollectionEquality().equals(other.recentActivity, _this.recentActivity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Dashboard;
  return Object.hash(runtimeType,_this.today,const DeepCollectionEquality().hash(_this.topItems),const DeepCollectionEquality().hash(_this.salesByBranch),const DeepCollectionEquality().hash(_this.paymentBreakdown),const DeepCollectionEquality().hash(_this.recentOrders),const DeepCollectionEquality().hash(_this.recentActivity));
}

@override
String toString() {
  final _this = this as Dashboard;
  return 'Dashboard(today: ${_this.today}, topItems: ${_this.topItems}, salesByBranch: ${_this.salesByBranch}, paymentBreakdown: ${_this.paymentBreakdown}, recentOrders: ${_this.recentOrders}, recentActivity: ${_this.recentActivity})';
}


}

/// @nodoc
abstract mixin class $DashboardCopyWith<$Res>  {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) _then) = _$DashboardCopyWithImpl;
@useResult
$Res call({
 DashboardToday today, List<NamedAmount> topItems, List<NamedAmount> salesByBranch, List<NamedAmount> paymentBreakdown, List<OrderSummary> recentOrders, List<ActivityEntry> recentActivity
});


$DashboardTodayCopyWith<$Res> get today;

}
/// @nodoc
class _$DashboardCopyWithImpl<$Res>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._self, this._then);

  final Dashboard _self;
  final $Res Function(Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? today = null,Object? topItems = null,Object? salesByBranch = null,Object? paymentBreakdown = null,Object? recentOrders = null,Object? recentActivity = null,}) {
  return _then(Dashboard(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as DashboardToday,topItems: null == topItems ? _self.topItems : topItems // ignore: cast_nullable_to_non_nullable
as List<NamedAmount>,salesByBranch: null == salesByBranch ? _self.salesByBranch : salesByBranch // ignore: cast_nullable_to_non_nullable
as List<NamedAmount>,paymentBreakdown: null == paymentBreakdown ? _self.paymentBreakdown : paymentBreakdown // ignore: cast_nullable_to_non_nullable
as List<NamedAmount>,recentOrders: null == recentOrders ? _self.recentOrders : recentOrders // ignore: cast_nullable_to_non_nullable
as List<OrderSummary>,recentActivity: null == recentActivity ? _self.recentActivity : recentActivity // ignore: cast_nullable_to_non_nullable
as List<ActivityEntry>,
  ));
}
/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardTodayCopyWith<$Res> get today {
  
  return $DashboardTodayCopyWith<$Res>(_self.today, (value) {
    return _then(_self.copyWith(today: value));
  });
}
}


/// Adds pattern-matching-related methods to [Dashboard].
extension DashboardPatterns on Dashboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dashboard value)  $default,){
final _that = this;
switch (_that) {
case _Dashboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dashboard value)?  $default,){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DashboardToday today,  List<NamedAmount> topItems,  List<NamedAmount> salesByBranch,  List<NamedAmount> paymentBreakdown,  List<OrderSummary> recentOrders,  List<ActivityEntry> recentActivity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that.today,_that.topItems,_that.salesByBranch,_that.paymentBreakdown,_that.recentOrders,_that.recentActivity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DashboardToday today,  List<NamedAmount> topItems,  List<NamedAmount> salesByBranch,  List<NamedAmount> paymentBreakdown,  List<OrderSummary> recentOrders,  List<ActivityEntry> recentActivity)  $default,) {final _that = this;
switch (_that) {
case _Dashboard():
return $default(_that.today,_that.topItems,_that.salesByBranch,_that.paymentBreakdown,_that.recentOrders,_that.recentActivity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DashboardToday today,  List<NamedAmount> topItems,  List<NamedAmount> salesByBranch,  List<NamedAmount> paymentBreakdown,  List<OrderSummary> recentOrders,  List<ActivityEntry> recentActivity)?  $default,) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that.today,_that.topItems,_that.salesByBranch,_that.paymentBreakdown,_that.recentOrders,_that.recentActivity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Dashboard implements Dashboard {
  const _Dashboard({required this.today,  List<NamedAmount> topItems = const [],  List<NamedAmount> salesByBranch = const [],  List<NamedAmount> paymentBreakdown = const [],  List<OrderSummary> recentOrders = const [],  List<ActivityEntry> recentActivity = const []}): _topItems = topItems,_salesByBranch = salesByBranch,_paymentBreakdown = paymentBreakdown,_recentOrders = recentOrders,_recentActivity = recentActivity;
  factory _Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);

@override final  DashboardToday today;
 final  List<NamedAmount> _topItems;
@override@JsonKey() List<NamedAmount> get topItems {
  if (_topItems is EqualUnmodifiableListView) return _topItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topItems);
}

 final  List<NamedAmount> _salesByBranch;
@override@JsonKey() List<NamedAmount> get salesByBranch {
  if (_salesByBranch is EqualUnmodifiableListView) return _salesByBranch;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_salesByBranch);
}

 final  List<NamedAmount> _paymentBreakdown;
@override@JsonKey() List<NamedAmount> get paymentBreakdown {
  if (_paymentBreakdown is EqualUnmodifiableListView) return _paymentBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentBreakdown);
}

 final  List<OrderSummary> _recentOrders;
@override@JsonKey() List<OrderSummary> get recentOrders {
  if (_recentOrders is EqualUnmodifiableListView) return _recentOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentOrders);
}

 final  List<ActivityEntry> _recentActivity;
@override@JsonKey() List<ActivityEntry> get recentActivity {
  if (_recentActivity is EqualUnmodifiableListView) return _recentActivity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentActivity);
}


/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardCopyWith<_Dashboard> get copyWith => __$DashboardCopyWithImpl<_Dashboard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dashboard&&(identical(other.today, today) || other.today == today)&&const DeepCollectionEquality().equals(other.topItems, _topItems)&&const DeepCollectionEquality().equals(other.salesByBranch, _salesByBranch)&&const DeepCollectionEquality().equals(other.paymentBreakdown, _paymentBreakdown)&&const DeepCollectionEquality().equals(other.recentOrders, _recentOrders)&&const DeepCollectionEquality().equals(other.recentActivity, _recentActivity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,today,const DeepCollectionEquality().hash(_topItems),const DeepCollectionEquality().hash(_salesByBranch),const DeepCollectionEquality().hash(_paymentBreakdown),const DeepCollectionEquality().hash(_recentOrders),const DeepCollectionEquality().hash(_recentActivity));
}

@override
String toString() {
    return 'Dashboard(today: $today, topItems: $topItems, salesByBranch: $salesByBranch, paymentBreakdown: $paymentBreakdown, recentOrders: $recentOrders, recentActivity: $recentActivity)';
}


}

/// @nodoc
abstract mixin class _$DashboardCopyWith<$Res> implements $DashboardCopyWith<$Res> {
  factory _$DashboardCopyWith(_Dashboard value, $Res Function(_Dashboard) _then) = __$DashboardCopyWithImpl;
@override @useResult
$Res call({
 DashboardToday today, List<NamedAmount> topItems, List<NamedAmount> salesByBranch, List<NamedAmount> paymentBreakdown, List<OrderSummary> recentOrders, List<ActivityEntry> recentActivity
});


@override $DashboardTodayCopyWith<$Res> get today;

}
/// @nodoc
class __$DashboardCopyWithImpl<$Res>
    implements _$DashboardCopyWith<$Res> {
  __$DashboardCopyWithImpl(this._self, this._then);

  final _Dashboard _self;
  final $Res Function(_Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? today = null,Object? topItems = null,Object? salesByBranch = null,Object? paymentBreakdown = null,Object? recentOrders = null,Object? recentActivity = null,}) {
  return _then(_Dashboard(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as DashboardToday,topItems: null == topItems ? _self._topItems : topItems // ignore: cast_nullable_to_non_nullable
as List<NamedAmount>,salesByBranch: null == salesByBranch ? _self._salesByBranch : salesByBranch // ignore: cast_nullable_to_non_nullable
as List<NamedAmount>,paymentBreakdown: null == paymentBreakdown ? _self._paymentBreakdown : paymentBreakdown // ignore: cast_nullable_to_non_nullable
as List<NamedAmount>,recentOrders: null == recentOrders ? _self._recentOrders : recentOrders // ignore: cast_nullable_to_non_nullable
as List<OrderSummary>,recentActivity: null == recentActivity ? _self._recentActivity : recentActivity // ignore: cast_nullable_to_non_nullable
as List<ActivityEntry>,
  ));
}

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardTodayCopyWith<$Res> get today {
  
  return $DashboardTodayCopyWith<$Res>(_self.today, (value) {
    return _then(_self.copyWith(today: value));
  });
}
}


/// @nodoc
mixin _$StaffMember {

 String get id; String get userId; String? get name; String? get email; String? get phone;@JsonKey(unknownEnumValue: StaffRoleWire.unknown) StaffRoleWire get staffRole; String get branchId; String get branchName;@JsonKey(unknownEnumValue: StaffStatus.unknown) StaffStatus get status; bool get onDuty; DateTime? get lastLoginAt; DateTime get createdAt;
/// Create a copy of StaffMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffMemberCopyWith<StaffMember> get copyWith => _$StaffMemberCopyWithImpl<StaffMember>(this as StaffMember, _$identity);

  /// Serializes this StaffMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StaffMember;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffMember&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.staffRole, _this.staffRole) || other.staffRole == _this.staffRole)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.onDuty, _this.onDuty) || other.onDuty == _this.onDuty)&&(identical(other.lastLoginAt, _this.lastLoginAt) || other.lastLoginAt == _this.lastLoginAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StaffMember;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.name,_this.email,_this.phone,_this.staffRole,_this.branchId,_this.branchName,_this.status,_this.onDuty,_this.lastLoginAt,_this.createdAt);
}

@override
String toString() {
  final _this = this as StaffMember;
  return 'StaffMember(id: ${_this.id}, userId: ${_this.userId}, name: ${_this.name}, email: ${_this.email}, phone: ${_this.phone}, staffRole: ${_this.staffRole}, branchId: ${_this.branchId}, branchName: ${_this.branchName}, status: ${_this.status}, onDuty: ${_this.onDuty}, lastLoginAt: ${_this.lastLoginAt}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $StaffMemberCopyWith<$Res>  {
  factory $StaffMemberCopyWith(StaffMember value, $Res Function(StaffMember) _then) = _$StaffMemberCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String? name, String? email, String? phone,@JsonKey(unknownEnumValue: StaffRoleWire.unknown) StaffRoleWire staffRole, String branchId, String branchName,@JsonKey(unknownEnumValue: StaffStatus.unknown) StaffStatus status, bool onDuty, DateTime? lastLoginAt, DateTime createdAt
});




}
/// @nodoc
class _$StaffMemberCopyWithImpl<$Res>
    implements $StaffMemberCopyWith<$Res> {
  _$StaffMemberCopyWithImpl(this._self, this._then);

  final StaffMember _self;
  final $Res Function(StaffMember) _then;

/// Create a copy of StaffMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? staffRole = null,Object? branchId = null,Object? branchName = null,Object? status = null,Object? onDuty = null,Object? lastLoginAt = freezed,Object? createdAt = null,}) {
  return _then(StaffMember(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,staffRole: null == staffRole ? _self.staffRole : staffRole // ignore: cast_nullable_to_non_nullable
as StaffRoleWire,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StaffStatus,onDuty: null == onDuty ? _self.onDuty : onDuty // ignore: cast_nullable_to_non_nullable
as bool,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StaffMember].
extension StaffMemberPatterns on StaffMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffMember value)  $default,){
final _that = this;
switch (_that) {
case _StaffMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffMember value)?  $default,){
final _that = this;
switch (_that) {
case _StaffMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String? name,  String? email,  String? phone, @JsonKey(unknownEnumValue: StaffRoleWire.unknown)  StaffRoleWire staffRole,  String branchId,  String branchName, @JsonKey(unknownEnumValue: StaffStatus.unknown)  StaffStatus status,  bool onDuty,  DateTime? lastLoginAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffMember() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.staffRole,_that.branchId,_that.branchName,_that.status,_that.onDuty,_that.lastLoginAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String? name,  String? email,  String? phone, @JsonKey(unknownEnumValue: StaffRoleWire.unknown)  StaffRoleWire staffRole,  String branchId,  String branchName, @JsonKey(unknownEnumValue: StaffStatus.unknown)  StaffStatus status,  bool onDuty,  DateTime? lastLoginAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _StaffMember():
return $default(_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.staffRole,_that.branchId,_that.branchName,_that.status,_that.onDuty,_that.lastLoginAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String? name,  String? email,  String? phone, @JsonKey(unknownEnumValue: StaffRoleWire.unknown)  StaffRoleWire staffRole,  String branchId,  String branchName, @JsonKey(unknownEnumValue: StaffStatus.unknown)  StaffStatus status,  bool onDuty,  DateTime? lastLoginAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StaffMember() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.staffRole,_that.branchId,_that.branchName,_that.status,_that.onDuty,_that.lastLoginAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StaffMember implements StaffMember {
  const _StaffMember({required this.id, required this.userId, this.name, this.email, this.phone, @JsonKey(unknownEnumValue: StaffRoleWire.unknown) required this.staffRole, required this.branchId, this.branchName = '', @JsonKey(unknownEnumValue: StaffStatus.unknown) required this.status, this.onDuty = false, this.lastLoginAt, required this.createdAt});
  factory _StaffMember.fromJson(Map<String, dynamic> json) => _$StaffMemberFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String? name;
@override final  String? email;
@override final  String? phone;
@override@JsonKey(unknownEnumValue: StaffRoleWire.unknown) final  StaffRoleWire staffRole;
@override final  String branchId;
@override@JsonKey() final  String branchName;
@override@JsonKey(unknownEnumValue: StaffStatus.unknown) final  StaffStatus status;
@override@JsonKey() final  bool onDuty;
@override final  DateTime? lastLoginAt;
@override final  DateTime createdAt;

/// Create a copy of StaffMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffMemberCopyWith<_StaffMember> get copyWith => __$StaffMemberCopyWithImpl<_StaffMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffMemberToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffMember&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.staffRole, staffRole) || other.staffRole == staffRole)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.status, status) || other.status == status)&&(identical(other.onDuty, onDuty) || other.onDuty == onDuty)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,name,email,phone,staffRole,branchId,branchName,status,onDuty,lastLoginAt,createdAt);
}

@override
String toString() {
    return 'StaffMember(id: $id, userId: $userId, name: $name, email: $email, phone: $phone, staffRole: $staffRole, branchId: $branchId, branchName: $branchName, status: $status, onDuty: $onDuty, lastLoginAt: $lastLoginAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StaffMemberCopyWith<$Res> implements $StaffMemberCopyWith<$Res> {
  factory _$StaffMemberCopyWith(_StaffMember value, $Res Function(_StaffMember) _then) = __$StaffMemberCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String? name, String? email, String? phone,@JsonKey(unknownEnumValue: StaffRoleWire.unknown) StaffRoleWire staffRole, String branchId, String branchName,@JsonKey(unknownEnumValue: StaffStatus.unknown) StaffStatus status, bool onDuty, DateTime? lastLoginAt, DateTime createdAt
});




}
/// @nodoc
class __$StaffMemberCopyWithImpl<$Res>
    implements _$StaffMemberCopyWith<$Res> {
  __$StaffMemberCopyWithImpl(this._self, this._then);

  final _StaffMember _self;
  final $Res Function(_StaffMember) _then;

/// Create a copy of StaffMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? staffRole = null,Object? branchId = null,Object? branchName = null,Object? status = null,Object? onDuty = null,Object? lastLoginAt = freezed,Object? createdAt = null,}) {
  return _then(_StaffMember(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,staffRole: null == staffRole ? _self.staffRole : staffRole // ignore: cast_nullable_to_non_nullable
as StaffRoleWire,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StaffStatus,onDuty: null == onDuty ? _self.onDuty : onDuty // ignore: cast_nullable_to_non_nullable
as bool,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ShiftSummary {

 int get orderCount; int get salesTotal; int get cashTotal; int get cardTotal; int get codTotal; int get onlineTotal; int get cancelledCount;
/// Create a copy of ShiftSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftSummaryCopyWith<ShiftSummary> get copyWith => _$ShiftSummaryCopyWithImpl<ShiftSummary>(this as ShiftSummary, _$identity);

  /// Serializes this ShiftSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShiftSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftSummary&&(identical(other.orderCount, _this.orderCount) || other.orderCount == _this.orderCount)&&(identical(other.salesTotal, _this.salesTotal) || other.salesTotal == _this.salesTotal)&&(identical(other.cashTotal, _this.cashTotal) || other.cashTotal == _this.cashTotal)&&(identical(other.cardTotal, _this.cardTotal) || other.cardTotal == _this.cardTotal)&&(identical(other.codTotal, _this.codTotal) || other.codTotal == _this.codTotal)&&(identical(other.onlineTotal, _this.onlineTotal) || other.onlineTotal == _this.onlineTotal)&&(identical(other.cancelledCount, _this.cancelledCount) || other.cancelledCount == _this.cancelledCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShiftSummary;
  return Object.hash(runtimeType,_this.orderCount,_this.salesTotal,_this.cashTotal,_this.cardTotal,_this.codTotal,_this.onlineTotal,_this.cancelledCount);
}

@override
String toString() {
  final _this = this as ShiftSummary;
  return 'ShiftSummary(orderCount: ${_this.orderCount}, salesTotal: ${_this.salesTotal}, cashTotal: ${_this.cashTotal}, cardTotal: ${_this.cardTotal}, codTotal: ${_this.codTotal}, onlineTotal: ${_this.onlineTotal}, cancelledCount: ${_this.cancelledCount})';
}


}

/// @nodoc
abstract mixin class $ShiftSummaryCopyWith<$Res>  {
  factory $ShiftSummaryCopyWith(ShiftSummary value, $Res Function(ShiftSummary) _then) = _$ShiftSummaryCopyWithImpl;
@useResult
$Res call({
 int orderCount, int salesTotal, int cashTotal, int cardTotal, int codTotal, int onlineTotal, int cancelledCount
});




}
/// @nodoc
class _$ShiftSummaryCopyWithImpl<$Res>
    implements $ShiftSummaryCopyWith<$Res> {
  _$ShiftSummaryCopyWithImpl(this._self, this._then);

  final ShiftSummary _self;
  final $Res Function(ShiftSummary) _then;

/// Create a copy of ShiftSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderCount = null,Object? salesTotal = null,Object? cashTotal = null,Object? cardTotal = null,Object? codTotal = null,Object? onlineTotal = null,Object? cancelledCount = null,}) {
  return _then(ShiftSummary(
orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,salesTotal: null == salesTotal ? _self.salesTotal : salesTotal // ignore: cast_nullable_to_non_nullable
as int,cashTotal: null == cashTotal ? _self.cashTotal : cashTotal // ignore: cast_nullable_to_non_nullable
as int,cardTotal: null == cardTotal ? _self.cardTotal : cardTotal // ignore: cast_nullable_to_non_nullable
as int,codTotal: null == codTotal ? _self.codTotal : codTotal // ignore: cast_nullable_to_non_nullable
as int,onlineTotal: null == onlineTotal ? _self.onlineTotal : onlineTotal // ignore: cast_nullable_to_non_nullable
as int,cancelledCount: null == cancelledCount ? _self.cancelledCount : cancelledCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ShiftSummary].
extension ShiftSummaryPatterns on ShiftSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftSummary value)  $default,){
final _that = this;
switch (_that) {
case _ShiftSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int orderCount,  int salesTotal,  int cashTotal,  int cardTotal,  int codTotal,  int onlineTotal,  int cancelledCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftSummary() when $default != null:
return $default(_that.orderCount,_that.salesTotal,_that.cashTotal,_that.cardTotal,_that.codTotal,_that.onlineTotal,_that.cancelledCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int orderCount,  int salesTotal,  int cashTotal,  int cardTotal,  int codTotal,  int onlineTotal,  int cancelledCount)  $default,) {final _that = this;
switch (_that) {
case _ShiftSummary():
return $default(_that.orderCount,_that.salesTotal,_that.cashTotal,_that.cardTotal,_that.codTotal,_that.onlineTotal,_that.cancelledCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int orderCount,  int salesTotal,  int cashTotal,  int cardTotal,  int codTotal,  int onlineTotal,  int cancelledCount)?  $default,) {final _that = this;
switch (_that) {
case _ShiftSummary() when $default != null:
return $default(_that.orderCount,_that.salesTotal,_that.cashTotal,_that.cardTotal,_that.codTotal,_that.onlineTotal,_that.cancelledCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShiftSummary implements ShiftSummary {
  const _ShiftSummary({this.orderCount = 0, this.salesTotal = 0, this.cashTotal = 0, this.cardTotal = 0, this.codTotal = 0, this.onlineTotal = 0, this.cancelledCount = 0});
  factory _ShiftSummary.fromJson(Map<String, dynamic> json) => _$ShiftSummaryFromJson(json);

@override@JsonKey() final  int orderCount;
@override@JsonKey() final  int salesTotal;
@override@JsonKey() final  int cashTotal;
@override@JsonKey() final  int cardTotal;
@override@JsonKey() final  int codTotal;
@override@JsonKey() final  int onlineTotal;
@override@JsonKey() final  int cancelledCount;

/// Create a copy of ShiftSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftSummaryCopyWith<_ShiftSummary> get copyWith => __$ShiftSummaryCopyWithImpl<_ShiftSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShiftSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftSummary&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount)&&(identical(other.salesTotal, salesTotal) || other.salesTotal == salesTotal)&&(identical(other.cashTotal, cashTotal) || other.cashTotal == cashTotal)&&(identical(other.cardTotal, cardTotal) || other.cardTotal == cardTotal)&&(identical(other.codTotal, codTotal) || other.codTotal == codTotal)&&(identical(other.onlineTotal, onlineTotal) || other.onlineTotal == onlineTotal)&&(identical(other.cancelledCount, cancelledCount) || other.cancelledCount == cancelledCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,orderCount,salesTotal,cashTotal,cardTotal,codTotal,onlineTotal,cancelledCount);
}

@override
String toString() {
    return 'ShiftSummary(orderCount: $orderCount, salesTotal: $salesTotal, cashTotal: $cashTotal, cardTotal: $cardTotal, codTotal: $codTotal, onlineTotal: $onlineTotal, cancelledCount: $cancelledCount)';
}


}

/// @nodoc
abstract mixin class _$ShiftSummaryCopyWith<$Res> implements $ShiftSummaryCopyWith<$Res> {
  factory _$ShiftSummaryCopyWith(_ShiftSummary value, $Res Function(_ShiftSummary) _then) = __$ShiftSummaryCopyWithImpl;
@override @useResult
$Res call({
 int orderCount, int salesTotal, int cashTotal, int cardTotal, int codTotal, int onlineTotal, int cancelledCount
});




}
/// @nodoc
class __$ShiftSummaryCopyWithImpl<$Res>
    implements _$ShiftSummaryCopyWith<$Res> {
  __$ShiftSummaryCopyWithImpl(this._self, this._then);

  final _ShiftSummary _self;
  final $Res Function(_ShiftSummary) _then;

/// Create a copy of ShiftSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderCount = null,Object? salesTotal = null,Object? cashTotal = null,Object? cardTotal = null,Object? codTotal = null,Object? onlineTotal = null,Object? cancelledCount = null,}) {
  return _then(_ShiftSummary(
orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,salesTotal: null == salesTotal ? _self.salesTotal : salesTotal // ignore: cast_nullable_to_non_nullable
as int,cashTotal: null == cashTotal ? _self.cashTotal : cashTotal // ignore: cast_nullable_to_non_nullable
as int,cardTotal: null == cardTotal ? _self.cardTotal : cardTotal // ignore: cast_nullable_to_non_nullable
as int,codTotal: null == codTotal ? _self.codTotal : codTotal // ignore: cast_nullable_to_non_nullable
as int,onlineTotal: null == onlineTotal ? _self.onlineTotal : onlineTotal // ignore: cast_nullable_to_non_nullable
as int,cancelledCount: null == cancelledCount ? _self.cancelledCount : cancelledCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Shift {

 String get id; String get branchId; String get staffId; String? get staffName; String get status; DateTime get openedAt; DateTime? get closedAt; int get openingFloat; int? get expectedCash; int? get countedCash; int? get variance; String? get notes; ShiftSummary get summary;
/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftCopyWith<Shift> get copyWith => _$ShiftCopyWithImpl<Shift>(this as Shift, _$identity);

  /// Serializes this Shift to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Shift;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shift&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.staffId, _this.staffId) || other.staffId == _this.staffId)&&(identical(other.staffName, _this.staffName) || other.staffName == _this.staffName)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.openedAt, _this.openedAt) || other.openedAt == _this.openedAt)&&(identical(other.closedAt, _this.closedAt) || other.closedAt == _this.closedAt)&&(identical(other.openingFloat, _this.openingFloat) || other.openingFloat == _this.openingFloat)&&(identical(other.expectedCash, _this.expectedCash) || other.expectedCash == _this.expectedCash)&&(identical(other.countedCash, _this.countedCash) || other.countedCash == _this.countedCash)&&(identical(other.variance, _this.variance) || other.variance == _this.variance)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.summary, _this.summary) || other.summary == _this.summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Shift;
  return Object.hash(runtimeType,_this.id,_this.branchId,_this.staffId,_this.staffName,_this.status,_this.openedAt,_this.closedAt,_this.openingFloat,_this.expectedCash,_this.countedCash,_this.variance,_this.notes,_this.summary);
}

@override
String toString() {
  final _this = this as Shift;
  return 'Shift(id: ${_this.id}, branchId: ${_this.branchId}, staffId: ${_this.staffId}, staffName: ${_this.staffName}, status: ${_this.status}, openedAt: ${_this.openedAt}, closedAt: ${_this.closedAt}, openingFloat: ${_this.openingFloat}, expectedCash: ${_this.expectedCash}, countedCash: ${_this.countedCash}, variance: ${_this.variance}, notes: ${_this.notes}, summary: ${_this.summary})';
}


}

/// @nodoc
abstract mixin class $ShiftCopyWith<$Res>  {
  factory $ShiftCopyWith(Shift value, $Res Function(Shift) _then) = _$ShiftCopyWithImpl;
@useResult
$Res call({
 String id, String branchId, String staffId, String? staffName, String status, DateTime openedAt, DateTime? closedAt, int openingFloat, int? expectedCash, int? countedCash, int? variance, String? notes, ShiftSummary summary
});


$ShiftSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$ShiftCopyWithImpl<$Res>
    implements $ShiftCopyWith<$Res> {
  _$ShiftCopyWithImpl(this._self, this._then);

  final Shift _self;
  final $Res Function(Shift) _then;

/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? branchId = null,Object? staffId = null,Object? staffName = freezed,Object? status = null,Object? openedAt = null,Object? closedAt = freezed,Object? openingFloat = null,Object? expectedCash = freezed,Object? countedCash = freezed,Object? variance = freezed,Object? notes = freezed,Object? summary = null,}) {
  return _then(Shift(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as String,staffName: freezed == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,openedAt: null == openedAt ? _self.openedAt : openedAt // ignore: cast_nullable_to_non_nullable
as DateTime,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,openingFloat: null == openingFloat ? _self.openingFloat : openingFloat // ignore: cast_nullable_to_non_nullable
as int,expectedCash: freezed == expectedCash ? _self.expectedCash : expectedCash // ignore: cast_nullable_to_non_nullable
as int?,countedCash: freezed == countedCash ? _self.countedCash : countedCash // ignore: cast_nullable_to_non_nullable
as int?,variance: freezed == variance ? _self.variance : variance // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ShiftSummary,
  ));
}
/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftSummaryCopyWith<$Res> get summary {
  
  return $ShiftSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [Shift].
extension ShiftPatterns on Shift {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shift value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shift() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shift value)  $default,){
final _that = this;
switch (_that) {
case _Shift():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shift value)?  $default,){
final _that = this;
switch (_that) {
case _Shift() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String branchId,  String staffId,  String? staffName,  String status,  DateTime openedAt,  DateTime? closedAt,  int openingFloat,  int? expectedCash,  int? countedCash,  int? variance,  String? notes,  ShiftSummary summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shift() when $default != null:
return $default(_that.id,_that.branchId,_that.staffId,_that.staffName,_that.status,_that.openedAt,_that.closedAt,_that.openingFloat,_that.expectedCash,_that.countedCash,_that.variance,_that.notes,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String branchId,  String staffId,  String? staffName,  String status,  DateTime openedAt,  DateTime? closedAt,  int openingFloat,  int? expectedCash,  int? countedCash,  int? variance,  String? notes,  ShiftSummary summary)  $default,) {final _that = this;
switch (_that) {
case _Shift():
return $default(_that.id,_that.branchId,_that.staffId,_that.staffName,_that.status,_that.openedAt,_that.closedAt,_that.openingFloat,_that.expectedCash,_that.countedCash,_that.variance,_that.notes,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String branchId,  String staffId,  String? staffName,  String status,  DateTime openedAt,  DateTime? closedAt,  int openingFloat,  int? expectedCash,  int? countedCash,  int? variance,  String? notes,  ShiftSummary summary)?  $default,) {final _that = this;
switch (_that) {
case _Shift() when $default != null:
return $default(_that.id,_that.branchId,_that.staffId,_that.staffName,_that.status,_that.openedAt,_that.closedAt,_that.openingFloat,_that.expectedCash,_that.countedCash,_that.variance,_that.notes,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Shift extends Shift {
  const _Shift({required this.id, required this.branchId, required this.staffId, this.staffName, required this.status, required this.openedAt, this.closedAt, this.openingFloat = 0, this.expectedCash, this.countedCash, this.variance, this.notes, this.summary = const ShiftSummary()}): super._();
  factory _Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

@override final  String id;
@override final  String branchId;
@override final  String staffId;
@override final  String? staffName;
@override final  String status;
@override final  DateTime openedAt;
@override final  DateTime? closedAt;
@override@JsonKey() final  int openingFloat;
@override final  int? expectedCash;
@override final  int? countedCash;
@override final  int? variance;
@override final  String? notes;
@override@JsonKey() final  ShiftSummary summary;

/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftCopyWith<_Shift> get copyWith => __$ShiftCopyWithImpl<_Shift>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShiftToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shift&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.staffId, staffId) || other.staffId == staffId)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.status, status) || other.status == status)&&(identical(other.openedAt, openedAt) || other.openedAt == openedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.openingFloat, openingFloat) || other.openingFloat == openingFloat)&&(identical(other.expectedCash, expectedCash) || other.expectedCash == expectedCash)&&(identical(other.countedCash, countedCash) || other.countedCash == countedCash)&&(identical(other.variance, variance) || other.variance == variance)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,branchId,staffId,staffName,status,openedAt,closedAt,openingFloat,expectedCash,countedCash,variance,notes,summary);
}

@override
String toString() {
    return 'Shift(id: $id, branchId: $branchId, staffId: $staffId, staffName: $staffName, status: $status, openedAt: $openedAt, closedAt: $closedAt, openingFloat: $openingFloat, expectedCash: $expectedCash, countedCash: $countedCash, variance: $variance, notes: $notes, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$ShiftCopyWith<$Res> implements $ShiftCopyWith<$Res> {
  factory _$ShiftCopyWith(_Shift value, $Res Function(_Shift) _then) = __$ShiftCopyWithImpl;
@override @useResult
$Res call({
 String id, String branchId, String staffId, String? staffName, String status, DateTime openedAt, DateTime? closedAt, int openingFloat, int? expectedCash, int? countedCash, int? variance, String? notes, ShiftSummary summary
});


@override $ShiftSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class __$ShiftCopyWithImpl<$Res>
    implements _$ShiftCopyWith<$Res> {
  __$ShiftCopyWithImpl(this._self, this._then);

  final _Shift _self;
  final $Res Function(_Shift) _then;

/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? branchId = null,Object? staffId = null,Object? staffName = freezed,Object? status = null,Object? openedAt = null,Object? closedAt = freezed,Object? openingFloat = null,Object? expectedCash = freezed,Object? countedCash = freezed,Object? variance = freezed,Object? notes = freezed,Object? summary = null,}) {
  return _then(_Shift(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as String,staffName: freezed == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,openedAt: null == openedAt ? _self.openedAt : openedAt // ignore: cast_nullable_to_non_nullable
as DateTime,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,openingFloat: null == openingFloat ? _self.openingFloat : openingFloat // ignore: cast_nullable_to_non_nullable
as int,expectedCash: freezed == expectedCash ? _self.expectedCash : expectedCash // ignore: cast_nullable_to_non_nullable
as int?,countedCash: freezed == countedCash ? _self.countedCash : countedCash // ignore: cast_nullable_to_non_nullable
as int?,variance: freezed == variance ? _self.variance : variance // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ShiftSummary,
  ));
}

/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftSummaryCopyWith<$Res> get summary {
  
  return $ShiftSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$Reservation {

 String get id; String get branchId; String get branchName; String get name; String get phone; int get partySize; DateTime get reservedFor; int get durationMinutes; String get status; String? get notes; String? get cancelReason; DateTime get createdAt;
/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationCopyWith<Reservation> get copyWith => _$ReservationCopyWithImpl<Reservation>(this as Reservation, _$identity);

  /// Serializes this Reservation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Reservation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reservation&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.partySize, _this.partySize) || other.partySize == _this.partySize)&&(identical(other.reservedFor, _this.reservedFor) || other.reservedFor == _this.reservedFor)&&(identical(other.durationMinutes, _this.durationMinutes) || other.durationMinutes == _this.durationMinutes)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.cancelReason, _this.cancelReason) || other.cancelReason == _this.cancelReason)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Reservation;
  return Object.hash(runtimeType,_this.id,_this.branchId,_this.branchName,_this.name,_this.phone,_this.partySize,_this.reservedFor,_this.durationMinutes,_this.status,_this.notes,_this.cancelReason,_this.createdAt);
}

@override
String toString() {
  final _this = this as Reservation;
  return 'Reservation(id: ${_this.id}, branchId: ${_this.branchId}, branchName: ${_this.branchName}, name: ${_this.name}, phone: ${_this.phone}, partySize: ${_this.partySize}, reservedFor: ${_this.reservedFor}, durationMinutes: ${_this.durationMinutes}, status: ${_this.status}, notes: ${_this.notes}, cancelReason: ${_this.cancelReason}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ReservationCopyWith<$Res>  {
  factory $ReservationCopyWith(Reservation value, $Res Function(Reservation) _then) = _$ReservationCopyWithImpl;
@useResult
$Res call({
 String id, String branchId, String branchName, String name, String phone, int partySize, DateTime reservedFor, int durationMinutes, String status, String? notes, String? cancelReason, DateTime createdAt
});




}
/// @nodoc
class _$ReservationCopyWithImpl<$Res>
    implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._self, this._then);

  final Reservation _self;
  final $Res Function(Reservation) _then;

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? branchId = null,Object? branchName = null,Object? name = null,Object? phone = null,Object? partySize = null,Object? reservedFor = null,Object? durationMinutes = null,Object? status = null,Object? notes = freezed,Object? cancelReason = freezed,Object? createdAt = null,}) {
  return _then(Reservation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,partySize: null == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int,reservedFor: null == reservedFor ? _self.reservedFor : reservedFor // ignore: cast_nullable_to_non_nullable
as DateTime,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Reservation].
extension ReservationPatterns on Reservation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reservation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reservation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reservation value)  $default,){
final _that = this;
switch (_that) {
case _Reservation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reservation value)?  $default,){
final _that = this;
switch (_that) {
case _Reservation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String branchId,  String branchName,  String name,  String phone,  int partySize,  DateTime reservedFor,  int durationMinutes,  String status,  String? notes,  String? cancelReason,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reservation() when $default != null:
return $default(_that.id,_that.branchId,_that.branchName,_that.name,_that.phone,_that.partySize,_that.reservedFor,_that.durationMinutes,_that.status,_that.notes,_that.cancelReason,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String branchId,  String branchName,  String name,  String phone,  int partySize,  DateTime reservedFor,  int durationMinutes,  String status,  String? notes,  String? cancelReason,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Reservation():
return $default(_that.id,_that.branchId,_that.branchName,_that.name,_that.phone,_that.partySize,_that.reservedFor,_that.durationMinutes,_that.status,_that.notes,_that.cancelReason,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String branchId,  String branchName,  String name,  String phone,  int partySize,  DateTime reservedFor,  int durationMinutes,  String status,  String? notes,  String? cancelReason,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Reservation() when $default != null:
return $default(_that.id,_that.branchId,_that.branchName,_that.name,_that.phone,_that.partySize,_that.reservedFor,_that.durationMinutes,_that.status,_that.notes,_that.cancelReason,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reservation implements Reservation {
  const _Reservation({required this.id, required this.branchId, this.branchName = '', required this.name, required this.phone, required this.partySize, required this.reservedFor, this.durationMinutes = 90, required this.status, this.notes, this.cancelReason, required this.createdAt});
  factory _Reservation.fromJson(Map<String, dynamic> json) => _$ReservationFromJson(json);

@override final  String id;
@override final  String branchId;
@override@JsonKey() final  String branchName;
@override final  String name;
@override final  String phone;
@override final  int partySize;
@override final  DateTime reservedFor;
@override@JsonKey() final  int durationMinutes;
@override final  String status;
@override final  String? notes;
@override final  String? cancelReason;
@override final  DateTime createdAt;

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationCopyWith<_Reservation> get copyWith => __$ReservationCopyWithImpl<_Reservation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reservation&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.partySize, partySize) || other.partySize == partySize)&&(identical(other.reservedFor, reservedFor) || other.reservedFor == reservedFor)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.cancelReason, cancelReason) || other.cancelReason == cancelReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,branchId,branchName,name,phone,partySize,reservedFor,durationMinutes,status,notes,cancelReason,createdAt);
}

@override
String toString() {
    return 'Reservation(id: $id, branchId: $branchId, branchName: $branchName, name: $name, phone: $phone, partySize: $partySize, reservedFor: $reservedFor, durationMinutes: $durationMinutes, status: $status, notes: $notes, cancelReason: $cancelReason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReservationCopyWith<$Res> implements $ReservationCopyWith<$Res> {
  factory _$ReservationCopyWith(_Reservation value, $Res Function(_Reservation) _then) = __$ReservationCopyWithImpl;
@override @useResult
$Res call({
 String id, String branchId, String branchName, String name, String phone, int partySize, DateTime reservedFor, int durationMinutes, String status, String? notes, String? cancelReason, DateTime createdAt
});




}
/// @nodoc
class __$ReservationCopyWithImpl<$Res>
    implements _$ReservationCopyWith<$Res> {
  __$ReservationCopyWithImpl(this._self, this._then);

  final _Reservation _self;
  final $Res Function(_Reservation) _then;

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? branchId = null,Object? branchName = null,Object? name = null,Object? phone = null,Object? partySize = null,Object? reservedFor = null,Object? durationMinutes = null,Object? status = null,Object? notes = freezed,Object? cancelReason = freezed,Object? createdAt = null,}) {
  return _then(_Reservation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,partySize: null == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int,reservedFor: null == reservedFor ? _self.reservedFor : reservedFor // ignore: cast_nullable_to_non_nullable
as DateTime,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$WaitlistEntry {

 String get id; String get branchId; String get branchName; String get name; String? get phone; int get partySize; String get status; int? get position; int? get estimatedWaitMinutes; DateTime get joinedAt; DateTime? get notifiedAt; DateTime? get expiresAt; String? get notes;
/// Create a copy of WaitlistEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaitlistEntryCopyWith<WaitlistEntry> get copyWith => _$WaitlistEntryCopyWithImpl<WaitlistEntry>(this as WaitlistEntry, _$identity);

  /// Serializes this WaitlistEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WaitlistEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaitlistEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.partySize, _this.partySize) || other.partySize == _this.partySize)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.position, _this.position) || other.position == _this.position)&&(identical(other.estimatedWaitMinutes, _this.estimatedWaitMinutes) || other.estimatedWaitMinutes == _this.estimatedWaitMinutes)&&(identical(other.joinedAt, _this.joinedAt) || other.joinedAt == _this.joinedAt)&&(identical(other.notifiedAt, _this.notifiedAt) || other.notifiedAt == _this.notifiedAt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WaitlistEntry;
  return Object.hash(runtimeType,_this.id,_this.branchId,_this.branchName,_this.name,_this.phone,_this.partySize,_this.status,_this.position,_this.estimatedWaitMinutes,_this.joinedAt,_this.notifiedAt,_this.expiresAt,_this.notes);
}

@override
String toString() {
  final _this = this as WaitlistEntry;
  return 'WaitlistEntry(id: ${_this.id}, branchId: ${_this.branchId}, branchName: ${_this.branchName}, name: ${_this.name}, phone: ${_this.phone}, partySize: ${_this.partySize}, status: ${_this.status}, position: ${_this.position}, estimatedWaitMinutes: ${_this.estimatedWaitMinutes}, joinedAt: ${_this.joinedAt}, notifiedAt: ${_this.notifiedAt}, expiresAt: ${_this.expiresAt}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $WaitlistEntryCopyWith<$Res>  {
  factory $WaitlistEntryCopyWith(WaitlistEntry value, $Res Function(WaitlistEntry) _then) = _$WaitlistEntryCopyWithImpl;
@useResult
$Res call({
 String id, String branchId, String branchName, String name, String? phone, int partySize, String status, int? position, int? estimatedWaitMinutes, DateTime joinedAt, DateTime? notifiedAt, DateTime? expiresAt, String? notes
});




}
/// @nodoc
class _$WaitlistEntryCopyWithImpl<$Res>
    implements $WaitlistEntryCopyWith<$Res> {
  _$WaitlistEntryCopyWithImpl(this._self, this._then);

  final WaitlistEntry _self;
  final $Res Function(WaitlistEntry) _then;

/// Create a copy of WaitlistEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? branchId = null,Object? branchName = null,Object? name = null,Object? phone = freezed,Object? partySize = null,Object? status = null,Object? position = freezed,Object? estimatedWaitMinutes = freezed,Object? joinedAt = null,Object? notifiedAt = freezed,Object? expiresAt = freezed,Object? notes = freezed,}) {
  return _then(WaitlistEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,partySize: null == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,estimatedWaitMinutes: freezed == estimatedWaitMinutes ? _self.estimatedWaitMinutes : estimatedWaitMinutes // ignore: cast_nullable_to_non_nullable
as int?,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notifiedAt: freezed == notifiedAt ? _self.notifiedAt : notifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WaitlistEntry].
extension WaitlistEntryPatterns on WaitlistEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaitlistEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaitlistEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaitlistEntry value)  $default,){
final _that = this;
switch (_that) {
case _WaitlistEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaitlistEntry value)?  $default,){
final _that = this;
switch (_that) {
case _WaitlistEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String branchId,  String branchName,  String name,  String? phone,  int partySize,  String status,  int? position,  int? estimatedWaitMinutes,  DateTime joinedAt,  DateTime? notifiedAt,  DateTime? expiresAt,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaitlistEntry() when $default != null:
return $default(_that.id,_that.branchId,_that.branchName,_that.name,_that.phone,_that.partySize,_that.status,_that.position,_that.estimatedWaitMinutes,_that.joinedAt,_that.notifiedAt,_that.expiresAt,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String branchId,  String branchName,  String name,  String? phone,  int partySize,  String status,  int? position,  int? estimatedWaitMinutes,  DateTime joinedAt,  DateTime? notifiedAt,  DateTime? expiresAt,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _WaitlistEntry():
return $default(_that.id,_that.branchId,_that.branchName,_that.name,_that.phone,_that.partySize,_that.status,_that.position,_that.estimatedWaitMinutes,_that.joinedAt,_that.notifiedAt,_that.expiresAt,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String branchId,  String branchName,  String name,  String? phone,  int partySize,  String status,  int? position,  int? estimatedWaitMinutes,  DateTime joinedAt,  DateTime? notifiedAt,  DateTime? expiresAt,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _WaitlistEntry() when $default != null:
return $default(_that.id,_that.branchId,_that.branchName,_that.name,_that.phone,_that.partySize,_that.status,_that.position,_that.estimatedWaitMinutes,_that.joinedAt,_that.notifiedAt,_that.expiresAt,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaitlistEntry implements WaitlistEntry {
  const _WaitlistEntry({required this.id, required this.branchId, this.branchName = '', required this.name, this.phone, required this.partySize, required this.status, this.position, this.estimatedWaitMinutes, required this.joinedAt, this.notifiedAt, this.expiresAt, this.notes});
  factory _WaitlistEntry.fromJson(Map<String, dynamic> json) => _$WaitlistEntryFromJson(json);

@override final  String id;
@override final  String branchId;
@override@JsonKey() final  String branchName;
@override final  String name;
@override final  String? phone;
@override final  int partySize;
@override final  String status;
@override final  int? position;
@override final  int? estimatedWaitMinutes;
@override final  DateTime joinedAt;
@override final  DateTime? notifiedAt;
@override final  DateTime? expiresAt;
@override final  String? notes;

/// Create a copy of WaitlistEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaitlistEntryCopyWith<_WaitlistEntry> get copyWith => __$WaitlistEntryCopyWithImpl<_WaitlistEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaitlistEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaitlistEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.partySize, partySize) || other.partySize == partySize)&&(identical(other.status, status) || other.status == status)&&(identical(other.position, position) || other.position == position)&&(identical(other.estimatedWaitMinutes, estimatedWaitMinutes) || other.estimatedWaitMinutes == estimatedWaitMinutes)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.notifiedAt, notifiedAt) || other.notifiedAt == notifiedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,branchId,branchName,name,phone,partySize,status,position,estimatedWaitMinutes,joinedAt,notifiedAt,expiresAt,notes);
}

@override
String toString() {
    return 'WaitlistEntry(id: $id, branchId: $branchId, branchName: $branchName, name: $name, phone: $phone, partySize: $partySize, status: $status, position: $position, estimatedWaitMinutes: $estimatedWaitMinutes, joinedAt: $joinedAt, notifiedAt: $notifiedAt, expiresAt: $expiresAt, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$WaitlistEntryCopyWith<$Res> implements $WaitlistEntryCopyWith<$Res> {
  factory _$WaitlistEntryCopyWith(_WaitlistEntry value, $Res Function(_WaitlistEntry) _then) = __$WaitlistEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String branchId, String branchName, String name, String? phone, int partySize, String status, int? position, int? estimatedWaitMinutes, DateTime joinedAt, DateTime? notifiedAt, DateTime? expiresAt, String? notes
});




}
/// @nodoc
class __$WaitlistEntryCopyWithImpl<$Res>
    implements _$WaitlistEntryCopyWith<$Res> {
  __$WaitlistEntryCopyWithImpl(this._self, this._then);

  final _WaitlistEntry _self;
  final $Res Function(_WaitlistEntry) _then;

/// Create a copy of WaitlistEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? branchId = null,Object? branchName = null,Object? name = null,Object? phone = freezed,Object? partySize = null,Object? status = null,Object? position = freezed,Object? estimatedWaitMinutes = freezed,Object? joinedAt = null,Object? notifiedAt = freezed,Object? expiresAt = freezed,Object? notes = freezed,}) {
  return _then(_WaitlistEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,partySize: null == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,estimatedWaitMinutes: freezed == estimatedWaitMinutes ? _self.estimatedWaitMinutes : estimatedWaitMinutes // ignore: cast_nullable_to_non_nullable
as int?,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notifiedAt: freezed == notifiedAt ? _self.notifiedAt : notifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
