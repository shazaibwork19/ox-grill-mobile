// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BranchServices {

 bool get dineIn; bool get pickup; bool get delivery;
/// Create a copy of BranchServices
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchServicesCopyWith<BranchServices> get copyWith => _$BranchServicesCopyWithImpl<BranchServices>(this as BranchServices, _$identity);

  /// Serializes this BranchServices to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BranchServices;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchServices&&(identical(other.dineIn, _this.dineIn) || other.dineIn == _this.dineIn)&&(identical(other.pickup, _this.pickup) || other.pickup == _this.pickup)&&(identical(other.delivery, _this.delivery) || other.delivery == _this.delivery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BranchServices;
  return Object.hash(runtimeType,_this.dineIn,_this.pickup,_this.delivery);
}

@override
String toString() {
  final _this = this as BranchServices;
  return 'BranchServices(dineIn: ${_this.dineIn}, pickup: ${_this.pickup}, delivery: ${_this.delivery})';
}


}

/// @nodoc
abstract mixin class $BranchServicesCopyWith<$Res>  {
  factory $BranchServicesCopyWith(BranchServices value, $Res Function(BranchServices) _then) = _$BranchServicesCopyWithImpl;
@useResult
$Res call({
 bool dineIn, bool pickup, bool delivery
});




}
/// @nodoc
class _$BranchServicesCopyWithImpl<$Res>
    implements $BranchServicesCopyWith<$Res> {
  _$BranchServicesCopyWithImpl(this._self, this._then);

  final BranchServices _self;
  final $Res Function(BranchServices) _then;

/// Create a copy of BranchServices
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dineIn = null,Object? pickup = null,Object? delivery = null,}) {
  return _then(BranchServices(
dineIn: null == dineIn ? _self.dineIn : dineIn // ignore: cast_nullable_to_non_nullable
as bool,pickup: null == pickup ? _self.pickup : pickup // ignore: cast_nullable_to_non_nullable
as bool,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BranchServices].
extension BranchServicesPatterns on BranchServices {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchServices value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchServices() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchServices value)  $default,){
final _that = this;
switch (_that) {
case _BranchServices():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchServices value)?  $default,){
final _that = this;
switch (_that) {
case _BranchServices() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool dineIn,  bool pickup,  bool delivery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchServices() when $default != null:
return $default(_that.dineIn,_that.pickup,_that.delivery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool dineIn,  bool pickup,  bool delivery)  $default,) {final _that = this;
switch (_that) {
case _BranchServices():
return $default(_that.dineIn,_that.pickup,_that.delivery);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool dineIn,  bool pickup,  bool delivery)?  $default,) {final _that = this;
switch (_that) {
case _BranchServices() when $default != null:
return $default(_that.dineIn,_that.pickup,_that.delivery);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchServices extends BranchServices {
  const _BranchServices({this.dineIn = false, this.pickup = false, this.delivery = false}): super._();
  factory _BranchServices.fromJson(Map<String, dynamic> json) => _$BranchServicesFromJson(json);

@override@JsonKey() final  bool dineIn;
@override@JsonKey() final  bool pickup;
@override@JsonKey() final  bool delivery;

/// Create a copy of BranchServices
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchServicesCopyWith<_BranchServices> get copyWith => __$BranchServicesCopyWithImpl<_BranchServices>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchServicesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchServices&&(identical(other.dineIn, dineIn) || other.dineIn == dineIn)&&(identical(other.pickup, pickup) || other.pickup == pickup)&&(identical(other.delivery, delivery) || other.delivery == delivery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,dineIn,pickup,delivery);
}

@override
String toString() {
    return 'BranchServices(dineIn: $dineIn, pickup: $pickup, delivery: $delivery)';
}


}

/// @nodoc
abstract mixin class _$BranchServicesCopyWith<$Res> implements $BranchServicesCopyWith<$Res> {
  factory _$BranchServicesCopyWith(_BranchServices value, $Res Function(_BranchServices) _then) = __$BranchServicesCopyWithImpl;
@override @useResult
$Res call({
 bool dineIn, bool pickup, bool delivery
});




}
/// @nodoc
class __$BranchServicesCopyWithImpl<$Res>
    implements _$BranchServicesCopyWith<$Res> {
  __$BranchServicesCopyWithImpl(this._self, this._then);

  final _BranchServices _self;
  final $Res Function(_BranchServices) _then;

/// Create a copy of BranchServices
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dineIn = null,Object? pickup = null,Object? delivery = null,}) {
  return _then(_BranchServices(
dineIn: null == dineIn ? _self.dineIn : dineIn // ignore: cast_nullable_to_non_nullable
as bool,pickup: null == pickup ? _self.pickup : pickup // ignore: cast_nullable_to_non_nullable
as bool,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BranchOpenStatus {

 bool get isOpen; bool get acceptingOrders; String? get todayOpensAt; String? get todayClosesAt; String get label;
/// Create a copy of BranchOpenStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchOpenStatusCopyWith<BranchOpenStatus> get copyWith => _$BranchOpenStatusCopyWithImpl<BranchOpenStatus>(this as BranchOpenStatus, _$identity);

  /// Serializes this BranchOpenStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BranchOpenStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchOpenStatus&&(identical(other.isOpen, _this.isOpen) || other.isOpen == _this.isOpen)&&(identical(other.acceptingOrders, _this.acceptingOrders) || other.acceptingOrders == _this.acceptingOrders)&&(identical(other.todayOpensAt, _this.todayOpensAt) || other.todayOpensAt == _this.todayOpensAt)&&(identical(other.todayClosesAt, _this.todayClosesAt) || other.todayClosesAt == _this.todayClosesAt)&&(identical(other.label, _this.label) || other.label == _this.label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BranchOpenStatus;
  return Object.hash(runtimeType,_this.isOpen,_this.acceptingOrders,_this.todayOpensAt,_this.todayClosesAt,_this.label);
}

@override
String toString() {
  final _this = this as BranchOpenStatus;
  return 'BranchOpenStatus(isOpen: ${_this.isOpen}, acceptingOrders: ${_this.acceptingOrders}, todayOpensAt: ${_this.todayOpensAt}, todayClosesAt: ${_this.todayClosesAt}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $BranchOpenStatusCopyWith<$Res>  {
  factory $BranchOpenStatusCopyWith(BranchOpenStatus value, $Res Function(BranchOpenStatus) _then) = _$BranchOpenStatusCopyWithImpl;
@useResult
$Res call({
 bool isOpen, bool acceptingOrders, String? todayOpensAt, String? todayClosesAt, String label
});




}
/// @nodoc
class _$BranchOpenStatusCopyWithImpl<$Res>
    implements $BranchOpenStatusCopyWith<$Res> {
  _$BranchOpenStatusCopyWithImpl(this._self, this._then);

  final BranchOpenStatus _self;
  final $Res Function(BranchOpenStatus) _then;

/// Create a copy of BranchOpenStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isOpen = null,Object? acceptingOrders = null,Object? todayOpensAt = freezed,Object? todayClosesAt = freezed,Object? label = null,}) {
  return _then(BranchOpenStatus(
isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,acceptingOrders: null == acceptingOrders ? _self.acceptingOrders : acceptingOrders // ignore: cast_nullable_to_non_nullable
as bool,todayOpensAt: freezed == todayOpensAt ? _self.todayOpensAt : todayOpensAt // ignore: cast_nullable_to_non_nullable
as String?,todayClosesAt: freezed == todayClosesAt ? _self.todayClosesAt : todayClosesAt // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BranchOpenStatus].
extension BranchOpenStatusPatterns on BranchOpenStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchOpenStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchOpenStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchOpenStatus value)  $default,){
final _that = this;
switch (_that) {
case _BranchOpenStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchOpenStatus value)?  $default,){
final _that = this;
switch (_that) {
case _BranchOpenStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isOpen,  bool acceptingOrders,  String? todayOpensAt,  String? todayClosesAt,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchOpenStatus() when $default != null:
return $default(_that.isOpen,_that.acceptingOrders,_that.todayOpensAt,_that.todayClosesAt,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isOpen,  bool acceptingOrders,  String? todayOpensAt,  String? todayClosesAt,  String label)  $default,) {final _that = this;
switch (_that) {
case _BranchOpenStatus():
return $default(_that.isOpen,_that.acceptingOrders,_that.todayOpensAt,_that.todayClosesAt,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isOpen,  bool acceptingOrders,  String? todayOpensAt,  String? todayClosesAt,  String label)?  $default,) {final _that = this;
switch (_that) {
case _BranchOpenStatus() when $default != null:
return $default(_that.isOpen,_that.acceptingOrders,_that.todayOpensAt,_that.todayClosesAt,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchOpenStatus implements BranchOpenStatus {
  const _BranchOpenStatus({required this.isOpen, required this.acceptingOrders, this.todayOpensAt, this.todayClosesAt, required this.label});
  factory _BranchOpenStatus.fromJson(Map<String, dynamic> json) => _$BranchOpenStatusFromJson(json);

@override final  bool isOpen;
@override final  bool acceptingOrders;
@override final  String? todayOpensAt;
@override final  String? todayClosesAt;
@override final  String label;

/// Create a copy of BranchOpenStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchOpenStatusCopyWith<_BranchOpenStatus> get copyWith => __$BranchOpenStatusCopyWithImpl<_BranchOpenStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchOpenStatusToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchOpenStatus&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.acceptingOrders, acceptingOrders) || other.acceptingOrders == acceptingOrders)&&(identical(other.todayOpensAt, todayOpensAt) || other.todayOpensAt == todayOpensAt)&&(identical(other.todayClosesAt, todayClosesAt) || other.todayClosesAt == todayClosesAt)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,isOpen,acceptingOrders,todayOpensAt,todayClosesAt,label);
}

@override
String toString() {
    return 'BranchOpenStatus(isOpen: $isOpen, acceptingOrders: $acceptingOrders, todayOpensAt: $todayOpensAt, todayClosesAt: $todayClosesAt, label: $label)';
}


}

/// @nodoc
abstract mixin class _$BranchOpenStatusCopyWith<$Res> implements $BranchOpenStatusCopyWith<$Res> {
  factory _$BranchOpenStatusCopyWith(_BranchOpenStatus value, $Res Function(_BranchOpenStatus) _then) = __$BranchOpenStatusCopyWithImpl;
@override @useResult
$Res call({
 bool isOpen, bool acceptingOrders, String? todayOpensAt, String? todayClosesAt, String label
});




}
/// @nodoc
class __$BranchOpenStatusCopyWithImpl<$Res>
    implements _$BranchOpenStatusCopyWith<$Res> {
  __$BranchOpenStatusCopyWithImpl(this._self, this._then);

  final _BranchOpenStatus _self;
  final $Res Function(_BranchOpenStatus) _then;

/// Create a copy of BranchOpenStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isOpen = null,Object? acceptingOrders = null,Object? todayOpensAt = freezed,Object? todayClosesAt = freezed,Object? label = null,}) {
  return _then(_BranchOpenStatus(
isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,acceptingOrders: null == acceptingOrders ? _self.acceptingOrders : acceptingOrders // ignore: cast_nullable_to_non_nullable
as bool,todayOpensAt: freezed == todayOpensAt ? _self.todayOpensAt : todayOpensAt // ignore: cast_nullable_to_non_nullable
as String?,todayClosesAt: freezed == todayClosesAt ? _self.todayClosesAt : todayClosesAt // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BranchSummary {

 String get id; String get slug; String get name; String get city; String? get area; String get addressLine; String get phone; double? get latitude; double? get longitude; String? get imageUrl; BranchServices get services; int get deliveryFee; int get minDeliveryOrder; int get estimatedDeliveryMinutes; int get estimatedPickupMinutes; BranchOpenStatus get status;
/// Create a copy of BranchSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchSummaryCopyWith<BranchSummary> get copyWith => _$BranchSummaryCopyWithImpl<BranchSummary>(this as BranchSummary, _$identity);

  /// Serializes this BranchSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BranchSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchSummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.addressLine, _this.addressLine) || other.addressLine == _this.addressLine)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.services, _this.services) || other.services == _this.services)&&(identical(other.deliveryFee, _this.deliveryFee) || other.deliveryFee == _this.deliveryFee)&&(identical(other.minDeliveryOrder, _this.minDeliveryOrder) || other.minDeliveryOrder == _this.minDeliveryOrder)&&(identical(other.estimatedDeliveryMinutes, _this.estimatedDeliveryMinutes) || other.estimatedDeliveryMinutes == _this.estimatedDeliveryMinutes)&&(identical(other.estimatedPickupMinutes, _this.estimatedPickupMinutes) || other.estimatedPickupMinutes == _this.estimatedPickupMinutes)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BranchSummary;
  return Object.hash(runtimeType,_this.id,_this.slug,_this.name,_this.city,_this.area,_this.addressLine,_this.phone,_this.latitude,_this.longitude,_this.imageUrl,_this.services,_this.deliveryFee,_this.minDeliveryOrder,_this.estimatedDeliveryMinutes,_this.estimatedPickupMinutes,_this.status);
}

@override
String toString() {
  final _this = this as BranchSummary;
  return 'BranchSummary(id: ${_this.id}, slug: ${_this.slug}, name: ${_this.name}, city: ${_this.city}, area: ${_this.area}, addressLine: ${_this.addressLine}, phone: ${_this.phone}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, imageUrl: ${_this.imageUrl}, services: ${_this.services}, deliveryFee: ${_this.deliveryFee}, minDeliveryOrder: ${_this.minDeliveryOrder}, estimatedDeliveryMinutes: ${_this.estimatedDeliveryMinutes}, estimatedPickupMinutes: ${_this.estimatedPickupMinutes}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $BranchSummaryCopyWith<$Res>  {
  factory $BranchSummaryCopyWith(BranchSummary value, $Res Function(BranchSummary) _then) = _$BranchSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, String city, String? area, String addressLine, String phone, double? latitude, double? longitude, String? imageUrl, BranchServices services, int deliveryFee, int minDeliveryOrder, int estimatedDeliveryMinutes, int estimatedPickupMinutes, BranchOpenStatus status
});


$BranchServicesCopyWith<$Res> get services;$BranchOpenStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$BranchSummaryCopyWithImpl<$Res>
    implements $BranchSummaryCopyWith<$Res> {
  _$BranchSummaryCopyWithImpl(this._self, this._then);

  final BranchSummary _self;
  final $Res Function(BranchSummary) _then;

/// Create a copy of BranchSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? city = null,Object? area = freezed,Object? addressLine = null,Object? phone = null,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? services = null,Object? deliveryFee = null,Object? minDeliveryOrder = null,Object? estimatedDeliveryMinutes = null,Object? estimatedPickupMinutes = null,Object? status = null,}) {
  return _then(BranchSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as BranchServices,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int,minDeliveryOrder: null == minDeliveryOrder ? _self.minDeliveryOrder : minDeliveryOrder // ignore: cast_nullable_to_non_nullable
as int,estimatedDeliveryMinutes: null == estimatedDeliveryMinutes ? _self.estimatedDeliveryMinutes : estimatedDeliveryMinutes // ignore: cast_nullable_to_non_nullable
as int,estimatedPickupMinutes: null == estimatedPickupMinutes ? _self.estimatedPickupMinutes : estimatedPickupMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BranchOpenStatus,
  ));
}
/// Create a copy of BranchSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchServicesCopyWith<$Res> get services {
  
  return $BranchServicesCopyWith<$Res>(_self.services, (value) {
    return _then(_self.copyWith(services: value));
  });
}/// Create a copy of BranchSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchOpenStatusCopyWith<$Res> get status {
  
  return $BranchOpenStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [BranchSummary].
extension BranchSummaryPatterns on BranchSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchSummary value)  $default,){
final _that = this;
switch (_that) {
case _BranchSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchSummary value)?  $default,){
final _that = this;
switch (_that) {
case _BranchSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String city,  String? area,  String addressLine,  String phone,  double? latitude,  double? longitude,  String? imageUrl,  BranchServices services,  int deliveryFee,  int minDeliveryOrder,  int estimatedDeliveryMinutes,  int estimatedPickupMinutes,  BranchOpenStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchSummary() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.city,_that.area,_that.addressLine,_that.phone,_that.latitude,_that.longitude,_that.imageUrl,_that.services,_that.deliveryFee,_that.minDeliveryOrder,_that.estimatedDeliveryMinutes,_that.estimatedPickupMinutes,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String city,  String? area,  String addressLine,  String phone,  double? latitude,  double? longitude,  String? imageUrl,  BranchServices services,  int deliveryFee,  int minDeliveryOrder,  int estimatedDeliveryMinutes,  int estimatedPickupMinutes,  BranchOpenStatus status)  $default,) {final _that = this;
switch (_that) {
case _BranchSummary():
return $default(_that.id,_that.slug,_that.name,_that.city,_that.area,_that.addressLine,_that.phone,_that.latitude,_that.longitude,_that.imageUrl,_that.services,_that.deliveryFee,_that.minDeliveryOrder,_that.estimatedDeliveryMinutes,_that.estimatedPickupMinutes,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  String city,  String? area,  String addressLine,  String phone,  double? latitude,  double? longitude,  String? imageUrl,  BranchServices services,  int deliveryFee,  int minDeliveryOrder,  int estimatedDeliveryMinutes,  int estimatedPickupMinutes,  BranchOpenStatus status)?  $default,) {final _that = this;
switch (_that) {
case _BranchSummary() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.city,_that.area,_that.addressLine,_that.phone,_that.latitude,_that.longitude,_that.imageUrl,_that.services,_that.deliveryFee,_that.minDeliveryOrder,_that.estimatedDeliveryMinutes,_that.estimatedPickupMinutes,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchSummary extends BranchSummary {
  const _BranchSummary({required this.id, required this.slug, required this.name, required this.city, this.area, required this.addressLine, required this.phone, this.latitude, this.longitude, this.imageUrl, required this.services, this.deliveryFee = 0, this.minDeliveryOrder = 0, this.estimatedDeliveryMinutes = 0, this.estimatedPickupMinutes = 0, required this.status}): super._();
  factory _BranchSummary.fromJson(Map<String, dynamic> json) => _$BranchSummaryFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override final  String city;
@override final  String? area;
@override final  String addressLine;
@override final  String phone;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? imageUrl;
@override final  BranchServices services;
@override@JsonKey() final  int deliveryFee;
@override@JsonKey() final  int minDeliveryOrder;
@override@JsonKey() final  int estimatedDeliveryMinutes;
@override@JsonKey() final  int estimatedPickupMinutes;
@override final  BranchOpenStatus status;

/// Create a copy of BranchSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchSummaryCopyWith<_BranchSummary> get copyWith => __$BranchSummaryCopyWithImpl<_BranchSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.area, area) || other.area == area)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.services, services) || other.services == services)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.minDeliveryOrder, minDeliveryOrder) || other.minDeliveryOrder == minDeliveryOrder)&&(identical(other.estimatedDeliveryMinutes, estimatedDeliveryMinutes) || other.estimatedDeliveryMinutes == estimatedDeliveryMinutes)&&(identical(other.estimatedPickupMinutes, estimatedPickupMinutes) || other.estimatedPickupMinutes == estimatedPickupMinutes)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,slug,name,city,area,addressLine,phone,latitude,longitude,imageUrl,services,deliveryFee,minDeliveryOrder,estimatedDeliveryMinutes,estimatedPickupMinutes,status);
}

@override
String toString() {
    return 'BranchSummary(id: $id, slug: $slug, name: $name, city: $city, area: $area, addressLine: $addressLine, phone: $phone, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl, services: $services, deliveryFee: $deliveryFee, minDeliveryOrder: $minDeliveryOrder, estimatedDeliveryMinutes: $estimatedDeliveryMinutes, estimatedPickupMinutes: $estimatedPickupMinutes, status: $status)';
}


}

/// @nodoc
abstract mixin class _$BranchSummaryCopyWith<$Res> implements $BranchSummaryCopyWith<$Res> {
  factory _$BranchSummaryCopyWith(_BranchSummary value, $Res Function(_BranchSummary) _then) = __$BranchSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, String city, String? area, String addressLine, String phone, double? latitude, double? longitude, String? imageUrl, BranchServices services, int deliveryFee, int minDeliveryOrder, int estimatedDeliveryMinutes, int estimatedPickupMinutes, BranchOpenStatus status
});


@override $BranchServicesCopyWith<$Res> get services;@override $BranchOpenStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$BranchSummaryCopyWithImpl<$Res>
    implements _$BranchSummaryCopyWith<$Res> {
  __$BranchSummaryCopyWithImpl(this._self, this._then);

  final _BranchSummary _self;
  final $Res Function(_BranchSummary) _then;

/// Create a copy of BranchSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? city = null,Object? area = freezed,Object? addressLine = null,Object? phone = null,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? services = null,Object? deliveryFee = null,Object? minDeliveryOrder = null,Object? estimatedDeliveryMinutes = null,Object? estimatedPickupMinutes = null,Object? status = null,}) {
  return _then(_BranchSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as BranchServices,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int,minDeliveryOrder: null == minDeliveryOrder ? _self.minDeliveryOrder : minDeliveryOrder // ignore: cast_nullable_to_non_nullable
as int,estimatedDeliveryMinutes: null == estimatedDeliveryMinutes ? _self.estimatedDeliveryMinutes : estimatedDeliveryMinutes // ignore: cast_nullable_to_non_nullable
as int,estimatedPickupMinutes: null == estimatedPickupMinutes ? _self.estimatedPickupMinutes : estimatedPickupMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BranchOpenStatus,
  ));
}

/// Create a copy of BranchSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchServicesCopyWith<$Res> get services {
  
  return $BranchServicesCopyWith<$Res>(_self.services, (value) {
    return _then(_self.copyWith(services: value));
  });
}/// Create a copy of BranchSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchOpenStatusCopyWith<$Res> get status {
  
  return $BranchOpenStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc
mixin _$BranchHours {

 int get dayOfWeek; String get opensAt; String get closesAt; bool get isClosed;
/// Create a copy of BranchHours
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchHoursCopyWith<BranchHours> get copyWith => _$BranchHoursCopyWithImpl<BranchHours>(this as BranchHours, _$identity);

  /// Serializes this BranchHours to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BranchHours;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchHours&&(identical(other.dayOfWeek, _this.dayOfWeek) || other.dayOfWeek == _this.dayOfWeek)&&(identical(other.opensAt, _this.opensAt) || other.opensAt == _this.opensAt)&&(identical(other.closesAt, _this.closesAt) || other.closesAt == _this.closesAt)&&(identical(other.isClosed, _this.isClosed) || other.isClosed == _this.isClosed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BranchHours;
  return Object.hash(runtimeType,_this.dayOfWeek,_this.opensAt,_this.closesAt,_this.isClosed);
}

@override
String toString() {
  final _this = this as BranchHours;
  return 'BranchHours(dayOfWeek: ${_this.dayOfWeek}, opensAt: ${_this.opensAt}, closesAt: ${_this.closesAt}, isClosed: ${_this.isClosed})';
}


}

/// @nodoc
abstract mixin class $BranchHoursCopyWith<$Res>  {
  factory $BranchHoursCopyWith(BranchHours value, $Res Function(BranchHours) _then) = _$BranchHoursCopyWithImpl;
@useResult
$Res call({
 int dayOfWeek, String opensAt, String closesAt, bool isClosed
});




}
/// @nodoc
class _$BranchHoursCopyWithImpl<$Res>
    implements $BranchHoursCopyWith<$Res> {
  _$BranchHoursCopyWithImpl(this._self, this._then);

  final BranchHours _self;
  final $Res Function(BranchHours) _then;

/// Create a copy of BranchHours
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayOfWeek = null,Object? opensAt = null,Object? closesAt = null,Object? isClosed = null,}) {
  return _then(BranchHours(
dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,opensAt: null == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as String,closesAt: null == closesAt ? _self.closesAt : closesAt // ignore: cast_nullable_to_non_nullable
as String,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BranchHours].
extension BranchHoursPatterns on BranchHours {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchHours value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchHours() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchHours value)  $default,){
final _that = this;
switch (_that) {
case _BranchHours():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchHours value)?  $default,){
final _that = this;
switch (_that) {
case _BranchHours() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dayOfWeek,  String opensAt,  String closesAt,  bool isClosed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchHours() when $default != null:
return $default(_that.dayOfWeek,_that.opensAt,_that.closesAt,_that.isClosed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dayOfWeek,  String opensAt,  String closesAt,  bool isClosed)  $default,) {final _that = this;
switch (_that) {
case _BranchHours():
return $default(_that.dayOfWeek,_that.opensAt,_that.closesAt,_that.isClosed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dayOfWeek,  String opensAt,  String closesAt,  bool isClosed)?  $default,) {final _that = this;
switch (_that) {
case _BranchHours() when $default != null:
return $default(_that.dayOfWeek,_that.opensAt,_that.closesAt,_that.isClosed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchHours implements BranchHours {
  const _BranchHours({required this.dayOfWeek, required this.opensAt, required this.closesAt, this.isClosed = false});
  factory _BranchHours.fromJson(Map<String, dynamic> json) => _$BranchHoursFromJson(json);

@override final  int dayOfWeek;
@override final  String opensAt;
@override final  String closesAt;
@override@JsonKey() final  bool isClosed;

/// Create a copy of BranchHours
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchHoursCopyWith<_BranchHours> get copyWith => __$BranchHoursCopyWithImpl<_BranchHours>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchHoursToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchHours&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.opensAt, opensAt) || other.opensAt == opensAt)&&(identical(other.closesAt, closesAt) || other.closesAt == closesAt)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,dayOfWeek,opensAt,closesAt,isClosed);
}

@override
String toString() {
    return 'BranchHours(dayOfWeek: $dayOfWeek, opensAt: $opensAt, closesAt: $closesAt, isClosed: $isClosed)';
}


}

/// @nodoc
abstract mixin class _$BranchHoursCopyWith<$Res> implements $BranchHoursCopyWith<$Res> {
  factory _$BranchHoursCopyWith(_BranchHours value, $Res Function(_BranchHours) _then) = __$BranchHoursCopyWithImpl;
@override @useResult
$Res call({
 int dayOfWeek, String opensAt, String closesAt, bool isClosed
});




}
/// @nodoc
class __$BranchHoursCopyWithImpl<$Res>
    implements _$BranchHoursCopyWith<$Res> {
  __$BranchHoursCopyWithImpl(this._self, this._then);

  final _BranchHours _self;
  final $Res Function(_BranchHours) _then;

/// Create a copy of BranchHours
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayOfWeek = null,Object? opensAt = null,Object? closesAt = null,Object? isClosed = null,}) {
  return _then(_BranchHours(
dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,opensAt: null == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as String,closesAt: null == closesAt ? _self.closesAt : closesAt // ignore: cast_nullable_to_non_nullable
as String,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BranchDetail {

 String get id; String get slug; String get name; String get city; String? get area; String get addressLine; String get phone; double? get latitude; double? get longitude; String? get imageUrl; BranchServices get services; int get deliveryFee; int get minDeliveryOrder; int get estimatedDeliveryMinutes; int get estimatedPickupMinutes; BranchOpenStatus get status; String? get email; String get timezone; List<BranchHours> get hours; Map<String, List<String>> get paymentMethods; int get taxRateCashBps; int get taxRateCardBps;
/// Create a copy of BranchDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchDetailCopyWith<BranchDetail> get copyWith => _$BranchDetailCopyWithImpl<BranchDetail>(this as BranchDetail, _$identity);

  /// Serializes this BranchDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BranchDetail;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchDetail&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.addressLine, _this.addressLine) || other.addressLine == _this.addressLine)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.services, _this.services) || other.services == _this.services)&&(identical(other.deliveryFee, _this.deliveryFee) || other.deliveryFee == _this.deliveryFee)&&(identical(other.minDeliveryOrder, _this.minDeliveryOrder) || other.minDeliveryOrder == _this.minDeliveryOrder)&&(identical(other.estimatedDeliveryMinutes, _this.estimatedDeliveryMinutes) || other.estimatedDeliveryMinutes == _this.estimatedDeliveryMinutes)&&(identical(other.estimatedPickupMinutes, _this.estimatedPickupMinutes) || other.estimatedPickupMinutes == _this.estimatedPickupMinutes)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&const DeepCollectionEquality().equals(other.hours, _this.hours)&&const DeepCollectionEquality().equals(other.paymentMethods, _this.paymentMethods)&&(identical(other.taxRateCashBps, _this.taxRateCashBps) || other.taxRateCashBps == _this.taxRateCashBps)&&(identical(other.taxRateCardBps, _this.taxRateCardBps) || other.taxRateCardBps == _this.taxRateCardBps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BranchDetail;
  return Object.hashAll([runtimeType,_this.id,_this.slug,_this.name,_this.city,_this.area,_this.addressLine,_this.phone,_this.latitude,_this.longitude,_this.imageUrl,_this.services,_this.deliveryFee,_this.minDeliveryOrder,_this.estimatedDeliveryMinutes,_this.estimatedPickupMinutes,_this.status,_this.email,_this.timezone,const DeepCollectionEquality().hash(_this.hours),const DeepCollectionEquality().hash(_this.paymentMethods),_this.taxRateCashBps,_this.taxRateCardBps]);
}

@override
String toString() {
  final _this = this as BranchDetail;
  return 'BranchDetail(id: ${_this.id}, slug: ${_this.slug}, name: ${_this.name}, city: ${_this.city}, area: ${_this.area}, addressLine: ${_this.addressLine}, phone: ${_this.phone}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, imageUrl: ${_this.imageUrl}, services: ${_this.services}, deliveryFee: ${_this.deliveryFee}, minDeliveryOrder: ${_this.minDeliveryOrder}, estimatedDeliveryMinutes: ${_this.estimatedDeliveryMinutes}, estimatedPickupMinutes: ${_this.estimatedPickupMinutes}, status: ${_this.status}, email: ${_this.email}, timezone: ${_this.timezone}, hours: ${_this.hours}, paymentMethods: ${_this.paymentMethods}, taxRateCashBps: ${_this.taxRateCashBps}, taxRateCardBps: ${_this.taxRateCardBps})';
}


}

/// @nodoc
abstract mixin class $BranchDetailCopyWith<$Res>  {
  factory $BranchDetailCopyWith(BranchDetail value, $Res Function(BranchDetail) _then) = _$BranchDetailCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, String city, String? area, String addressLine, String phone, double? latitude, double? longitude, String? imageUrl, BranchServices services, int deliveryFee, int minDeliveryOrder, int estimatedDeliveryMinutes, int estimatedPickupMinutes, BranchOpenStatus status, String? email, String timezone, List<BranchHours> hours, Map<String, List<String>> paymentMethods, int taxRateCashBps, int taxRateCardBps
});


$BranchServicesCopyWith<$Res> get services;$BranchOpenStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$BranchDetailCopyWithImpl<$Res>
    implements $BranchDetailCopyWith<$Res> {
  _$BranchDetailCopyWithImpl(this._self, this._then);

  final BranchDetail _self;
  final $Res Function(BranchDetail) _then;

/// Create a copy of BranchDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? city = null,Object? area = freezed,Object? addressLine = null,Object? phone = null,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? services = null,Object? deliveryFee = null,Object? minDeliveryOrder = null,Object? estimatedDeliveryMinutes = null,Object? estimatedPickupMinutes = null,Object? status = null,Object? email = freezed,Object? timezone = null,Object? hours = null,Object? paymentMethods = null,Object? taxRateCashBps = null,Object? taxRateCardBps = null,}) {
  return _then(BranchDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as BranchServices,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int,minDeliveryOrder: null == minDeliveryOrder ? _self.minDeliveryOrder : minDeliveryOrder // ignore: cast_nullable_to_non_nullable
as int,estimatedDeliveryMinutes: null == estimatedDeliveryMinutes ? _self.estimatedDeliveryMinutes : estimatedDeliveryMinutes // ignore: cast_nullable_to_non_nullable
as int,estimatedPickupMinutes: null == estimatedPickupMinutes ? _self.estimatedPickupMinutes : estimatedPickupMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BranchOpenStatus,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as List<BranchHours>,paymentMethods: null == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,taxRateCashBps: null == taxRateCashBps ? _self.taxRateCashBps : taxRateCashBps // ignore: cast_nullable_to_non_nullable
as int,taxRateCardBps: null == taxRateCardBps ? _self.taxRateCardBps : taxRateCardBps // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of BranchDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchServicesCopyWith<$Res> get services {
  
  return $BranchServicesCopyWith<$Res>(_self.services, (value) {
    return _then(_self.copyWith(services: value));
  });
}/// Create a copy of BranchDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchOpenStatusCopyWith<$Res> get status {
  
  return $BranchOpenStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [BranchDetail].
extension BranchDetailPatterns on BranchDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchDetail value)  $default,){
final _that = this;
switch (_that) {
case _BranchDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchDetail value)?  $default,){
final _that = this;
switch (_that) {
case _BranchDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String city,  String? area,  String addressLine,  String phone,  double? latitude,  double? longitude,  String? imageUrl,  BranchServices services,  int deliveryFee,  int minDeliveryOrder,  int estimatedDeliveryMinutes,  int estimatedPickupMinutes,  BranchOpenStatus status,  String? email,  String timezone,  List<BranchHours> hours,  Map<String, List<String>> paymentMethods,  int taxRateCashBps,  int taxRateCardBps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchDetail() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.city,_that.area,_that.addressLine,_that.phone,_that.latitude,_that.longitude,_that.imageUrl,_that.services,_that.deliveryFee,_that.minDeliveryOrder,_that.estimatedDeliveryMinutes,_that.estimatedPickupMinutes,_that.status,_that.email,_that.timezone,_that.hours,_that.paymentMethods,_that.taxRateCashBps,_that.taxRateCardBps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String city,  String? area,  String addressLine,  String phone,  double? latitude,  double? longitude,  String? imageUrl,  BranchServices services,  int deliveryFee,  int minDeliveryOrder,  int estimatedDeliveryMinutes,  int estimatedPickupMinutes,  BranchOpenStatus status,  String? email,  String timezone,  List<BranchHours> hours,  Map<String, List<String>> paymentMethods,  int taxRateCashBps,  int taxRateCardBps)  $default,) {final _that = this;
switch (_that) {
case _BranchDetail():
return $default(_that.id,_that.slug,_that.name,_that.city,_that.area,_that.addressLine,_that.phone,_that.latitude,_that.longitude,_that.imageUrl,_that.services,_that.deliveryFee,_that.minDeliveryOrder,_that.estimatedDeliveryMinutes,_that.estimatedPickupMinutes,_that.status,_that.email,_that.timezone,_that.hours,_that.paymentMethods,_that.taxRateCashBps,_that.taxRateCardBps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  String city,  String? area,  String addressLine,  String phone,  double? latitude,  double? longitude,  String? imageUrl,  BranchServices services,  int deliveryFee,  int minDeliveryOrder,  int estimatedDeliveryMinutes,  int estimatedPickupMinutes,  BranchOpenStatus status,  String? email,  String timezone,  List<BranchHours> hours,  Map<String, List<String>> paymentMethods,  int taxRateCashBps,  int taxRateCardBps)?  $default,) {final _that = this;
switch (_that) {
case _BranchDetail() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.city,_that.area,_that.addressLine,_that.phone,_that.latitude,_that.longitude,_that.imageUrl,_that.services,_that.deliveryFee,_that.minDeliveryOrder,_that.estimatedDeliveryMinutes,_that.estimatedPickupMinutes,_that.status,_that.email,_that.timezone,_that.hours,_that.paymentMethods,_that.taxRateCashBps,_that.taxRateCardBps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchDetail extends BranchDetail {
  const _BranchDetail({required this.id, required this.slug, required this.name, required this.city, this.area, required this.addressLine, required this.phone, this.latitude, this.longitude, this.imageUrl, required this.services, this.deliveryFee = 0, this.minDeliveryOrder = 0, this.estimatedDeliveryMinutes = 0, this.estimatedPickupMinutes = 0, required this.status, this.email, this.timezone = 'Asia/Karachi',  List<BranchHours> hours = const [],  Map<String, List<String>> paymentMethods = const {}, this.taxRateCashBps = 0, this.taxRateCardBps = 0}): _hours = hours,_paymentMethods = paymentMethods,super._();
  factory _BranchDetail.fromJson(Map<String, dynamic> json) => _$BranchDetailFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override final  String city;
@override final  String? area;
@override final  String addressLine;
@override final  String phone;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? imageUrl;
@override final  BranchServices services;
@override@JsonKey() final  int deliveryFee;
@override@JsonKey() final  int minDeliveryOrder;
@override@JsonKey() final  int estimatedDeliveryMinutes;
@override@JsonKey() final  int estimatedPickupMinutes;
@override final  BranchOpenStatus status;
@override final  String? email;
@override@JsonKey() final  String timezone;
 final  List<BranchHours> _hours;
@override@JsonKey() List<BranchHours> get hours {
  if (_hours is EqualUnmodifiableListView) return _hours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hours);
}

 final  Map<String, List<String>> _paymentMethods;
@override@JsonKey() Map<String, List<String>> get paymentMethods {
  if (_paymentMethods is EqualUnmodifiableMapView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_paymentMethods);
}

@override@JsonKey() final  int taxRateCashBps;
@override@JsonKey() final  int taxRateCardBps;

/// Create a copy of BranchDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchDetailCopyWith<_BranchDetail> get copyWith => __$BranchDetailCopyWithImpl<_BranchDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchDetailToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.area, area) || other.area == area)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.services, services) || other.services == services)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.minDeliveryOrder, minDeliveryOrder) || other.minDeliveryOrder == minDeliveryOrder)&&(identical(other.estimatedDeliveryMinutes, estimatedDeliveryMinutes) || other.estimatedDeliveryMinutes == estimatedDeliveryMinutes)&&(identical(other.estimatedPickupMinutes, estimatedPickupMinutes) || other.estimatedPickupMinutes == estimatedPickupMinutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&const DeepCollectionEquality().equals(other.hours, _hours)&&const DeepCollectionEquality().equals(other.paymentMethods, _paymentMethods)&&(identical(other.taxRateCashBps, taxRateCashBps) || other.taxRateCashBps == taxRateCashBps)&&(identical(other.taxRateCardBps, taxRateCardBps) || other.taxRateCardBps == taxRateCardBps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,slug,name,city,area,addressLine,phone,latitude,longitude,imageUrl,services,deliveryFee,minDeliveryOrder,estimatedDeliveryMinutes,estimatedPickupMinutes,status,email,timezone,const DeepCollectionEquality().hash(_hours),const DeepCollectionEquality().hash(_paymentMethods),taxRateCashBps,taxRateCardBps]);
}

@override
String toString() {
    return 'BranchDetail(id: $id, slug: $slug, name: $name, city: $city, area: $area, addressLine: $addressLine, phone: $phone, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl, services: $services, deliveryFee: $deliveryFee, minDeliveryOrder: $minDeliveryOrder, estimatedDeliveryMinutes: $estimatedDeliveryMinutes, estimatedPickupMinutes: $estimatedPickupMinutes, status: $status, email: $email, timezone: $timezone, hours: $hours, paymentMethods: $paymentMethods, taxRateCashBps: $taxRateCashBps, taxRateCardBps: $taxRateCardBps)';
}


}

/// @nodoc
abstract mixin class _$BranchDetailCopyWith<$Res> implements $BranchDetailCopyWith<$Res> {
  factory _$BranchDetailCopyWith(_BranchDetail value, $Res Function(_BranchDetail) _then) = __$BranchDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, String city, String? area, String addressLine, String phone, double? latitude, double? longitude, String? imageUrl, BranchServices services, int deliveryFee, int minDeliveryOrder, int estimatedDeliveryMinutes, int estimatedPickupMinutes, BranchOpenStatus status, String? email, String timezone, List<BranchHours> hours, Map<String, List<String>> paymentMethods, int taxRateCashBps, int taxRateCardBps
});


@override $BranchServicesCopyWith<$Res> get services;@override $BranchOpenStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$BranchDetailCopyWithImpl<$Res>
    implements _$BranchDetailCopyWith<$Res> {
  __$BranchDetailCopyWithImpl(this._self, this._then);

  final _BranchDetail _self;
  final $Res Function(_BranchDetail) _then;

/// Create a copy of BranchDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? city = null,Object? area = freezed,Object? addressLine = null,Object? phone = null,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? services = null,Object? deliveryFee = null,Object? minDeliveryOrder = null,Object? estimatedDeliveryMinutes = null,Object? estimatedPickupMinutes = null,Object? status = null,Object? email = freezed,Object? timezone = null,Object? hours = null,Object? paymentMethods = null,Object? taxRateCashBps = null,Object? taxRateCardBps = null,}) {
  return _then(_BranchDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as BranchServices,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int,minDeliveryOrder: null == minDeliveryOrder ? _self.minDeliveryOrder : minDeliveryOrder // ignore: cast_nullable_to_non_nullable
as int,estimatedDeliveryMinutes: null == estimatedDeliveryMinutes ? _self.estimatedDeliveryMinutes : estimatedDeliveryMinutes // ignore: cast_nullable_to_non_nullable
as int,estimatedPickupMinutes: null == estimatedPickupMinutes ? _self.estimatedPickupMinutes : estimatedPickupMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BranchOpenStatus,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,hours: null == hours ? _self._hours : hours // ignore: cast_nullable_to_non_nullable
as List<BranchHours>,paymentMethods: null == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,taxRateCashBps: null == taxRateCashBps ? _self.taxRateCashBps : taxRateCashBps // ignore: cast_nullable_to_non_nullable
as int,taxRateCardBps: null == taxRateCardBps ? _self.taxRateCardBps : taxRateCardBps // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of BranchDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchServicesCopyWith<$Res> get services {
  
  return $BranchServicesCopyWith<$Res>(_self.services, (value) {
    return _then(_self.copyWith(services: value));
  });
}/// Create a copy of BranchDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchOpenStatusCopyWith<$Res> get status {
  
  return $BranchOpenStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
