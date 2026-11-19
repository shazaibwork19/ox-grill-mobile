// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientConfig {

 String get apiVersion; String get currency; int get currencyMinorUnits; String get timezone; FeatureFlags get features; Map<String, List<String>> get paymentMethodsByOrderType; SupportContact? get support;
/// Create a copy of ClientConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientConfigCopyWith<ClientConfig> get copyWith => _$ClientConfigCopyWithImpl<ClientConfig>(this as ClientConfig, _$identity);

  /// Serializes this ClientConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ClientConfig;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientConfig&&(identical(other.apiVersion, _this.apiVersion) || other.apiVersion == _this.apiVersion)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.currencyMinorUnits, _this.currencyMinorUnits) || other.currencyMinorUnits == _this.currencyMinorUnits)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.features, _this.features) || other.features == _this.features)&&const DeepCollectionEquality().equals(other.paymentMethodsByOrderType, _this.paymentMethodsByOrderType)&&(identical(other.support, _this.support) || other.support == _this.support));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ClientConfig;
  return Object.hash(runtimeType,_this.apiVersion,_this.currency,_this.currencyMinorUnits,_this.timezone,_this.features,const DeepCollectionEquality().hash(_this.paymentMethodsByOrderType),_this.support);
}

@override
String toString() {
  final _this = this as ClientConfig;
  return 'ClientConfig(apiVersion: ${_this.apiVersion}, currency: ${_this.currency}, currencyMinorUnits: ${_this.currencyMinorUnits}, timezone: ${_this.timezone}, features: ${_this.features}, paymentMethodsByOrderType: ${_this.paymentMethodsByOrderType}, support: ${_this.support})';
}


}

/// @nodoc
abstract mixin class $ClientConfigCopyWith<$Res>  {
  factory $ClientConfigCopyWith(ClientConfig value, $Res Function(ClientConfig) _then) = _$ClientConfigCopyWithImpl;
@useResult
$Res call({
 String apiVersion, String currency, int currencyMinorUnits, String timezone, FeatureFlags features, Map<String, List<String>> paymentMethodsByOrderType, SupportContact? support
});


$FeatureFlagsCopyWith<$Res> get features;$SupportContactCopyWith<$Res>? get support;

}
/// @nodoc
class _$ClientConfigCopyWithImpl<$Res>
    implements $ClientConfigCopyWith<$Res> {
  _$ClientConfigCopyWithImpl(this._self, this._then);

  final ClientConfig _self;
  final $Res Function(ClientConfig) _then;

/// Create a copy of ClientConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apiVersion = null,Object? currency = null,Object? currencyMinorUnits = null,Object? timezone = null,Object? features = null,Object? paymentMethodsByOrderType = null,Object? support = freezed,}) {
  return _then(ClientConfig(
apiVersion: null == apiVersion ? _self.apiVersion : apiVersion // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,currencyMinorUnits: null == currencyMinorUnits ? _self.currencyMinorUnits : currencyMinorUnits // ignore: cast_nullable_to_non_nullable
as int,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as FeatureFlags,paymentMethodsByOrderType: null == paymentMethodsByOrderType ? _self.paymentMethodsByOrderType : paymentMethodsByOrderType // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,support: freezed == support ? _self.support : support // ignore: cast_nullable_to_non_nullable
as SupportContact?,
  ));
}
/// Create a copy of ClientConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeatureFlagsCopyWith<$Res> get features {
  
  return $FeatureFlagsCopyWith<$Res>(_self.features, (value) {
    return _then(_self.copyWith(features: value));
  });
}/// Create a copy of ClientConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupportContactCopyWith<$Res>? get support {
    if (_self.support == null) {
    return null;
  }

  return $SupportContactCopyWith<$Res>(_self.support!, (value) {
    return _then(_self.copyWith(support: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClientConfig].
extension ClientConfigPatterns on ClientConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientConfig value)  $default,){
final _that = this;
switch (_that) {
case _ClientConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ClientConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String apiVersion,  String currency,  int currencyMinorUnits,  String timezone,  FeatureFlags features,  Map<String, List<String>> paymentMethodsByOrderType,  SupportContact? support)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientConfig() when $default != null:
return $default(_that.apiVersion,_that.currency,_that.currencyMinorUnits,_that.timezone,_that.features,_that.paymentMethodsByOrderType,_that.support);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String apiVersion,  String currency,  int currencyMinorUnits,  String timezone,  FeatureFlags features,  Map<String, List<String>> paymentMethodsByOrderType,  SupportContact? support)  $default,) {final _that = this;
switch (_that) {
case _ClientConfig():
return $default(_that.apiVersion,_that.currency,_that.currencyMinorUnits,_that.timezone,_that.features,_that.paymentMethodsByOrderType,_that.support);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String apiVersion,  String currency,  int currencyMinorUnits,  String timezone,  FeatureFlags features,  Map<String, List<String>> paymentMethodsByOrderType,  SupportContact? support)?  $default,) {final _that = this;
switch (_that) {
case _ClientConfig() when $default != null:
return $default(_that.apiVersion,_that.currency,_that.currencyMinorUnits,_that.timezone,_that.features,_that.paymentMethodsByOrderType,_that.support);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientConfig extends ClientConfig {
  const _ClientConfig({required this.apiVersion, this.currency = 'PKR', this.currencyMinorUnits = 100, this.timezone = 'Asia/Karachi', required this.features,  Map<String, List<String>> paymentMethodsByOrderType = const {}, this.support}): _paymentMethodsByOrderType = paymentMethodsByOrderType,super._();
  factory _ClientConfig.fromJson(Map<String, dynamic> json) => _$ClientConfigFromJson(json);

@override final  String apiVersion;
@override@JsonKey() final  String currency;
@override@JsonKey() final  int currencyMinorUnits;
@override@JsonKey() final  String timezone;
@override final  FeatureFlags features;
 final  Map<String, List<String>> _paymentMethodsByOrderType;
@override@JsonKey() Map<String, List<String>> get paymentMethodsByOrderType {
  if (_paymentMethodsByOrderType is EqualUnmodifiableMapView) return _paymentMethodsByOrderType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_paymentMethodsByOrderType);
}

@override final  SupportContact? support;

/// Create a copy of ClientConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientConfigCopyWith<_ClientConfig> get copyWith => __$ClientConfigCopyWithImpl<_ClientConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientConfigToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientConfig&&(identical(other.apiVersion, apiVersion) || other.apiVersion == apiVersion)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currencyMinorUnits, currencyMinorUnits) || other.currencyMinorUnits == currencyMinorUnits)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.features, features) || other.features == features)&&const DeepCollectionEquality().equals(other.paymentMethodsByOrderType, _paymentMethodsByOrderType)&&(identical(other.support, support) || other.support == support));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,apiVersion,currency,currencyMinorUnits,timezone,features,const DeepCollectionEquality().hash(_paymentMethodsByOrderType),support);
}

@override
String toString() {
    return 'ClientConfig(apiVersion: $apiVersion, currency: $currency, currencyMinorUnits: $currencyMinorUnits, timezone: $timezone, features: $features, paymentMethodsByOrderType: $paymentMethodsByOrderType, support: $support)';
}


}

/// @nodoc
abstract mixin class _$ClientConfigCopyWith<$Res> implements $ClientConfigCopyWith<$Res> {
  factory _$ClientConfigCopyWith(_ClientConfig value, $Res Function(_ClientConfig) _then) = __$ClientConfigCopyWithImpl;
@override @useResult
$Res call({
 String apiVersion, String currency, int currencyMinorUnits, String timezone, FeatureFlags features, Map<String, List<String>> paymentMethodsByOrderType, SupportContact? support
});


@override $FeatureFlagsCopyWith<$Res> get features;@override $SupportContactCopyWith<$Res>? get support;

}
/// @nodoc
class __$ClientConfigCopyWithImpl<$Res>
    implements _$ClientConfigCopyWith<$Res> {
  __$ClientConfigCopyWithImpl(this._self, this._then);

  final _ClientConfig _self;
  final $Res Function(_ClientConfig) _then;

/// Create a copy of ClientConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apiVersion = null,Object? currency = null,Object? currencyMinorUnits = null,Object? timezone = null,Object? features = null,Object? paymentMethodsByOrderType = null,Object? support = freezed,}) {
  return _then(_ClientConfig(
apiVersion: null == apiVersion ? _self.apiVersion : apiVersion // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,currencyMinorUnits: null == currencyMinorUnits ? _self.currencyMinorUnits : currencyMinorUnits // ignore: cast_nullable_to_non_nullable
as int,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as FeatureFlags,paymentMethodsByOrderType: null == paymentMethodsByOrderType ? _self._paymentMethodsByOrderType : paymentMethodsByOrderType // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,support: freezed == support ? _self.support : support // ignore: cast_nullable_to_non_nullable
as SupportContact?,
  ));
}

/// Create a copy of ClientConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeatureFlagsCopyWith<$Res> get features {
  
  return $FeatureFlagsCopyWith<$Res>(_self.features, (value) {
    return _then(_self.copyWith(features: value));
  });
}/// Create a copy of ClientConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupportContactCopyWith<$Res>? get support {
    if (_self.support == null) {
    return null;
  }

  return $SupportContactCopyWith<$Res>(_self.support!, (value) {
    return _then(_self.copyWith(support: value));
  });
}
}


/// @nodoc
mixin _$FeatureFlags {

 bool get reservations; bool get waitlist; bool get whatsapp; bool get aiAssistant; bool get deliveryGps; bool get forecasting; bool get onlinePayments;
/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureFlagsCopyWith<FeatureFlags> get copyWith => _$FeatureFlagsCopyWithImpl<FeatureFlags>(this as FeatureFlags, _$identity);

  /// Serializes this FeatureFlags to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FeatureFlags;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureFlags&&(identical(other.reservations, _this.reservations) || other.reservations == _this.reservations)&&(identical(other.waitlist, _this.waitlist) || other.waitlist == _this.waitlist)&&(identical(other.whatsapp, _this.whatsapp) || other.whatsapp == _this.whatsapp)&&(identical(other.aiAssistant, _this.aiAssistant) || other.aiAssistant == _this.aiAssistant)&&(identical(other.deliveryGps, _this.deliveryGps) || other.deliveryGps == _this.deliveryGps)&&(identical(other.forecasting, _this.forecasting) || other.forecasting == _this.forecasting)&&(identical(other.onlinePayments, _this.onlinePayments) || other.onlinePayments == _this.onlinePayments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FeatureFlags;
  return Object.hash(runtimeType,_this.reservations,_this.waitlist,_this.whatsapp,_this.aiAssistant,_this.deliveryGps,_this.forecasting,_this.onlinePayments);
}

@override
String toString() {
  final _this = this as FeatureFlags;
  return 'FeatureFlags(reservations: ${_this.reservations}, waitlist: ${_this.waitlist}, whatsapp: ${_this.whatsapp}, aiAssistant: ${_this.aiAssistant}, deliveryGps: ${_this.deliveryGps}, forecasting: ${_this.forecasting}, onlinePayments: ${_this.onlinePayments})';
}


}

/// @nodoc
abstract mixin class $FeatureFlagsCopyWith<$Res>  {
  factory $FeatureFlagsCopyWith(FeatureFlags value, $Res Function(FeatureFlags) _then) = _$FeatureFlagsCopyWithImpl;
@useResult
$Res call({
 bool reservations, bool waitlist, bool whatsapp, bool aiAssistant, bool deliveryGps, bool forecasting, bool onlinePayments
});




}
/// @nodoc
class _$FeatureFlagsCopyWithImpl<$Res>
    implements $FeatureFlagsCopyWith<$Res> {
  _$FeatureFlagsCopyWithImpl(this._self, this._then);

  final FeatureFlags _self;
  final $Res Function(FeatureFlags) _then;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reservations = null,Object? waitlist = null,Object? whatsapp = null,Object? aiAssistant = null,Object? deliveryGps = null,Object? forecasting = null,Object? onlinePayments = null,}) {
  return _then(FeatureFlags(
reservations: null == reservations ? _self.reservations : reservations // ignore: cast_nullable_to_non_nullable
as bool,waitlist: null == waitlist ? _self.waitlist : waitlist // ignore: cast_nullable_to_non_nullable
as bool,whatsapp: null == whatsapp ? _self.whatsapp : whatsapp // ignore: cast_nullable_to_non_nullable
as bool,aiAssistant: null == aiAssistant ? _self.aiAssistant : aiAssistant // ignore: cast_nullable_to_non_nullable
as bool,deliveryGps: null == deliveryGps ? _self.deliveryGps : deliveryGps // ignore: cast_nullable_to_non_nullable
as bool,forecasting: null == forecasting ? _self.forecasting : forecasting // ignore: cast_nullable_to_non_nullable
as bool,onlinePayments: null == onlinePayments ? _self.onlinePayments : onlinePayments // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FeatureFlags].
extension FeatureFlagsPatterns on FeatureFlags {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeatureFlags value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeatureFlags value)  $default,){
final _that = this;
switch (_that) {
case _FeatureFlags():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeatureFlags value)?  $default,){
final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool reservations,  bool waitlist,  bool whatsapp,  bool aiAssistant,  bool deliveryGps,  bool forecasting,  bool onlinePayments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
return $default(_that.reservations,_that.waitlist,_that.whatsapp,_that.aiAssistant,_that.deliveryGps,_that.forecasting,_that.onlinePayments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool reservations,  bool waitlist,  bool whatsapp,  bool aiAssistant,  bool deliveryGps,  bool forecasting,  bool onlinePayments)  $default,) {final _that = this;
switch (_that) {
case _FeatureFlags():
return $default(_that.reservations,_that.waitlist,_that.whatsapp,_that.aiAssistant,_that.deliveryGps,_that.forecasting,_that.onlinePayments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool reservations,  bool waitlist,  bool whatsapp,  bool aiAssistant,  bool deliveryGps,  bool forecasting,  bool onlinePayments)?  $default,) {final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
return $default(_that.reservations,_that.waitlist,_that.whatsapp,_that.aiAssistant,_that.deliveryGps,_that.forecasting,_that.onlinePayments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeatureFlags implements FeatureFlags {
  const _FeatureFlags({this.reservations = false, this.waitlist = false, this.whatsapp = false, this.aiAssistant = false, this.deliveryGps = false, this.forecasting = false, this.onlinePayments = false});
  factory _FeatureFlags.fromJson(Map<String, dynamic> json) => _$FeatureFlagsFromJson(json);

@override@JsonKey() final  bool reservations;
@override@JsonKey() final  bool waitlist;
@override@JsonKey() final  bool whatsapp;
@override@JsonKey() final  bool aiAssistant;
@override@JsonKey() final  bool deliveryGps;
@override@JsonKey() final  bool forecasting;
@override@JsonKey() final  bool onlinePayments;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeatureFlagsCopyWith<_FeatureFlags> get copyWith => __$FeatureFlagsCopyWithImpl<_FeatureFlags>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeatureFlagsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeatureFlags&&(identical(other.reservations, reservations) || other.reservations == reservations)&&(identical(other.waitlist, waitlist) || other.waitlist == waitlist)&&(identical(other.whatsapp, whatsapp) || other.whatsapp == whatsapp)&&(identical(other.aiAssistant, aiAssistant) || other.aiAssistant == aiAssistant)&&(identical(other.deliveryGps, deliveryGps) || other.deliveryGps == deliveryGps)&&(identical(other.forecasting, forecasting) || other.forecasting == forecasting)&&(identical(other.onlinePayments, onlinePayments) || other.onlinePayments == onlinePayments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,reservations,waitlist,whatsapp,aiAssistant,deliveryGps,forecasting,onlinePayments);
}

@override
String toString() {
    return 'FeatureFlags(reservations: $reservations, waitlist: $waitlist, whatsapp: $whatsapp, aiAssistant: $aiAssistant, deliveryGps: $deliveryGps, forecasting: $forecasting, onlinePayments: $onlinePayments)';
}


}

/// @nodoc
abstract mixin class _$FeatureFlagsCopyWith<$Res> implements $FeatureFlagsCopyWith<$Res> {
  factory _$FeatureFlagsCopyWith(_FeatureFlags value, $Res Function(_FeatureFlags) _then) = __$FeatureFlagsCopyWithImpl;
@override @useResult
$Res call({
 bool reservations, bool waitlist, bool whatsapp, bool aiAssistant, bool deliveryGps, bool forecasting, bool onlinePayments
});




}
/// @nodoc
class __$FeatureFlagsCopyWithImpl<$Res>
    implements _$FeatureFlagsCopyWith<$Res> {
  __$FeatureFlagsCopyWithImpl(this._self, this._then);

  final _FeatureFlags _self;
  final $Res Function(_FeatureFlags) _then;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reservations = null,Object? waitlist = null,Object? whatsapp = null,Object? aiAssistant = null,Object? deliveryGps = null,Object? forecasting = null,Object? onlinePayments = null,}) {
  return _then(_FeatureFlags(
reservations: null == reservations ? _self.reservations : reservations // ignore: cast_nullable_to_non_nullable
as bool,waitlist: null == waitlist ? _self.waitlist : waitlist // ignore: cast_nullable_to_non_nullable
as bool,whatsapp: null == whatsapp ? _self.whatsapp : whatsapp // ignore: cast_nullable_to_non_nullable
as bool,aiAssistant: null == aiAssistant ? _self.aiAssistant : aiAssistant // ignore: cast_nullable_to_non_nullable
as bool,deliveryGps: null == deliveryGps ? _self.deliveryGps : deliveryGps // ignore: cast_nullable_to_non_nullable
as bool,forecasting: null == forecasting ? _self.forecasting : forecasting // ignore: cast_nullable_to_non_nullable
as bool,onlinePayments: null == onlinePayments ? _self.onlinePayments : onlinePayments // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SupportContact {

 String? get email; String? get phone;
/// Create a copy of SupportContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportContactCopyWith<SupportContact> get copyWith => _$SupportContactCopyWithImpl<SupportContact>(this as SupportContact, _$identity);

  /// Serializes this SupportContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupportContact;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportContact&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupportContact;
  return Object.hash(runtimeType,_this.email,_this.phone);
}

@override
String toString() {
  final _this = this as SupportContact;
  return 'SupportContact(email: ${_this.email}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $SupportContactCopyWith<$Res>  {
  factory $SupportContactCopyWith(SupportContact value, $Res Function(SupportContact) _then) = _$SupportContactCopyWithImpl;
@useResult
$Res call({
 String? email, String? phone
});




}
/// @nodoc
class _$SupportContactCopyWithImpl<$Res>
    implements $SupportContactCopyWith<$Res> {
  _$SupportContactCopyWithImpl(this._self, this._then);

  final SupportContact _self;
  final $Res Function(SupportContact) _then;

/// Create a copy of SupportContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? phone = freezed,}) {
  return _then(SupportContact(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportContact].
extension SupportContactPatterns on SupportContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportContact value)  $default,){
final _that = this;
switch (_that) {
case _SupportContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportContact value)?  $default,){
final _that = this;
switch (_that) {
case _SupportContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportContact() when $default != null:
return $default(_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _SupportContact():
return $default(_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _SupportContact() when $default != null:
return $default(_that.email,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupportContact implements SupportContact {
  const _SupportContact({this.email, this.phone});
  factory _SupportContact.fromJson(Map<String, dynamic> json) => _$SupportContactFromJson(json);

@override final  String? email;
@override final  String? phone;

/// Create a copy of SupportContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportContactCopyWith<_SupportContact> get copyWith => __$SupportContactCopyWithImpl<_SupportContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportContactToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportContact&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,email,phone);
}

@override
String toString() {
    return 'SupportContact(email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$SupportContactCopyWith<$Res> implements $SupportContactCopyWith<$Res> {
  factory _$SupportContactCopyWith(_SupportContact value, $Res Function(_SupportContact) _then) = __$SupportContactCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? phone
});




}
/// @nodoc
class __$SupportContactCopyWithImpl<$Res>
    implements _$SupportContactCopyWith<$Res> {
  __$SupportContactCopyWithImpl(this._self, this._then);

  final _SupportContact _self;
  final $Res Function(_SupportContact) _then;

/// Create a copy of SupportContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? phone = freezed,}) {
  return _then(_SupportContact(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
