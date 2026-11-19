// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Totals {

 int get subtotal; int get discountTotal; int get taxTotal; int get taxRateBps; int get deliveryFee; int get total; String get currency;
/// Create a copy of Totals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotalsCopyWith<Totals> get copyWith => _$TotalsCopyWithImpl<Totals>(this as Totals, _$identity);

  /// Serializes this Totals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Totals;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Totals&&(identical(other.subtotal, _this.subtotal) || other.subtotal == _this.subtotal)&&(identical(other.discountTotal, _this.discountTotal) || other.discountTotal == _this.discountTotal)&&(identical(other.taxTotal, _this.taxTotal) || other.taxTotal == _this.taxTotal)&&(identical(other.taxRateBps, _this.taxRateBps) || other.taxRateBps == _this.taxRateBps)&&(identical(other.deliveryFee, _this.deliveryFee) || other.deliveryFee == _this.deliveryFee)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.currency, _this.currency) || other.currency == _this.currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Totals;
  return Object.hash(runtimeType,_this.subtotal,_this.discountTotal,_this.taxTotal,_this.taxRateBps,_this.deliveryFee,_this.total,_this.currency);
}

@override
String toString() {
  final _this = this as Totals;
  return 'Totals(subtotal: ${_this.subtotal}, discountTotal: ${_this.discountTotal}, taxTotal: ${_this.taxTotal}, taxRateBps: ${_this.taxRateBps}, deliveryFee: ${_this.deliveryFee}, total: ${_this.total}, currency: ${_this.currency})';
}


}

/// @nodoc
abstract mixin class $TotalsCopyWith<$Res>  {
  factory $TotalsCopyWith(Totals value, $Res Function(Totals) _then) = _$TotalsCopyWithImpl;
@useResult
$Res call({
 int subtotal, int discountTotal, int taxTotal, int taxRateBps, int deliveryFee, int total, String currency
});




}
/// @nodoc
class _$TotalsCopyWithImpl<$Res>
    implements $TotalsCopyWith<$Res> {
  _$TotalsCopyWithImpl(this._self, this._then);

  final Totals _self;
  final $Res Function(Totals) _then;

/// Create a copy of Totals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtotal = null,Object? discountTotal = null,Object? taxTotal = null,Object? taxRateBps = null,Object? deliveryFee = null,Object? total = null,Object? currency = null,}) {
  return _then(Totals(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,discountTotal: null == discountTotal ? _self.discountTotal : discountTotal // ignore: cast_nullable_to_non_nullable
as int,taxTotal: null == taxTotal ? _self.taxTotal : taxTotal // ignore: cast_nullable_to_non_nullable
as int,taxRateBps: null == taxRateBps ? _self.taxRateBps : taxRateBps // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Totals].
extension TotalsPatterns on Totals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Totals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Totals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Totals value)  $default,){
final _that = this;
switch (_that) {
case _Totals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Totals value)?  $default,){
final _that = this;
switch (_that) {
case _Totals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int subtotal,  int discountTotal,  int taxTotal,  int taxRateBps,  int deliveryFee,  int total,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Totals() when $default != null:
return $default(_that.subtotal,_that.discountTotal,_that.taxTotal,_that.taxRateBps,_that.deliveryFee,_that.total,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int subtotal,  int discountTotal,  int taxTotal,  int taxRateBps,  int deliveryFee,  int total,  String currency)  $default,) {final _that = this;
switch (_that) {
case _Totals():
return $default(_that.subtotal,_that.discountTotal,_that.taxTotal,_that.taxRateBps,_that.deliveryFee,_that.total,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int subtotal,  int discountTotal,  int taxTotal,  int taxRateBps,  int deliveryFee,  int total,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _Totals() when $default != null:
return $default(_that.subtotal,_that.discountTotal,_that.taxTotal,_that.taxRateBps,_that.deliveryFee,_that.total,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Totals extends Totals {
  const _Totals({required this.subtotal, this.discountTotal = 0, required this.taxTotal, required this.taxRateBps, this.deliveryFee = 0, required this.total, this.currency = 'PKR'}): super._();
  factory _Totals.fromJson(Map<String, dynamic> json) => _$TotalsFromJson(json);

@override final  int subtotal;
@override@JsonKey() final  int discountTotal;
@override final  int taxTotal;
@override final  int taxRateBps;
@override@JsonKey() final  int deliveryFee;
@override final  int total;
@override@JsonKey() final  String currency;

/// Create a copy of Totals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TotalsCopyWith<_Totals> get copyWith => __$TotalsCopyWithImpl<_Totals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TotalsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Totals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discountTotal, discountTotal) || other.discountTotal == discountTotal)&&(identical(other.taxTotal, taxTotal) || other.taxTotal == taxTotal)&&(identical(other.taxRateBps, taxRateBps) || other.taxRateBps == taxRateBps)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,subtotal,discountTotal,taxTotal,taxRateBps,deliveryFee,total,currency);
}

@override
String toString() {
    return 'Totals(subtotal: $subtotal, discountTotal: $discountTotal, taxTotal: $taxTotal, taxRateBps: $taxRateBps, deliveryFee: $deliveryFee, total: $total, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$TotalsCopyWith<$Res> implements $TotalsCopyWith<$Res> {
  factory _$TotalsCopyWith(_Totals value, $Res Function(_Totals) _then) = __$TotalsCopyWithImpl;
@override @useResult
$Res call({
 int subtotal, int discountTotal, int taxTotal, int taxRateBps, int deliveryFee, int total, String currency
});




}
/// @nodoc
class __$TotalsCopyWithImpl<$Res>
    implements _$TotalsCopyWith<$Res> {
  __$TotalsCopyWithImpl(this._self, this._then);

  final _Totals _self;
  final $Res Function(_Totals) _then;

/// Create a copy of Totals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtotal = null,Object? discountTotal = null,Object? taxTotal = null,Object? taxRateBps = null,Object? deliveryFee = null,Object? total = null,Object? currency = null,}) {
  return _then(_Totals(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,discountTotal: null == discountTotal ? _self.discountTotal : discountTotal // ignore: cast_nullable_to_non_nullable
as int,taxTotal: null == taxTotal ? _self.taxTotal : taxTotal // ignore: cast_nullable_to_non_nullable
as int,taxRateBps: null == taxRateBps ? _self.taxRateBps : taxRateBps // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PricedOption {

 String get id; String get groupName; String get name; int get priceDelta;
/// Create a copy of PricedOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PricedOptionCopyWith<PricedOption> get copyWith => _$PricedOptionCopyWithImpl<PricedOption>(this as PricedOption, _$identity);

  /// Serializes this PricedOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PricedOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PricedOption&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.groupName, _this.groupName) || other.groupName == _this.groupName)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.priceDelta, _this.priceDelta) || other.priceDelta == _this.priceDelta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PricedOption;
  return Object.hash(runtimeType,_this.id,_this.groupName,_this.name,_this.priceDelta);
}

@override
String toString() {
  final _this = this as PricedOption;
  return 'PricedOption(id: ${_this.id}, groupName: ${_this.groupName}, name: ${_this.name}, priceDelta: ${_this.priceDelta})';
}


}

/// @nodoc
abstract mixin class $PricedOptionCopyWith<$Res>  {
  factory $PricedOptionCopyWith(PricedOption value, $Res Function(PricedOption) _then) = _$PricedOptionCopyWithImpl;
@useResult
$Res call({
 String id, String groupName, String name, int priceDelta
});




}
/// @nodoc
class _$PricedOptionCopyWithImpl<$Res>
    implements $PricedOptionCopyWith<$Res> {
  _$PricedOptionCopyWithImpl(this._self, this._then);

  final PricedOption _self;
  final $Res Function(PricedOption) _then;

/// Create a copy of PricedOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? groupName = null,Object? name = null,Object? priceDelta = null,}) {
  return _then(PricedOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceDelta: null == priceDelta ? _self.priceDelta : priceDelta // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PricedOption].
extension PricedOptionPatterns on PricedOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PricedOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PricedOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PricedOption value)  $default,){
final _that = this;
switch (_that) {
case _PricedOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PricedOption value)?  $default,){
final _that = this;
switch (_that) {
case _PricedOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String groupName,  String name,  int priceDelta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PricedOption() when $default != null:
return $default(_that.id,_that.groupName,_that.name,_that.priceDelta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String groupName,  String name,  int priceDelta)  $default,) {final _that = this;
switch (_that) {
case _PricedOption():
return $default(_that.id,_that.groupName,_that.name,_that.priceDelta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String groupName,  String name,  int priceDelta)?  $default,) {final _that = this;
switch (_that) {
case _PricedOption() when $default != null:
return $default(_that.id,_that.groupName,_that.name,_that.priceDelta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PricedOption implements PricedOption {
  const _PricedOption({required this.id, required this.groupName, required this.name, required this.priceDelta});
  factory _PricedOption.fromJson(Map<String, dynamic> json) => _$PricedOptionFromJson(json);

@override final  String id;
@override final  String groupName;
@override final  String name;
@override final  int priceDelta;

/// Create a copy of PricedOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PricedOptionCopyWith<_PricedOption> get copyWith => __$PricedOptionCopyWithImpl<_PricedOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PricedOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PricedOption&&(identical(other.id, id) || other.id == id)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.name, name) || other.name == name)&&(identical(other.priceDelta, priceDelta) || other.priceDelta == priceDelta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,groupName,name,priceDelta);
}

@override
String toString() {
    return 'PricedOption(id: $id, groupName: $groupName, name: $name, priceDelta: $priceDelta)';
}


}

/// @nodoc
abstract mixin class _$PricedOptionCopyWith<$Res> implements $PricedOptionCopyWith<$Res> {
  factory _$PricedOptionCopyWith(_PricedOption value, $Res Function(_PricedOption) _then) = __$PricedOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String groupName, String name, int priceDelta
});




}
/// @nodoc
class __$PricedOptionCopyWithImpl<$Res>
    implements _$PricedOptionCopyWith<$Res> {
  __$PricedOptionCopyWithImpl(this._self, this._then);

  final _PricedOption _self;
  final $Res Function(_PricedOption) _then;

/// Create a copy of PricedOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? groupName = null,Object? name = null,Object? priceDelta = null,}) {
  return _then(_PricedOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceDelta: null == priceDelta ? _self.priceDelta : priceDelta // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
