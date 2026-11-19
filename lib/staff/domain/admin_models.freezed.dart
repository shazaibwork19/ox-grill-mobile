// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BranchAdmin {

 String get id; String get slug; String get name; String get city; String? get area; String get addressLine; String get phone; double? get latitude; double? get longitude; String? get imageUrl; BranchServices get services; int get deliveryFee; int get minDeliveryOrder; int get estimatedDeliveryMinutes; int get estimatedPickupMinutes; BranchOpenStatus get status; String? get email; String get timezone; int get seatingCapacity; List<BranchHours> get hours; int get taxRateCashBps; int get taxRateCardBps; bool get isActive; bool get acceptsOrders; bool get enforceOpeningHours; double? get deliveryRadiusKm; int get avgTableTurnoverMinutes; int get reservationDurationMinutes; int get staffCount;
/// Create a copy of BranchAdmin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchAdminCopyWith<BranchAdmin> get copyWith => _$BranchAdminCopyWithImpl<BranchAdmin>(this as BranchAdmin, _$identity);

  /// Serializes this BranchAdmin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BranchAdmin;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchAdmin&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.addressLine, _this.addressLine) || other.addressLine == _this.addressLine)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.services, _this.services) || other.services == _this.services)&&(identical(other.deliveryFee, _this.deliveryFee) || other.deliveryFee == _this.deliveryFee)&&(identical(other.minDeliveryOrder, _this.minDeliveryOrder) || other.minDeliveryOrder == _this.minDeliveryOrder)&&(identical(other.estimatedDeliveryMinutes, _this.estimatedDeliveryMinutes) || other.estimatedDeliveryMinutes == _this.estimatedDeliveryMinutes)&&(identical(other.estimatedPickupMinutes, _this.estimatedPickupMinutes) || other.estimatedPickupMinutes == _this.estimatedPickupMinutes)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.seatingCapacity, _this.seatingCapacity) || other.seatingCapacity == _this.seatingCapacity)&&const DeepCollectionEquality().equals(other.hours, _this.hours)&&(identical(other.taxRateCashBps, _this.taxRateCashBps) || other.taxRateCashBps == _this.taxRateCashBps)&&(identical(other.taxRateCardBps, _this.taxRateCardBps) || other.taxRateCardBps == _this.taxRateCardBps)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.acceptsOrders, _this.acceptsOrders) || other.acceptsOrders == _this.acceptsOrders)&&(identical(other.enforceOpeningHours, _this.enforceOpeningHours) || other.enforceOpeningHours == _this.enforceOpeningHours)&&(identical(other.deliveryRadiusKm, _this.deliveryRadiusKm) || other.deliveryRadiusKm == _this.deliveryRadiusKm)&&(identical(other.avgTableTurnoverMinutes, _this.avgTableTurnoverMinutes) || other.avgTableTurnoverMinutes == _this.avgTableTurnoverMinutes)&&(identical(other.reservationDurationMinutes, _this.reservationDurationMinutes) || other.reservationDurationMinutes == _this.reservationDurationMinutes)&&(identical(other.staffCount, _this.staffCount) || other.staffCount == _this.staffCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BranchAdmin;
  return Object.hashAll([runtimeType,_this.id,_this.slug,_this.name,_this.city,_this.area,_this.addressLine,_this.phone,_this.latitude,_this.longitude,_this.imageUrl,_this.services,_this.deliveryFee,_this.minDeliveryOrder,_this.estimatedDeliveryMinutes,_this.estimatedPickupMinutes,_this.status,_this.email,_this.timezone,_this.seatingCapacity,const DeepCollectionEquality().hash(_this.hours),_this.taxRateCashBps,_this.taxRateCardBps,_this.isActive,_this.acceptsOrders,_this.enforceOpeningHours,_this.deliveryRadiusKm,_this.avgTableTurnoverMinutes,_this.reservationDurationMinutes,_this.staffCount]);
}

@override
String toString() {
  final _this = this as BranchAdmin;
  return 'BranchAdmin(id: ${_this.id}, slug: ${_this.slug}, name: ${_this.name}, city: ${_this.city}, area: ${_this.area}, addressLine: ${_this.addressLine}, phone: ${_this.phone}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, imageUrl: ${_this.imageUrl}, services: ${_this.services}, deliveryFee: ${_this.deliveryFee}, minDeliveryOrder: ${_this.minDeliveryOrder}, estimatedDeliveryMinutes: ${_this.estimatedDeliveryMinutes}, estimatedPickupMinutes: ${_this.estimatedPickupMinutes}, status: ${_this.status}, email: ${_this.email}, timezone: ${_this.timezone}, seatingCapacity: ${_this.seatingCapacity}, hours: ${_this.hours}, taxRateCashBps: ${_this.taxRateCashBps}, taxRateCardBps: ${_this.taxRateCardBps}, isActive: ${_this.isActive}, acceptsOrders: ${_this.acceptsOrders}, enforceOpeningHours: ${_this.enforceOpeningHours}, deliveryRadiusKm: ${_this.deliveryRadiusKm}, avgTableTurnoverMinutes: ${_this.avgTableTurnoverMinutes}, reservationDurationMinutes: ${_this.reservationDurationMinutes}, staffCount: ${_this.staffCount})';
}


}

/// @nodoc
abstract mixin class $BranchAdminCopyWith<$Res>  {
  factory $BranchAdminCopyWith(BranchAdmin value, $Res Function(BranchAdmin) _then) = _$BranchAdminCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, String city, String? area, String addressLine, String phone, double? latitude, double? longitude, String? imageUrl, BranchServices services, int deliveryFee, int minDeliveryOrder, int estimatedDeliveryMinutes, int estimatedPickupMinutes, BranchOpenStatus status, String? email, String timezone, int seatingCapacity, List<BranchHours> hours, int taxRateCashBps, int taxRateCardBps, bool isActive, bool acceptsOrders, bool enforceOpeningHours, double? deliveryRadiusKm, int avgTableTurnoverMinutes, int reservationDurationMinutes, int staffCount
});


$BranchServicesCopyWith<$Res> get services;$BranchOpenStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$BranchAdminCopyWithImpl<$Res>
    implements $BranchAdminCopyWith<$Res> {
  _$BranchAdminCopyWithImpl(this._self, this._then);

  final BranchAdmin _self;
  final $Res Function(BranchAdmin) _then;

/// Create a copy of BranchAdmin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? city = null,Object? area = freezed,Object? addressLine = null,Object? phone = null,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? services = null,Object? deliveryFee = null,Object? minDeliveryOrder = null,Object? estimatedDeliveryMinutes = null,Object? estimatedPickupMinutes = null,Object? status = null,Object? email = freezed,Object? timezone = null,Object? seatingCapacity = null,Object? hours = null,Object? taxRateCashBps = null,Object? taxRateCardBps = null,Object? isActive = null,Object? acceptsOrders = null,Object? enforceOpeningHours = null,Object? deliveryRadiusKm = freezed,Object? avgTableTurnoverMinutes = null,Object? reservationDurationMinutes = null,Object? staffCount = null,}) {
  return _then(BranchAdmin(
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
as String,seatingCapacity: null == seatingCapacity ? _self.seatingCapacity : seatingCapacity // ignore: cast_nullable_to_non_nullable
as int,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as List<BranchHours>,taxRateCashBps: null == taxRateCashBps ? _self.taxRateCashBps : taxRateCashBps // ignore: cast_nullable_to_non_nullable
as int,taxRateCardBps: null == taxRateCardBps ? _self.taxRateCardBps : taxRateCardBps // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,acceptsOrders: null == acceptsOrders ? _self.acceptsOrders : acceptsOrders // ignore: cast_nullable_to_non_nullable
as bool,enforceOpeningHours: null == enforceOpeningHours ? _self.enforceOpeningHours : enforceOpeningHours // ignore: cast_nullable_to_non_nullable
as bool,deliveryRadiusKm: freezed == deliveryRadiusKm ? _self.deliveryRadiusKm : deliveryRadiusKm // ignore: cast_nullable_to_non_nullable
as double?,avgTableTurnoverMinutes: null == avgTableTurnoverMinutes ? _self.avgTableTurnoverMinutes : avgTableTurnoverMinutes // ignore: cast_nullable_to_non_nullable
as int,reservationDurationMinutes: null == reservationDurationMinutes ? _self.reservationDurationMinutes : reservationDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,staffCount: null == staffCount ? _self.staffCount : staffCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of BranchAdmin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchServicesCopyWith<$Res> get services {
  
  return $BranchServicesCopyWith<$Res>(_self.services, (value) {
    return _then(_self.copyWith(services: value));
  });
}/// Create a copy of BranchAdmin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchOpenStatusCopyWith<$Res> get status {
  
  return $BranchOpenStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [BranchAdmin].
extension BranchAdminPatterns on BranchAdmin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchAdmin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchAdmin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchAdmin value)  $default,){
final _that = this;
switch (_that) {
case _BranchAdmin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchAdmin value)?  $default,){
final _that = this;
switch (_that) {
case _BranchAdmin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String city,  String? area,  String addressLine,  String phone,  double? latitude,  double? longitude,  String? imageUrl,  BranchServices services,  int deliveryFee,  int minDeliveryOrder,  int estimatedDeliveryMinutes,  int estimatedPickupMinutes,  BranchOpenStatus status,  String? email,  String timezone,  int seatingCapacity,  List<BranchHours> hours,  int taxRateCashBps,  int taxRateCardBps,  bool isActive,  bool acceptsOrders,  bool enforceOpeningHours,  double? deliveryRadiusKm,  int avgTableTurnoverMinutes,  int reservationDurationMinutes,  int staffCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchAdmin() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.city,_that.area,_that.addressLine,_that.phone,_that.latitude,_that.longitude,_that.imageUrl,_that.services,_that.deliveryFee,_that.minDeliveryOrder,_that.estimatedDeliveryMinutes,_that.estimatedPickupMinutes,_that.status,_that.email,_that.timezone,_that.seatingCapacity,_that.hours,_that.taxRateCashBps,_that.taxRateCardBps,_that.isActive,_that.acceptsOrders,_that.enforceOpeningHours,_that.deliveryRadiusKm,_that.avgTableTurnoverMinutes,_that.reservationDurationMinutes,_that.staffCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String city,  String? area,  String addressLine,  String phone,  double? latitude,  double? longitude,  String? imageUrl,  BranchServices services,  int deliveryFee,  int minDeliveryOrder,  int estimatedDeliveryMinutes,  int estimatedPickupMinutes,  BranchOpenStatus status,  String? email,  String timezone,  int seatingCapacity,  List<BranchHours> hours,  int taxRateCashBps,  int taxRateCardBps,  bool isActive,  bool acceptsOrders,  bool enforceOpeningHours,  double? deliveryRadiusKm,  int avgTableTurnoverMinutes,  int reservationDurationMinutes,  int staffCount)  $default,) {final _that = this;
switch (_that) {
case _BranchAdmin():
return $default(_that.id,_that.slug,_that.name,_that.city,_that.area,_that.addressLine,_that.phone,_that.latitude,_that.longitude,_that.imageUrl,_that.services,_that.deliveryFee,_that.minDeliveryOrder,_that.estimatedDeliveryMinutes,_that.estimatedPickupMinutes,_that.status,_that.email,_that.timezone,_that.seatingCapacity,_that.hours,_that.taxRateCashBps,_that.taxRateCardBps,_that.isActive,_that.acceptsOrders,_that.enforceOpeningHours,_that.deliveryRadiusKm,_that.avgTableTurnoverMinutes,_that.reservationDurationMinutes,_that.staffCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  String city,  String? area,  String addressLine,  String phone,  double? latitude,  double? longitude,  String? imageUrl,  BranchServices services,  int deliveryFee,  int minDeliveryOrder,  int estimatedDeliveryMinutes,  int estimatedPickupMinutes,  BranchOpenStatus status,  String? email,  String timezone,  int seatingCapacity,  List<BranchHours> hours,  int taxRateCashBps,  int taxRateCardBps,  bool isActive,  bool acceptsOrders,  bool enforceOpeningHours,  double? deliveryRadiusKm,  int avgTableTurnoverMinutes,  int reservationDurationMinutes,  int staffCount)?  $default,) {final _that = this;
switch (_that) {
case _BranchAdmin() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.city,_that.area,_that.addressLine,_that.phone,_that.latitude,_that.longitude,_that.imageUrl,_that.services,_that.deliveryFee,_that.minDeliveryOrder,_that.estimatedDeliveryMinutes,_that.estimatedPickupMinutes,_that.status,_that.email,_that.timezone,_that.seatingCapacity,_that.hours,_that.taxRateCashBps,_that.taxRateCardBps,_that.isActive,_that.acceptsOrders,_that.enforceOpeningHours,_that.deliveryRadiusKm,_that.avgTableTurnoverMinutes,_that.reservationDurationMinutes,_that.staffCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchAdmin implements BranchAdmin {
  const _BranchAdmin({required this.id, required this.slug, required this.name, required this.city, this.area, required this.addressLine, required this.phone, this.latitude, this.longitude, this.imageUrl, required this.services, this.deliveryFee = 0, this.minDeliveryOrder = 0, this.estimatedDeliveryMinutes = 45, this.estimatedPickupMinutes = 20, required this.status, this.email, this.timezone = 'Asia/Karachi', this.seatingCapacity = 0,  List<BranchHours> hours = const [], this.taxRateCashBps = 0, this.taxRateCardBps = 0, this.isActive = true, this.acceptsOrders = true, this.enforceOpeningHours = true, this.deliveryRadiusKm, this.avgTableTurnoverMinutes = 60, this.reservationDurationMinutes = 90, this.staffCount = 0}): _hours = hours;
  factory _BranchAdmin.fromJson(Map<String, dynamic> json) => _$BranchAdminFromJson(json);

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
@override@JsonKey() final  int seatingCapacity;
 final  List<BranchHours> _hours;
@override@JsonKey() List<BranchHours> get hours {
  if (_hours is EqualUnmodifiableListView) return _hours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hours);
}

@override@JsonKey() final  int taxRateCashBps;
@override@JsonKey() final  int taxRateCardBps;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  bool acceptsOrders;
@override@JsonKey() final  bool enforceOpeningHours;
@override final  double? deliveryRadiusKm;
@override@JsonKey() final  int avgTableTurnoverMinutes;
@override@JsonKey() final  int reservationDurationMinutes;
@override@JsonKey() final  int staffCount;

/// Create a copy of BranchAdmin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchAdminCopyWith<_BranchAdmin> get copyWith => __$BranchAdminCopyWithImpl<_BranchAdmin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchAdminToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchAdmin&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.area, area) || other.area == area)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.services, services) || other.services == services)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.minDeliveryOrder, minDeliveryOrder) || other.minDeliveryOrder == minDeliveryOrder)&&(identical(other.estimatedDeliveryMinutes, estimatedDeliveryMinutes) || other.estimatedDeliveryMinutes == estimatedDeliveryMinutes)&&(identical(other.estimatedPickupMinutes, estimatedPickupMinutes) || other.estimatedPickupMinutes == estimatedPickupMinutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.seatingCapacity, seatingCapacity) || other.seatingCapacity == seatingCapacity)&&const DeepCollectionEquality().equals(other.hours, _hours)&&(identical(other.taxRateCashBps, taxRateCashBps) || other.taxRateCashBps == taxRateCashBps)&&(identical(other.taxRateCardBps, taxRateCardBps) || other.taxRateCardBps == taxRateCardBps)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.acceptsOrders, acceptsOrders) || other.acceptsOrders == acceptsOrders)&&(identical(other.enforceOpeningHours, enforceOpeningHours) || other.enforceOpeningHours == enforceOpeningHours)&&(identical(other.deliveryRadiusKm, deliveryRadiusKm) || other.deliveryRadiusKm == deliveryRadiusKm)&&(identical(other.avgTableTurnoverMinutes, avgTableTurnoverMinutes) || other.avgTableTurnoverMinutes == avgTableTurnoverMinutes)&&(identical(other.reservationDurationMinutes, reservationDurationMinutes) || other.reservationDurationMinutes == reservationDurationMinutes)&&(identical(other.staffCount, staffCount) || other.staffCount == staffCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,slug,name,city,area,addressLine,phone,latitude,longitude,imageUrl,services,deliveryFee,minDeliveryOrder,estimatedDeliveryMinutes,estimatedPickupMinutes,status,email,timezone,seatingCapacity,const DeepCollectionEquality().hash(_hours),taxRateCashBps,taxRateCardBps,isActive,acceptsOrders,enforceOpeningHours,deliveryRadiusKm,avgTableTurnoverMinutes,reservationDurationMinutes,staffCount]);
}

@override
String toString() {
    return 'BranchAdmin(id: $id, slug: $slug, name: $name, city: $city, area: $area, addressLine: $addressLine, phone: $phone, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl, services: $services, deliveryFee: $deliveryFee, minDeliveryOrder: $minDeliveryOrder, estimatedDeliveryMinutes: $estimatedDeliveryMinutes, estimatedPickupMinutes: $estimatedPickupMinutes, status: $status, email: $email, timezone: $timezone, seatingCapacity: $seatingCapacity, hours: $hours, taxRateCashBps: $taxRateCashBps, taxRateCardBps: $taxRateCardBps, isActive: $isActive, acceptsOrders: $acceptsOrders, enforceOpeningHours: $enforceOpeningHours, deliveryRadiusKm: $deliveryRadiusKm, avgTableTurnoverMinutes: $avgTableTurnoverMinutes, reservationDurationMinutes: $reservationDurationMinutes, staffCount: $staffCount)';
}


}

/// @nodoc
abstract mixin class _$BranchAdminCopyWith<$Res> implements $BranchAdminCopyWith<$Res> {
  factory _$BranchAdminCopyWith(_BranchAdmin value, $Res Function(_BranchAdmin) _then) = __$BranchAdminCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, String city, String? area, String addressLine, String phone, double? latitude, double? longitude, String? imageUrl, BranchServices services, int deliveryFee, int minDeliveryOrder, int estimatedDeliveryMinutes, int estimatedPickupMinutes, BranchOpenStatus status, String? email, String timezone, int seatingCapacity, List<BranchHours> hours, int taxRateCashBps, int taxRateCardBps, bool isActive, bool acceptsOrders, bool enforceOpeningHours, double? deliveryRadiusKm, int avgTableTurnoverMinutes, int reservationDurationMinutes, int staffCount
});


@override $BranchServicesCopyWith<$Res> get services;@override $BranchOpenStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$BranchAdminCopyWithImpl<$Res>
    implements _$BranchAdminCopyWith<$Res> {
  __$BranchAdminCopyWithImpl(this._self, this._then);

  final _BranchAdmin _self;
  final $Res Function(_BranchAdmin) _then;

/// Create a copy of BranchAdmin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? city = null,Object? area = freezed,Object? addressLine = null,Object? phone = null,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? services = null,Object? deliveryFee = null,Object? minDeliveryOrder = null,Object? estimatedDeliveryMinutes = null,Object? estimatedPickupMinutes = null,Object? status = null,Object? email = freezed,Object? timezone = null,Object? seatingCapacity = null,Object? hours = null,Object? taxRateCashBps = null,Object? taxRateCardBps = null,Object? isActive = null,Object? acceptsOrders = null,Object? enforceOpeningHours = null,Object? deliveryRadiusKm = freezed,Object? avgTableTurnoverMinutes = null,Object? reservationDurationMinutes = null,Object? staffCount = null,}) {
  return _then(_BranchAdmin(
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
as String,seatingCapacity: null == seatingCapacity ? _self.seatingCapacity : seatingCapacity // ignore: cast_nullable_to_non_nullable
as int,hours: null == hours ? _self._hours : hours // ignore: cast_nullable_to_non_nullable
as List<BranchHours>,taxRateCashBps: null == taxRateCashBps ? _self.taxRateCashBps : taxRateCashBps // ignore: cast_nullable_to_non_nullable
as int,taxRateCardBps: null == taxRateCardBps ? _self.taxRateCardBps : taxRateCardBps // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,acceptsOrders: null == acceptsOrders ? _self.acceptsOrders : acceptsOrders // ignore: cast_nullable_to_non_nullable
as bool,enforceOpeningHours: null == enforceOpeningHours ? _self.enforceOpeningHours : enforceOpeningHours // ignore: cast_nullable_to_non_nullable
as bool,deliveryRadiusKm: freezed == deliveryRadiusKm ? _self.deliveryRadiusKm : deliveryRadiusKm // ignore: cast_nullable_to_non_nullable
as double?,avgTableTurnoverMinutes: null == avgTableTurnoverMinutes ? _self.avgTableTurnoverMinutes : avgTableTurnoverMinutes // ignore: cast_nullable_to_non_nullable
as int,reservationDurationMinutes: null == reservationDurationMinutes ? _self.reservationDurationMinutes : reservationDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,staffCount: null == staffCount ? _self.staffCount : staffCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of BranchAdmin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchServicesCopyWith<$Res> get services {
  
  return $BranchServicesCopyWith<$Res>(_self.services, (value) {
    return _then(_self.copyWith(services: value));
  });
}/// Create a copy of BranchAdmin
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
mixin _$AdminMenuItem {

 String get id; String get slug; String get name; String get description; String? get imageUrl; String get categoryId; String get categoryName; int get basePrice; bool get isFeatured; int get preparationMinutes; List<String> get tags; List<String> get dietary; String? get comboRole; bool get hasOptions; bool get isActive; int get sortOrder; List<MenuOptionGroup> get optionGroups; int get branchCount;
/// Create a copy of AdminMenuItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminMenuItemCopyWith<AdminMenuItem> get copyWith => _$AdminMenuItemCopyWithImpl<AdminMenuItem>(this as AdminMenuItem, _$identity);

  /// Serializes this AdminMenuItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AdminMenuItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminMenuItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.categoryName, _this.categoryName) || other.categoryName == _this.categoryName)&&(identical(other.basePrice, _this.basePrice) || other.basePrice == _this.basePrice)&&(identical(other.isFeatured, _this.isFeatured) || other.isFeatured == _this.isFeatured)&&(identical(other.preparationMinutes, _this.preparationMinutes) || other.preparationMinutes == _this.preparationMinutes)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&const DeepCollectionEquality().equals(other.dietary, _this.dietary)&&(identical(other.comboRole, _this.comboRole) || other.comboRole == _this.comboRole)&&(identical(other.hasOptions, _this.hasOptions) || other.hasOptions == _this.hasOptions)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&const DeepCollectionEquality().equals(other.optionGroups, _this.optionGroups)&&(identical(other.branchCount, _this.branchCount) || other.branchCount == _this.branchCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AdminMenuItem;
  return Object.hash(runtimeType,_this.id,_this.slug,_this.name,_this.description,_this.imageUrl,_this.categoryId,_this.categoryName,_this.basePrice,_this.isFeatured,_this.preparationMinutes,const DeepCollectionEquality().hash(_this.tags),const DeepCollectionEquality().hash(_this.dietary),_this.comboRole,_this.hasOptions,_this.isActive,_this.sortOrder,const DeepCollectionEquality().hash(_this.optionGroups),_this.branchCount);
}

@override
String toString() {
  final _this = this as AdminMenuItem;
  return 'AdminMenuItem(id: ${_this.id}, slug: ${_this.slug}, name: ${_this.name}, description: ${_this.description}, imageUrl: ${_this.imageUrl}, categoryId: ${_this.categoryId}, categoryName: ${_this.categoryName}, basePrice: ${_this.basePrice}, isFeatured: ${_this.isFeatured}, preparationMinutes: ${_this.preparationMinutes}, tags: ${_this.tags}, dietary: ${_this.dietary}, comboRole: ${_this.comboRole}, hasOptions: ${_this.hasOptions}, isActive: ${_this.isActive}, sortOrder: ${_this.sortOrder}, optionGroups: ${_this.optionGroups}, branchCount: ${_this.branchCount})';
}


}

/// @nodoc
abstract mixin class $AdminMenuItemCopyWith<$Res>  {
  factory $AdminMenuItemCopyWith(AdminMenuItem value, $Res Function(AdminMenuItem) _then) = _$AdminMenuItemCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, String description, String? imageUrl, String categoryId, String categoryName, int basePrice, bool isFeatured, int preparationMinutes, List<String> tags, List<String> dietary, String? comboRole, bool hasOptions, bool isActive, int sortOrder, List<MenuOptionGroup> optionGroups, int branchCount
});




}
/// @nodoc
class _$AdminMenuItemCopyWithImpl<$Res>
    implements $AdminMenuItemCopyWith<$Res> {
  _$AdminMenuItemCopyWithImpl(this._self, this._then);

  final AdminMenuItem _self;
  final $Res Function(AdminMenuItem) _then;

/// Create a copy of AdminMenuItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? description = null,Object? imageUrl = freezed,Object? categoryId = null,Object? categoryName = null,Object? basePrice = null,Object? isFeatured = null,Object? preparationMinutes = null,Object? tags = null,Object? dietary = null,Object? comboRole = freezed,Object? hasOptions = null,Object? isActive = null,Object? sortOrder = null,Object? optionGroups = null,Object? branchCount = null,}) {
  return _then(AdminMenuItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,preparationMinutes: null == preparationMinutes ? _self.preparationMinutes : preparationMinutes // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,dietary: null == dietary ? _self.dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<String>,comboRole: freezed == comboRole ? _self.comboRole : comboRole // ignore: cast_nullable_to_non_nullable
as String?,hasOptions: null == hasOptions ? _self.hasOptions : hasOptions // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,optionGroups: null == optionGroups ? _self.optionGroups : optionGroups // ignore: cast_nullable_to_non_nullable
as List<MenuOptionGroup>,branchCount: null == branchCount ? _self.branchCount : branchCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminMenuItem].
extension AdminMenuItemPatterns on AdminMenuItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminMenuItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminMenuItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminMenuItem value)  $default,){
final _that = this;
switch (_that) {
case _AdminMenuItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminMenuItem value)?  $default,){
final _that = this;
switch (_that) {
case _AdminMenuItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String description,  String? imageUrl,  String categoryId,  String categoryName,  int basePrice,  bool isFeatured,  int preparationMinutes,  List<String> tags,  List<String> dietary,  String? comboRole,  bool hasOptions,  bool isActive,  int sortOrder,  List<MenuOptionGroup> optionGroups,  int branchCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminMenuItem() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.description,_that.imageUrl,_that.categoryId,_that.categoryName,_that.basePrice,_that.isFeatured,_that.preparationMinutes,_that.tags,_that.dietary,_that.comboRole,_that.hasOptions,_that.isActive,_that.sortOrder,_that.optionGroups,_that.branchCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String description,  String? imageUrl,  String categoryId,  String categoryName,  int basePrice,  bool isFeatured,  int preparationMinutes,  List<String> tags,  List<String> dietary,  String? comboRole,  bool hasOptions,  bool isActive,  int sortOrder,  List<MenuOptionGroup> optionGroups,  int branchCount)  $default,) {final _that = this;
switch (_that) {
case _AdminMenuItem():
return $default(_that.id,_that.slug,_that.name,_that.description,_that.imageUrl,_that.categoryId,_that.categoryName,_that.basePrice,_that.isFeatured,_that.preparationMinutes,_that.tags,_that.dietary,_that.comboRole,_that.hasOptions,_that.isActive,_that.sortOrder,_that.optionGroups,_that.branchCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  String description,  String? imageUrl,  String categoryId,  String categoryName,  int basePrice,  bool isFeatured,  int preparationMinutes,  List<String> tags,  List<String> dietary,  String? comboRole,  bool hasOptions,  bool isActive,  int sortOrder,  List<MenuOptionGroup> optionGroups,  int branchCount)?  $default,) {final _that = this;
switch (_that) {
case _AdminMenuItem() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.description,_that.imageUrl,_that.categoryId,_that.categoryName,_that.basePrice,_that.isFeatured,_that.preparationMinutes,_that.tags,_that.dietary,_that.comboRole,_that.hasOptions,_that.isActive,_that.sortOrder,_that.optionGroups,_that.branchCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminMenuItem implements AdminMenuItem {
  const _AdminMenuItem({required this.id, required this.slug, required this.name, this.description = '', this.imageUrl, required this.categoryId, this.categoryName = '', required this.basePrice, this.isFeatured = false, this.preparationMinutes = 0,  List<String> tags = const [],  List<String> dietary = const [], this.comboRole, this.hasOptions = false, this.isActive = true, this.sortOrder = 0,  List<MenuOptionGroup> optionGroups = const [], this.branchCount = 0}): _tags = tags,_dietary = dietary,_optionGroups = optionGroups;
  factory _AdminMenuItem.fromJson(Map<String, dynamic> json) => _$AdminMenuItemFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override@JsonKey() final  String description;
@override final  String? imageUrl;
@override final  String categoryId;
@override@JsonKey() final  String categoryName;
@override final  int basePrice;
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
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  int sortOrder;
 final  List<MenuOptionGroup> _optionGroups;
@override@JsonKey() List<MenuOptionGroup> get optionGroups {
  if (_optionGroups is EqualUnmodifiableListView) return _optionGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optionGroups);
}

@override@JsonKey() final  int branchCount;

/// Create a copy of AdminMenuItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminMenuItemCopyWith<_AdminMenuItem> get copyWith => __$AdminMenuItemCopyWithImpl<_AdminMenuItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminMenuItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminMenuItem&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.preparationMinutes, preparationMinutes) || other.preparationMinutes == preparationMinutes)&&const DeepCollectionEquality().equals(other.tags, _tags)&&const DeepCollectionEquality().equals(other.dietary, _dietary)&&(identical(other.comboRole, comboRole) || other.comboRole == comboRole)&&(identical(other.hasOptions, hasOptions) || other.hasOptions == hasOptions)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other.optionGroups, _optionGroups)&&(identical(other.branchCount, branchCount) || other.branchCount == branchCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,slug,name,description,imageUrl,categoryId,categoryName,basePrice,isFeatured,preparationMinutes,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_dietary),comboRole,hasOptions,isActive,sortOrder,const DeepCollectionEquality().hash(_optionGroups),branchCount);
}

@override
String toString() {
    return 'AdminMenuItem(id: $id, slug: $slug, name: $name, description: $description, imageUrl: $imageUrl, categoryId: $categoryId, categoryName: $categoryName, basePrice: $basePrice, isFeatured: $isFeatured, preparationMinutes: $preparationMinutes, tags: $tags, dietary: $dietary, comboRole: $comboRole, hasOptions: $hasOptions, isActive: $isActive, sortOrder: $sortOrder, optionGroups: $optionGroups, branchCount: $branchCount)';
}


}

/// @nodoc
abstract mixin class _$AdminMenuItemCopyWith<$Res> implements $AdminMenuItemCopyWith<$Res> {
  factory _$AdminMenuItemCopyWith(_AdminMenuItem value, $Res Function(_AdminMenuItem) _then) = __$AdminMenuItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, String description, String? imageUrl, String categoryId, String categoryName, int basePrice, bool isFeatured, int preparationMinutes, List<String> tags, List<String> dietary, String? comboRole, bool hasOptions, bool isActive, int sortOrder, List<MenuOptionGroup> optionGroups, int branchCount
});




}
/// @nodoc
class __$AdminMenuItemCopyWithImpl<$Res>
    implements _$AdminMenuItemCopyWith<$Res> {
  __$AdminMenuItemCopyWithImpl(this._self, this._then);

  final _AdminMenuItem _self;
  final $Res Function(_AdminMenuItem) _then;

/// Create a copy of AdminMenuItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? description = null,Object? imageUrl = freezed,Object? categoryId = null,Object? categoryName = null,Object? basePrice = null,Object? isFeatured = null,Object? preparationMinutes = null,Object? tags = null,Object? dietary = null,Object? comboRole = freezed,Object? hasOptions = null,Object? isActive = null,Object? sortOrder = null,Object? optionGroups = null,Object? branchCount = null,}) {
  return _then(_AdminMenuItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,preparationMinutes: null == preparationMinutes ? _self.preparationMinutes : preparationMinutes // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,dietary: null == dietary ? _self._dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<String>,comboRole: freezed == comboRole ? _self.comboRole : comboRole // ignore: cast_nullable_to_non_nullable
as String?,hasOptions: null == hasOptions ? _self.hasOptions : hasOptions // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,optionGroups: null == optionGroups ? _self._optionGroups : optionGroups // ignore: cast_nullable_to_non_nullable
as List<MenuOptionGroup>,branchCount: null == branchCount ? _self.branchCount : branchCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AdminUser {

 String get id; String? get name; String? get email; String? get phone; String get status; DateTime? get lastLoginAt; DateTime get createdAt; bool get isYou;
/// Create a copy of AdminUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminUserCopyWith<AdminUser> get copyWith => _$AdminUserCopyWithImpl<AdminUser>(this as AdminUser, _$identity);

  /// Serializes this AdminUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AdminUser;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminUser&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.lastLoginAt, _this.lastLoginAt) || other.lastLoginAt == _this.lastLoginAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.isYou, _this.isYou) || other.isYou == _this.isYou));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AdminUser;
  return Object.hash(runtimeType,_this.id,_this.name,_this.email,_this.phone,_this.status,_this.lastLoginAt,_this.createdAt,_this.isYou);
}

@override
String toString() {
  final _this = this as AdminUser;
  return 'AdminUser(id: ${_this.id}, name: ${_this.name}, email: ${_this.email}, phone: ${_this.phone}, status: ${_this.status}, lastLoginAt: ${_this.lastLoginAt}, createdAt: ${_this.createdAt}, isYou: ${_this.isYou})';
}


}

/// @nodoc
abstract mixin class $AdminUserCopyWith<$Res>  {
  factory $AdminUserCopyWith(AdminUser value, $Res Function(AdminUser) _then) = _$AdminUserCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? email, String? phone, String status, DateTime? lastLoginAt, DateTime createdAt, bool isYou
});




}
/// @nodoc
class _$AdminUserCopyWithImpl<$Res>
    implements $AdminUserCopyWith<$Res> {
  _$AdminUserCopyWithImpl(this._self, this._then);

  final AdminUser _self;
  final $Res Function(AdminUser) _then;

/// Create a copy of AdminUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? status = null,Object? lastLoginAt = freezed,Object? createdAt = null,Object? isYou = null,}) {
  return _then(AdminUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isYou: null == isYou ? _self.isYou : isYou // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminUser].
extension AdminUserPatterns on AdminUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminUser value)  $default,){
final _that = this;
switch (_that) {
case _AdminUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminUser value)?  $default,){
final _that = this;
switch (_that) {
case _AdminUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? email,  String? phone,  String status,  DateTime? lastLoginAt,  DateTime createdAt,  bool isYou)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminUser() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.status,_that.lastLoginAt,_that.createdAt,_that.isYou);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? email,  String? phone,  String status,  DateTime? lastLoginAt,  DateTime createdAt,  bool isYou)  $default,) {final _that = this;
switch (_that) {
case _AdminUser():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.status,_that.lastLoginAt,_that.createdAt,_that.isYou);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? email,  String? phone,  String status,  DateTime? lastLoginAt,  DateTime createdAt,  bool isYou)?  $default,) {final _that = this;
switch (_that) {
case _AdminUser() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.status,_that.lastLoginAt,_that.createdAt,_that.isYou);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminUser implements AdminUser {
  const _AdminUser({required this.id, this.name, this.email, this.phone, required this.status, this.lastLoginAt, required this.createdAt, this.isYou = false});
  factory _AdminUser.fromJson(Map<String, dynamic> json) => _$AdminUserFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? email;
@override final  String? phone;
@override final  String status;
@override final  DateTime? lastLoginAt;
@override final  DateTime createdAt;
@override@JsonKey() final  bool isYou;

/// Create a copy of AdminUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminUserCopyWith<_AdminUser> get copyWith => __$AdminUserCopyWithImpl<_AdminUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminUserToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isYou, isYou) || other.isYou == isYou));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,email,phone,status,lastLoginAt,createdAt,isYou);
}

@override
String toString() {
    return 'AdminUser(id: $id, name: $name, email: $email, phone: $phone, status: $status, lastLoginAt: $lastLoginAt, createdAt: $createdAt, isYou: $isYou)';
}


}

/// @nodoc
abstract mixin class _$AdminUserCopyWith<$Res> implements $AdminUserCopyWith<$Res> {
  factory _$AdminUserCopyWith(_AdminUser value, $Res Function(_AdminUser) _then) = __$AdminUserCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? email, String? phone, String status, DateTime? lastLoginAt, DateTime createdAt, bool isYou
});




}
/// @nodoc
class __$AdminUserCopyWithImpl<$Res>
    implements _$AdminUserCopyWith<$Res> {
  __$AdminUserCopyWithImpl(this._self, this._then);

  final _AdminUser _self;
  final $Res Function(_AdminUser) _then;

/// Create a copy of AdminUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? status = null,Object? lastLoginAt = freezed,Object? createdAt = null,Object? isYou = null,}) {
  return _then(_AdminUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isYou: null == isYou ? _self.isYou : isYou // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Customer {

 String get id; String? get name; String? get phone; String? get email; String get status; int get orderCount; int get totalSpent; DateTime? get lastOrderAt; DateTime get createdAt;
/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCopyWith<Customer> get copyWith => _$CustomerCopyWithImpl<Customer>(this as Customer, _$identity);

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Customer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Customer&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.orderCount, _this.orderCount) || other.orderCount == _this.orderCount)&&(identical(other.totalSpent, _this.totalSpent) || other.totalSpent == _this.totalSpent)&&(identical(other.lastOrderAt, _this.lastOrderAt) || other.lastOrderAt == _this.lastOrderAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Customer;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.email,_this.status,_this.orderCount,_this.totalSpent,_this.lastOrderAt,_this.createdAt);
}

@override
String toString() {
  final _this = this as Customer;
  return 'Customer(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, email: ${_this.email}, status: ${_this.status}, orderCount: ${_this.orderCount}, totalSpent: ${_this.totalSpent}, lastOrderAt: ${_this.lastOrderAt}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $CustomerCopyWith<$Res>  {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) _then) = _$CustomerCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? phone, String? email, String status, int orderCount, int totalSpent, DateTime? lastOrderAt, DateTime createdAt
});




}
/// @nodoc
class _$CustomerCopyWithImpl<$Res>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._self, this._then);

  final Customer _self;
  final $Res Function(Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? phone = freezed,Object? email = freezed,Object? status = null,Object? orderCount = null,Object? totalSpent = null,Object? lastOrderAt = freezed,Object? createdAt = null,}) {
  return _then(Customer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as int,lastOrderAt: freezed == lastOrderAt ? _self.lastOrderAt : lastOrderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Customer].
extension CustomerPatterns on Customer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Customer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Customer value)  $default,){
final _that = this;
switch (_that) {
case _Customer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Customer value)?  $default,){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? phone,  String? email,  String status,  int orderCount,  int totalSpent,  DateTime? lastOrderAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.status,_that.orderCount,_that.totalSpent,_that.lastOrderAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? phone,  String? email,  String status,  int orderCount,  int totalSpent,  DateTime? lastOrderAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Customer():
return $default(_that.id,_that.name,_that.phone,_that.email,_that.status,_that.orderCount,_that.totalSpent,_that.lastOrderAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? phone,  String? email,  String status,  int orderCount,  int totalSpent,  DateTime? lastOrderAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.status,_that.orderCount,_that.totalSpent,_that.lastOrderAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Customer implements Customer {
  const _Customer({required this.id, this.name, this.phone, this.email, required this.status, this.orderCount = 0, this.totalSpent = 0, this.lastOrderAt, required this.createdAt});
  factory _Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? phone;
@override final  String? email;
@override final  String status;
@override@JsonKey() final  int orderCount;
@override@JsonKey() final  int totalSpent;
@override final  DateTime? lastOrderAt;
@override final  DateTime createdAt;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerCopyWith<_Customer> get copyWith => __$CustomerCopyWithImpl<_Customer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount)&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent)&&(identical(other.lastOrderAt, lastOrderAt) || other.lastOrderAt == lastOrderAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,email,status,orderCount,totalSpent,lastOrderAt,createdAt);
}

@override
String toString() {
    return 'Customer(id: $id, name: $name, phone: $phone, email: $email, status: $status, orderCount: $orderCount, totalSpent: $totalSpent, lastOrderAt: $lastOrderAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$CustomerCopyWith(_Customer value, $Res Function(_Customer) _then) = __$CustomerCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? phone, String? email, String status, int orderCount, int totalSpent, DateTime? lastOrderAt, DateTime createdAt
});




}
/// @nodoc
class __$CustomerCopyWithImpl<$Res>
    implements _$CustomerCopyWith<$Res> {
  __$CustomerCopyWithImpl(this._self, this._then);

  final _Customer _self;
  final $Res Function(_Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? phone = freezed,Object? email = freezed,Object? status = null,Object? orderCount = null,Object? totalSpent = null,Object? lastOrderAt = freezed,Object? createdAt = null,}) {
  return _then(_Customer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as int,lastOrderAt: freezed == lastOrderAt ? _self.lastOrderAt : lastOrderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$AuditLog {

 String get id; String? get actorId; String? get actorName; String get actorRole; String get action; String get entityType; String? get entityId; String? get branchId; Object? get before; Object? get after; String? get ip; DateTime get createdAt;
/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditLogCopyWith<AuditLog> get copyWith => _$AuditLogCopyWithImpl<AuditLog>(this as AuditLog, _$identity);

  /// Serializes this AuditLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuditLog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditLog&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.actorId, _this.actorId) || other.actorId == _this.actorId)&&(identical(other.actorName, _this.actorName) || other.actorName == _this.actorName)&&(identical(other.actorRole, _this.actorRole) || other.actorRole == _this.actorRole)&&(identical(other.action, _this.action) || other.action == _this.action)&&(identical(other.entityType, _this.entityType) || other.entityType == _this.entityType)&&(identical(other.entityId, _this.entityId) || other.entityId == _this.entityId)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&const DeepCollectionEquality().equals(other.before, _this.before)&&const DeepCollectionEquality().equals(other.after, _this.after)&&(identical(other.ip, _this.ip) || other.ip == _this.ip)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuditLog;
  return Object.hash(runtimeType,_this.id,_this.actorId,_this.actorName,_this.actorRole,_this.action,_this.entityType,_this.entityId,_this.branchId,const DeepCollectionEquality().hash(_this.before),const DeepCollectionEquality().hash(_this.after),_this.ip,_this.createdAt);
}

@override
String toString() {
  final _this = this as AuditLog;
  return 'AuditLog(id: ${_this.id}, actorId: ${_this.actorId}, actorName: ${_this.actorName}, actorRole: ${_this.actorRole}, action: ${_this.action}, entityType: ${_this.entityType}, entityId: ${_this.entityId}, branchId: ${_this.branchId}, before: ${_this.before}, after: ${_this.after}, ip: ${_this.ip}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $AuditLogCopyWith<$Res>  {
  factory $AuditLogCopyWith(AuditLog value, $Res Function(AuditLog) _then) = _$AuditLogCopyWithImpl;
@useResult
$Res call({
 String id, String? actorId, String? actorName, String actorRole, String action, String entityType, String? entityId, String? branchId, Object? before, Object? after, String? ip, DateTime createdAt
});




}
/// @nodoc
class _$AuditLogCopyWithImpl<$Res>
    implements $AuditLogCopyWith<$Res> {
  _$AuditLogCopyWithImpl(this._self, this._then);

  final AuditLog _self;
  final $Res Function(AuditLog) _then;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? actorId = freezed,Object? actorName = freezed,Object? actorRole = null,Object? action = null,Object? entityType = null,Object? entityId = freezed,Object? branchId = freezed,Object? before = freezed,Object? after = freezed,Object? ip = freezed,Object? createdAt = null,}) {
  return _then(AuditLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actorId: freezed == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String?,actorName: freezed == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String?,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,entityType: null == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,before: freezed == before ? _self.before : before ,after: freezed == after ? _self.after : after ,ip: freezed == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditLog].
extension AuditLogPatterns on AuditLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditLog value)  $default,){
final _that = this;
switch (_that) {
case _AuditLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditLog value)?  $default,){
final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? actorId,  String? actorName,  String actorRole,  String action,  String entityType,  String? entityId,  String? branchId,  Object? before,  Object? after,  String? ip,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
return $default(_that.id,_that.actorId,_that.actorName,_that.actorRole,_that.action,_that.entityType,_that.entityId,_that.branchId,_that.before,_that.after,_that.ip,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? actorId,  String? actorName,  String actorRole,  String action,  String entityType,  String? entityId,  String? branchId,  Object? before,  Object? after,  String? ip,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AuditLog():
return $default(_that.id,_that.actorId,_that.actorName,_that.actorRole,_that.action,_that.entityType,_that.entityId,_that.branchId,_that.before,_that.after,_that.ip,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? actorId,  String? actorName,  String actorRole,  String action,  String entityType,  String? entityId,  String? branchId,  Object? before,  Object? after,  String? ip,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
return $default(_that.id,_that.actorId,_that.actorName,_that.actorRole,_that.action,_that.entityType,_that.entityId,_that.branchId,_that.before,_that.after,_that.ip,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditLog implements AuditLog {
  const _AuditLog({required this.id, this.actorId, this.actorName, this.actorRole = '', required this.action, required this.entityType, this.entityId, this.branchId, this.before, this.after, this.ip, required this.createdAt});
  factory _AuditLog.fromJson(Map<String, dynamic> json) => _$AuditLogFromJson(json);

@override final  String id;
@override final  String? actorId;
@override final  String? actorName;
@override@JsonKey() final  String actorRole;
@override final  String action;
@override final  String entityType;
@override final  String? entityId;
@override final  String? branchId;
@override final  Object? before;
@override final  Object? after;
@override final  String? ip;
@override final  DateTime createdAt;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditLogCopyWith<_AuditLog> get copyWith => __$AuditLogCopyWithImpl<_AuditLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditLogToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditLog&&(identical(other.id, id) || other.id == id)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.actorName, actorName) || other.actorName == actorName)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.action, action) || other.action == action)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&const DeepCollectionEquality().equals(other.before, before)&&const DeepCollectionEquality().equals(other.after, after)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,actorId,actorName,actorRole,action,entityType,entityId,branchId,const DeepCollectionEquality().hash(before),const DeepCollectionEquality().hash(after),ip,createdAt);
}

@override
String toString() {
    return 'AuditLog(id: $id, actorId: $actorId, actorName: $actorName, actorRole: $actorRole, action: $action, entityType: $entityType, entityId: $entityId, branchId: $branchId, before: $before, after: $after, ip: $ip, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AuditLogCopyWith<$Res> implements $AuditLogCopyWith<$Res> {
  factory _$AuditLogCopyWith(_AuditLog value, $Res Function(_AuditLog) _then) = __$AuditLogCopyWithImpl;
@override @useResult
$Res call({
 String id, String? actorId, String? actorName, String actorRole, String action, String entityType, String? entityId, String? branchId, Object? before, Object? after, String? ip, DateTime createdAt
});




}
/// @nodoc
class __$AuditLogCopyWithImpl<$Res>
    implements _$AuditLogCopyWith<$Res> {
  __$AuditLogCopyWithImpl(this._self, this._then);

  final _AuditLog _self;
  final $Res Function(_AuditLog) _then;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? actorId = freezed,Object? actorName = freezed,Object? actorRole = null,Object? action = null,Object? entityType = null,Object? entityId = freezed,Object? branchId = freezed,Object? before = freezed,Object? after = freezed,Object? ip = freezed,Object? createdAt = null,}) {
  return _then(_AuditLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actorId: freezed == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String?,actorName: freezed == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String?,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,entityType: null == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,before: freezed == before ? _self.before : before ,after: freezed == after ? _self.after : after ,ip: freezed == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SystemSetting {

 String get key; Object? get value; String? get description; String get source; DateTime? get updatedAt;
/// Create a copy of SystemSetting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemSettingCopyWith<SystemSetting> get copyWith => _$SystemSettingCopyWithImpl<SystemSetting>(this as SystemSetting, _$identity);

  /// Serializes this SystemSetting to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SystemSetting;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemSetting&&(identical(other.key, _this.key) || other.key == _this.key)&&const DeepCollectionEquality().equals(other.value, _this.value)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SystemSetting;
  return Object.hash(runtimeType,_this.key,const DeepCollectionEquality().hash(_this.value),_this.description,_this.source,_this.updatedAt);
}

@override
String toString() {
  final _this = this as SystemSetting;
  return 'SystemSetting(key: ${_this.key}, value: ${_this.value}, description: ${_this.description}, source: ${_this.source}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $SystemSettingCopyWith<$Res>  {
  factory $SystemSettingCopyWith(SystemSetting value, $Res Function(SystemSetting) _then) = _$SystemSettingCopyWithImpl;
@useResult
$Res call({
 String key, Object? value, String? description, String source, DateTime? updatedAt
});




}
/// @nodoc
class _$SystemSettingCopyWithImpl<$Res>
    implements $SystemSettingCopyWith<$Res> {
  _$SystemSettingCopyWithImpl(this._self, this._then);

  final SystemSetting _self;
  final $Res Function(SystemSetting) _then;

/// Create a copy of SystemSetting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? value = freezed,Object? description = freezed,Object? source = null,Object? updatedAt = freezed,}) {
  return _then(SystemSetting(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value ,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SystemSetting].
extension SystemSettingPatterns on SystemSetting {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SystemSetting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SystemSetting() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SystemSetting value)  $default,){
final _that = this;
switch (_that) {
case _SystemSetting():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SystemSetting value)?  $default,){
final _that = this;
switch (_that) {
case _SystemSetting() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  Object? value,  String? description,  String source,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SystemSetting() when $default != null:
return $default(_that.key,_that.value,_that.description,_that.source,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  Object? value,  String? description,  String source,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SystemSetting():
return $default(_that.key,_that.value,_that.description,_that.source,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  Object? value,  String? description,  String source,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SystemSetting() when $default != null:
return $default(_that.key,_that.value,_that.description,_that.source,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SystemSetting implements SystemSetting {
  const _SystemSetting({required this.key, this.value, this.description, this.source = 'environment', this.updatedAt});
  factory _SystemSetting.fromJson(Map<String, dynamic> json) => _$SystemSettingFromJson(json);

@override final  String key;
@override final  Object? value;
@override final  String? description;
@override@JsonKey() final  String source;
@override final  DateTime? updatedAt;

/// Create a copy of SystemSetting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SystemSettingCopyWith<_SystemSetting> get copyWith => __$SystemSettingCopyWithImpl<_SystemSetting>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SystemSettingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SystemSetting&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.description, description) || other.description == description)&&(identical(other.source, source) || other.source == source)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,const DeepCollectionEquality().hash(value),description,source,updatedAt);
}

@override
String toString() {
    return 'SystemSetting(key: $key, value: $value, description: $description, source: $source, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SystemSettingCopyWith<$Res> implements $SystemSettingCopyWith<$Res> {
  factory _$SystemSettingCopyWith(_SystemSetting value, $Res Function(_SystemSetting) _then) = __$SystemSettingCopyWithImpl;
@override @useResult
$Res call({
 String key, Object? value, String? description, String source, DateTime? updatedAt
});




}
/// @nodoc
class __$SystemSettingCopyWithImpl<$Res>
    implements _$SystemSettingCopyWith<$Res> {
  __$SystemSettingCopyWithImpl(this._self, this._then);

  final _SystemSetting _self;
  final $Res Function(_SystemSetting) _then;

/// Create a copy of SystemSetting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = freezed,Object? description = freezed,Object? source = null,Object? updatedAt = freezed,}) {
  return _then(_SystemSetting(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value ,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
