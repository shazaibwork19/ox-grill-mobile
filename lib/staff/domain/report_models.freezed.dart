// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResolvedRange {

 String get from; String get to;
/// Create a copy of ResolvedRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedRangeCopyWith<ResolvedRange> get copyWith => _$ResolvedRangeCopyWithImpl<ResolvedRange>(this as ResolvedRange, _$identity);

  /// Serializes this ResolvedRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResolvedRange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedRange&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.to, _this.to) || other.to == _this.to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResolvedRange;
  return Object.hash(runtimeType,_this.from,_this.to);
}

@override
String toString() {
  final _this = this as ResolvedRange;
  return 'ResolvedRange(from: ${_this.from}, to: ${_this.to})';
}


}

/// @nodoc
abstract mixin class $ResolvedRangeCopyWith<$Res>  {
  factory $ResolvedRangeCopyWith(ResolvedRange value, $Res Function(ResolvedRange) _then) = _$ResolvedRangeCopyWithImpl;
@useResult
$Res call({
 String from, String to
});




}
/// @nodoc
class _$ResolvedRangeCopyWithImpl<$Res>
    implements $ResolvedRangeCopyWith<$Res> {
  _$ResolvedRangeCopyWithImpl(this._self, this._then);

  final ResolvedRange _self;
  final $Res Function(ResolvedRange) _then;

/// Create a copy of ResolvedRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,}) {
  return _then(ResolvedRange(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResolvedRange].
extension ResolvedRangePatterns on ResolvedRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedRange value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedRange value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String from,  String to)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedRange() when $default != null:
return $default(_that.from,_that.to);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String from,  String to)  $default,) {final _that = this;
switch (_that) {
case _ResolvedRange():
return $default(_that.from,_that.to);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String from,  String to)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedRange() when $default != null:
return $default(_that.from,_that.to);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResolvedRange implements ResolvedRange {
  const _ResolvedRange({required this.from, required this.to});
  factory _ResolvedRange.fromJson(Map<String, dynamic> json) => _$ResolvedRangeFromJson(json);

@override final  String from;
@override final  String to;

/// Create a copy of ResolvedRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedRangeCopyWith<_ResolvedRange> get copyWith => __$ResolvedRangeCopyWithImpl<_ResolvedRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResolvedRangeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolvedRange&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,from,to);
}

@override
String toString() {
    return 'ResolvedRange(from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class _$ResolvedRangeCopyWith<$Res> implements $ResolvedRangeCopyWith<$Res> {
  factory _$ResolvedRangeCopyWith(_ResolvedRange value, $Res Function(_ResolvedRange) _then) = __$ResolvedRangeCopyWithImpl;
@override @useResult
$Res call({
 String from, String to
});




}
/// @nodoc
class __$ResolvedRangeCopyWithImpl<$Res>
    implements _$ResolvedRangeCopyWith<$Res> {
  __$ResolvedRangeCopyWithImpl(this._self, this._then);

  final _ResolvedRange _self;
  final $Res Function(_ResolvedRange) _then;

/// Create a copy of ResolvedRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,}) {
  return _then(_ResolvedRange(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PeriodTotals {

 int get revenue; int get orders; int get averageOrderValue; int get cancelledOrders; int get rejectedOrders;
/// Create a copy of PeriodTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeriodTotalsCopyWith<PeriodTotals> get copyWith => _$PeriodTotalsCopyWithImpl<PeriodTotals>(this as PeriodTotals, _$identity);

  /// Serializes this PeriodTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PeriodTotals;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeriodTotals&&(identical(other.revenue, _this.revenue) || other.revenue == _this.revenue)&&(identical(other.orders, _this.orders) || other.orders == _this.orders)&&(identical(other.averageOrderValue, _this.averageOrderValue) || other.averageOrderValue == _this.averageOrderValue)&&(identical(other.cancelledOrders, _this.cancelledOrders) || other.cancelledOrders == _this.cancelledOrders)&&(identical(other.rejectedOrders, _this.rejectedOrders) || other.rejectedOrders == _this.rejectedOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PeriodTotals;
  return Object.hash(runtimeType,_this.revenue,_this.orders,_this.averageOrderValue,_this.cancelledOrders,_this.rejectedOrders);
}

@override
String toString() {
  final _this = this as PeriodTotals;
  return 'PeriodTotals(revenue: ${_this.revenue}, orders: ${_this.orders}, averageOrderValue: ${_this.averageOrderValue}, cancelledOrders: ${_this.cancelledOrders}, rejectedOrders: ${_this.rejectedOrders})';
}


}

/// @nodoc
abstract mixin class $PeriodTotalsCopyWith<$Res>  {
  factory $PeriodTotalsCopyWith(PeriodTotals value, $Res Function(PeriodTotals) _then) = _$PeriodTotalsCopyWithImpl;
@useResult
$Res call({
 int revenue, int orders, int averageOrderValue, int cancelledOrders, int rejectedOrders
});




}
/// @nodoc
class _$PeriodTotalsCopyWithImpl<$Res>
    implements $PeriodTotalsCopyWith<$Res> {
  _$PeriodTotalsCopyWithImpl(this._self, this._then);

  final PeriodTotals _self;
  final $Res Function(PeriodTotals) _then;

/// Create a copy of PeriodTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? revenue = null,Object? orders = null,Object? averageOrderValue = null,Object? cancelledOrders = null,Object? rejectedOrders = null,}) {
  return _then(PeriodTotals(
revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,averageOrderValue: null == averageOrderValue ? _self.averageOrderValue : averageOrderValue // ignore: cast_nullable_to_non_nullable
as int,cancelledOrders: null == cancelledOrders ? _self.cancelledOrders : cancelledOrders // ignore: cast_nullable_to_non_nullable
as int,rejectedOrders: null == rejectedOrders ? _self.rejectedOrders : rejectedOrders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PeriodTotals].
extension PeriodTotalsPatterns on PeriodTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeriodTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PeriodTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeriodTotals value)  $default,){
final _that = this;
switch (_that) {
case _PeriodTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeriodTotals value)?  $default,){
final _that = this;
switch (_that) {
case _PeriodTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int revenue,  int orders,  int averageOrderValue,  int cancelledOrders,  int rejectedOrders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PeriodTotals() when $default != null:
return $default(_that.revenue,_that.orders,_that.averageOrderValue,_that.cancelledOrders,_that.rejectedOrders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int revenue,  int orders,  int averageOrderValue,  int cancelledOrders,  int rejectedOrders)  $default,) {final _that = this;
switch (_that) {
case _PeriodTotals():
return $default(_that.revenue,_that.orders,_that.averageOrderValue,_that.cancelledOrders,_that.rejectedOrders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int revenue,  int orders,  int averageOrderValue,  int cancelledOrders,  int rejectedOrders)?  $default,) {final _that = this;
switch (_that) {
case _PeriodTotals() when $default != null:
return $default(_that.revenue,_that.orders,_that.averageOrderValue,_that.cancelledOrders,_that.rejectedOrders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PeriodTotals implements PeriodTotals {
  const _PeriodTotals({this.revenue = 0, this.orders = 0, this.averageOrderValue = 0, this.cancelledOrders = 0, this.rejectedOrders = 0});
  factory _PeriodTotals.fromJson(Map<String, dynamic> json) => _$PeriodTotalsFromJson(json);

@override@JsonKey() final  int revenue;
@override@JsonKey() final  int orders;
@override@JsonKey() final  int averageOrderValue;
@override@JsonKey() final  int cancelledOrders;
@override@JsonKey() final  int rejectedOrders;

/// Create a copy of PeriodTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeriodTotalsCopyWith<_PeriodTotals> get copyWith => __$PeriodTotalsCopyWithImpl<_PeriodTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PeriodTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeriodTotals&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.orders, orders) || other.orders == orders)&&(identical(other.averageOrderValue, averageOrderValue) || other.averageOrderValue == averageOrderValue)&&(identical(other.cancelledOrders, cancelledOrders) || other.cancelledOrders == cancelledOrders)&&(identical(other.rejectedOrders, rejectedOrders) || other.rejectedOrders == rejectedOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,revenue,orders,averageOrderValue,cancelledOrders,rejectedOrders);
}

@override
String toString() {
    return 'PeriodTotals(revenue: $revenue, orders: $orders, averageOrderValue: $averageOrderValue, cancelledOrders: $cancelledOrders, rejectedOrders: $rejectedOrders)';
}


}

/// @nodoc
abstract mixin class _$PeriodTotalsCopyWith<$Res> implements $PeriodTotalsCopyWith<$Res> {
  factory _$PeriodTotalsCopyWith(_PeriodTotals value, $Res Function(_PeriodTotals) _then) = __$PeriodTotalsCopyWithImpl;
@override @useResult
$Res call({
 int revenue, int orders, int averageOrderValue, int cancelledOrders, int rejectedOrders
});




}
/// @nodoc
class __$PeriodTotalsCopyWithImpl<$Res>
    implements _$PeriodTotalsCopyWith<$Res> {
  __$PeriodTotalsCopyWithImpl(this._self, this._then);

  final _PeriodTotals _self;
  final $Res Function(_PeriodTotals) _then;

/// Create a copy of PeriodTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? revenue = null,Object? orders = null,Object? averageOrderValue = null,Object? cancelledOrders = null,Object? rejectedOrders = null,}) {
  return _then(_PeriodTotals(
revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,averageOrderValue: null == averageOrderValue ? _self.averageOrderValue : averageOrderValue // ignore: cast_nullable_to_non_nullable
as int,cancelledOrders: null == cancelledOrders ? _self.cancelledOrders : cancelledOrders // ignore: cast_nullable_to_non_nullable
as int,rejectedOrders: null == rejectedOrders ? _self.rejectedOrders : rejectedOrders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PeriodChange {

 double? get revenuePct; double? get ordersPct; double? get averageOrderValuePct;
/// Create a copy of PeriodChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeriodChangeCopyWith<PeriodChange> get copyWith => _$PeriodChangeCopyWithImpl<PeriodChange>(this as PeriodChange, _$identity);

  /// Serializes this PeriodChange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PeriodChange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeriodChange&&(identical(other.revenuePct, _this.revenuePct) || other.revenuePct == _this.revenuePct)&&(identical(other.ordersPct, _this.ordersPct) || other.ordersPct == _this.ordersPct)&&(identical(other.averageOrderValuePct, _this.averageOrderValuePct) || other.averageOrderValuePct == _this.averageOrderValuePct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PeriodChange;
  return Object.hash(runtimeType,_this.revenuePct,_this.ordersPct,_this.averageOrderValuePct);
}

@override
String toString() {
  final _this = this as PeriodChange;
  return 'PeriodChange(revenuePct: ${_this.revenuePct}, ordersPct: ${_this.ordersPct}, averageOrderValuePct: ${_this.averageOrderValuePct})';
}


}

/// @nodoc
abstract mixin class $PeriodChangeCopyWith<$Res>  {
  factory $PeriodChangeCopyWith(PeriodChange value, $Res Function(PeriodChange) _then) = _$PeriodChangeCopyWithImpl;
@useResult
$Res call({
 double? revenuePct, double? ordersPct, double? averageOrderValuePct
});




}
/// @nodoc
class _$PeriodChangeCopyWithImpl<$Res>
    implements $PeriodChangeCopyWith<$Res> {
  _$PeriodChangeCopyWithImpl(this._self, this._then);

  final PeriodChange _self;
  final $Res Function(PeriodChange) _then;

/// Create a copy of PeriodChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? revenuePct = freezed,Object? ordersPct = freezed,Object? averageOrderValuePct = freezed,}) {
  return _then(PeriodChange(
revenuePct: freezed == revenuePct ? _self.revenuePct : revenuePct // ignore: cast_nullable_to_non_nullable
as double?,ordersPct: freezed == ordersPct ? _self.ordersPct : ordersPct // ignore: cast_nullable_to_non_nullable
as double?,averageOrderValuePct: freezed == averageOrderValuePct ? _self.averageOrderValuePct : averageOrderValuePct // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PeriodChange].
extension PeriodChangePatterns on PeriodChange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeriodChange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PeriodChange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeriodChange value)  $default,){
final _that = this;
switch (_that) {
case _PeriodChange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeriodChange value)?  $default,){
final _that = this;
switch (_that) {
case _PeriodChange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? revenuePct,  double? ordersPct,  double? averageOrderValuePct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PeriodChange() when $default != null:
return $default(_that.revenuePct,_that.ordersPct,_that.averageOrderValuePct);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? revenuePct,  double? ordersPct,  double? averageOrderValuePct)  $default,) {final _that = this;
switch (_that) {
case _PeriodChange():
return $default(_that.revenuePct,_that.ordersPct,_that.averageOrderValuePct);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? revenuePct,  double? ordersPct,  double? averageOrderValuePct)?  $default,) {final _that = this;
switch (_that) {
case _PeriodChange() when $default != null:
return $default(_that.revenuePct,_that.ordersPct,_that.averageOrderValuePct);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PeriodChange implements PeriodChange {
  const _PeriodChange({this.revenuePct, this.ordersPct, this.averageOrderValuePct});
  factory _PeriodChange.fromJson(Map<String, dynamic> json) => _$PeriodChangeFromJson(json);

@override final  double? revenuePct;
@override final  double? ordersPct;
@override final  double? averageOrderValuePct;

/// Create a copy of PeriodChange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeriodChangeCopyWith<_PeriodChange> get copyWith => __$PeriodChangeCopyWithImpl<_PeriodChange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PeriodChangeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeriodChange&&(identical(other.revenuePct, revenuePct) || other.revenuePct == revenuePct)&&(identical(other.ordersPct, ordersPct) || other.ordersPct == ordersPct)&&(identical(other.averageOrderValuePct, averageOrderValuePct) || other.averageOrderValuePct == averageOrderValuePct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,revenuePct,ordersPct,averageOrderValuePct);
}

@override
String toString() {
    return 'PeriodChange(revenuePct: $revenuePct, ordersPct: $ordersPct, averageOrderValuePct: $averageOrderValuePct)';
}


}

/// @nodoc
abstract mixin class _$PeriodChangeCopyWith<$Res> implements $PeriodChangeCopyWith<$Res> {
  factory _$PeriodChangeCopyWith(_PeriodChange value, $Res Function(_PeriodChange) _then) = __$PeriodChangeCopyWithImpl;
@override @useResult
$Res call({
 double? revenuePct, double? ordersPct, double? averageOrderValuePct
});




}
/// @nodoc
class __$PeriodChangeCopyWithImpl<$Res>
    implements _$PeriodChangeCopyWith<$Res> {
  __$PeriodChangeCopyWithImpl(this._self, this._then);

  final _PeriodChange _self;
  final $Res Function(_PeriodChange) _then;

/// Create a copy of PeriodChange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? revenuePct = freezed,Object? ordersPct = freezed,Object? averageOrderValuePct = freezed,}) {
  return _then(_PeriodChange(
revenuePct: freezed == revenuePct ? _self.revenuePct : revenuePct // ignore: cast_nullable_to_non_nullable
as double?,ordersPct: freezed == ordersPct ? _self.ordersPct : ordersPct // ignore: cast_nullable_to_non_nullable
as double?,averageOrderValuePct: freezed == averageOrderValuePct ? _self.averageOrderValuePct : averageOrderValuePct // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$ReportOverview {

 ResolvedRange get range; PeriodTotals get current; PeriodTotals get previous; PeriodChange get change;
/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportOverviewCopyWith<ReportOverview> get copyWith => _$ReportOverviewCopyWithImpl<ReportOverview>(this as ReportOverview, _$identity);

  /// Serializes this ReportOverview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReportOverview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportOverview&&(identical(other.range, _this.range) || other.range == _this.range)&&(identical(other.current, _this.current) || other.current == _this.current)&&(identical(other.previous, _this.previous) || other.previous == _this.previous)&&(identical(other.change, _this.change) || other.change == _this.change));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReportOverview;
  return Object.hash(runtimeType,_this.range,_this.current,_this.previous,_this.change);
}

@override
String toString() {
  final _this = this as ReportOverview;
  return 'ReportOverview(range: ${_this.range}, current: ${_this.current}, previous: ${_this.previous}, change: ${_this.change})';
}


}

/// @nodoc
abstract mixin class $ReportOverviewCopyWith<$Res>  {
  factory $ReportOverviewCopyWith(ReportOverview value, $Res Function(ReportOverview) _then) = _$ReportOverviewCopyWithImpl;
@useResult
$Res call({
 ResolvedRange range, PeriodTotals current, PeriodTotals previous, PeriodChange change
});


$ResolvedRangeCopyWith<$Res> get range;$PeriodTotalsCopyWith<$Res> get current;$PeriodTotalsCopyWith<$Res> get previous;$PeriodChangeCopyWith<$Res> get change;

}
/// @nodoc
class _$ReportOverviewCopyWithImpl<$Res>
    implements $ReportOverviewCopyWith<$Res> {
  _$ReportOverviewCopyWithImpl(this._self, this._then);

  final ReportOverview _self;
  final $Res Function(ReportOverview) _then;

/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? range = null,Object? current = null,Object? previous = null,Object? change = null,}) {
  return _then(ReportOverview(
range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as ResolvedRange,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as PeriodTotals,previous: null == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as PeriodTotals,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as PeriodChange,
  ));
}
/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedRangeCopyWith<$Res> get range {
  
  return $ResolvedRangeCopyWith<$Res>(_self.range, (value) {
    return _then(_self.copyWith(range: value));
  });
}/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodTotalsCopyWith<$Res> get current {
  
  return $PeriodTotalsCopyWith<$Res>(_self.current, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodTotalsCopyWith<$Res> get previous {
  
  return $PeriodTotalsCopyWith<$Res>(_self.previous, (value) {
    return _then(_self.copyWith(previous: value));
  });
}/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodChangeCopyWith<$Res> get change {
  
  return $PeriodChangeCopyWith<$Res>(_self.change, (value) {
    return _then(_self.copyWith(change: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportOverview].
extension ReportOverviewPatterns on ReportOverview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportOverview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportOverview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportOverview value)  $default,){
final _that = this;
switch (_that) {
case _ReportOverview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportOverview value)?  $default,){
final _that = this;
switch (_that) {
case _ReportOverview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ResolvedRange range,  PeriodTotals current,  PeriodTotals previous,  PeriodChange change)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportOverview() when $default != null:
return $default(_that.range,_that.current,_that.previous,_that.change);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ResolvedRange range,  PeriodTotals current,  PeriodTotals previous,  PeriodChange change)  $default,) {final _that = this;
switch (_that) {
case _ReportOverview():
return $default(_that.range,_that.current,_that.previous,_that.change);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ResolvedRange range,  PeriodTotals current,  PeriodTotals previous,  PeriodChange change)?  $default,) {final _that = this;
switch (_that) {
case _ReportOverview() when $default != null:
return $default(_that.range,_that.current,_that.previous,_that.change);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportOverview implements ReportOverview {
  const _ReportOverview({required this.range, required this.current, required this.previous, this.change = const PeriodChange()});
  factory _ReportOverview.fromJson(Map<String, dynamic> json) => _$ReportOverviewFromJson(json);

@override final  ResolvedRange range;
@override final  PeriodTotals current;
@override final  PeriodTotals previous;
@override@JsonKey() final  PeriodChange change;

/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportOverviewCopyWith<_ReportOverview> get copyWith => __$ReportOverviewCopyWithImpl<_ReportOverview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportOverviewToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportOverview&&(identical(other.range, range) || other.range == range)&&(identical(other.current, current) || other.current == current)&&(identical(other.previous, previous) || other.previous == previous)&&(identical(other.change, change) || other.change == change));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,range,current,previous,change);
}

@override
String toString() {
    return 'ReportOverview(range: $range, current: $current, previous: $previous, change: $change)';
}


}

/// @nodoc
abstract mixin class _$ReportOverviewCopyWith<$Res> implements $ReportOverviewCopyWith<$Res> {
  factory _$ReportOverviewCopyWith(_ReportOverview value, $Res Function(_ReportOverview) _then) = __$ReportOverviewCopyWithImpl;
@override @useResult
$Res call({
 ResolvedRange range, PeriodTotals current, PeriodTotals previous, PeriodChange change
});


@override $ResolvedRangeCopyWith<$Res> get range;@override $PeriodTotalsCopyWith<$Res> get current;@override $PeriodTotalsCopyWith<$Res> get previous;@override $PeriodChangeCopyWith<$Res> get change;

}
/// @nodoc
class __$ReportOverviewCopyWithImpl<$Res>
    implements _$ReportOverviewCopyWith<$Res> {
  __$ReportOverviewCopyWithImpl(this._self, this._then);

  final _ReportOverview _self;
  final $Res Function(_ReportOverview) _then;

/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? range = null,Object? current = null,Object? previous = null,Object? change = null,}) {
  return _then(_ReportOverview(
range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as ResolvedRange,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as PeriodTotals,previous: null == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as PeriodTotals,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as PeriodChange,
  ));
}

/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedRangeCopyWith<$Res> get range {
  
  return $ResolvedRangeCopyWith<$Res>(_self.range, (value) {
    return _then(_self.copyWith(range: value));
  });
}/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodTotalsCopyWith<$Res> get current {
  
  return $PeriodTotalsCopyWith<$Res>(_self.current, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodTotalsCopyWith<$Res> get previous {
  
  return $PeriodTotalsCopyWith<$Res>(_self.previous, (value) {
    return _then(_self.copyWith(previous: value));
  });
}/// Create a copy of ReportOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodChangeCopyWith<$Res> get change {
  
  return $PeriodChangeCopyWith<$Res>(_self.change, (value) {
    return _then(_self.copyWith(change: value));
  });
}
}


/// @nodoc
mixin _$ReportRow {

 String? get date; int? get hour; String? get name; String? get method; String? get status; String? get type; String? get branchId; String? get branchName; int get orders; int get quantity; int get revenue; int get averageOrderValue; int get previousRevenue; double? get revenueChangePct; int get cancelledOrders;
/// Create a copy of ReportRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportRowCopyWith<ReportRow> get copyWith => _$ReportRowCopyWithImpl<ReportRow>(this as ReportRow, _$identity);

  /// Serializes this ReportRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReportRow;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportRow&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.hour, _this.hour) || other.hour == _this.hour)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.orders, _this.orders) || other.orders == _this.orders)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.revenue, _this.revenue) || other.revenue == _this.revenue)&&(identical(other.averageOrderValue, _this.averageOrderValue) || other.averageOrderValue == _this.averageOrderValue)&&(identical(other.previousRevenue, _this.previousRevenue) || other.previousRevenue == _this.previousRevenue)&&(identical(other.revenueChangePct, _this.revenueChangePct) || other.revenueChangePct == _this.revenueChangePct)&&(identical(other.cancelledOrders, _this.cancelledOrders) || other.cancelledOrders == _this.cancelledOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReportRow;
  return Object.hash(runtimeType,_this.date,_this.hour,_this.name,_this.method,_this.status,_this.type,_this.branchId,_this.branchName,_this.orders,_this.quantity,_this.revenue,_this.averageOrderValue,_this.previousRevenue,_this.revenueChangePct,_this.cancelledOrders);
}

@override
String toString() {
  final _this = this as ReportRow;
  return 'ReportRow(date: ${_this.date}, hour: ${_this.hour}, name: ${_this.name}, method: ${_this.method}, status: ${_this.status}, type: ${_this.type}, branchId: ${_this.branchId}, branchName: ${_this.branchName}, orders: ${_this.orders}, quantity: ${_this.quantity}, revenue: ${_this.revenue}, averageOrderValue: ${_this.averageOrderValue}, previousRevenue: ${_this.previousRevenue}, revenueChangePct: ${_this.revenueChangePct}, cancelledOrders: ${_this.cancelledOrders})';
}


}

/// @nodoc
abstract mixin class $ReportRowCopyWith<$Res>  {
  factory $ReportRowCopyWith(ReportRow value, $Res Function(ReportRow) _then) = _$ReportRowCopyWithImpl;
@useResult
$Res call({
 String? date, int? hour, String? name, String? method, String? status, String? type, String? branchId, String? branchName, int orders, int quantity, int revenue, int averageOrderValue, int previousRevenue, double? revenueChangePct, int cancelledOrders
});




}
/// @nodoc
class _$ReportRowCopyWithImpl<$Res>
    implements $ReportRowCopyWith<$Res> {
  _$ReportRowCopyWithImpl(this._self, this._then);

  final ReportRow _self;
  final $Res Function(ReportRow) _then;

/// Create a copy of ReportRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? hour = freezed,Object? name = freezed,Object? method = freezed,Object? status = freezed,Object? type = freezed,Object? branchId = freezed,Object? branchName = freezed,Object? orders = null,Object? quantity = null,Object? revenue = null,Object? averageOrderValue = null,Object? previousRevenue = null,Object? revenueChangePct = freezed,Object? cancelledOrders = null,}) {
  return _then(ReportRow(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,hour: freezed == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,averageOrderValue: null == averageOrderValue ? _self.averageOrderValue : averageOrderValue // ignore: cast_nullable_to_non_nullable
as int,previousRevenue: null == previousRevenue ? _self.previousRevenue : previousRevenue // ignore: cast_nullable_to_non_nullable
as int,revenueChangePct: freezed == revenueChangePct ? _self.revenueChangePct : revenueChangePct // ignore: cast_nullable_to_non_nullable
as double?,cancelledOrders: null == cancelledOrders ? _self.cancelledOrders : cancelledOrders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportRow].
extension ReportRowPatterns on ReportRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportRow value)  $default,){
final _that = this;
switch (_that) {
case _ReportRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportRow value)?  $default,){
final _that = this;
switch (_that) {
case _ReportRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? date,  int? hour,  String? name,  String? method,  String? status,  String? type,  String? branchId,  String? branchName,  int orders,  int quantity,  int revenue,  int averageOrderValue,  int previousRevenue,  double? revenueChangePct,  int cancelledOrders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportRow() when $default != null:
return $default(_that.date,_that.hour,_that.name,_that.method,_that.status,_that.type,_that.branchId,_that.branchName,_that.orders,_that.quantity,_that.revenue,_that.averageOrderValue,_that.previousRevenue,_that.revenueChangePct,_that.cancelledOrders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? date,  int? hour,  String? name,  String? method,  String? status,  String? type,  String? branchId,  String? branchName,  int orders,  int quantity,  int revenue,  int averageOrderValue,  int previousRevenue,  double? revenueChangePct,  int cancelledOrders)  $default,) {final _that = this;
switch (_that) {
case _ReportRow():
return $default(_that.date,_that.hour,_that.name,_that.method,_that.status,_that.type,_that.branchId,_that.branchName,_that.orders,_that.quantity,_that.revenue,_that.averageOrderValue,_that.previousRevenue,_that.revenueChangePct,_that.cancelledOrders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? date,  int? hour,  String? name,  String? method,  String? status,  String? type,  String? branchId,  String? branchName,  int orders,  int quantity,  int revenue,  int averageOrderValue,  int previousRevenue,  double? revenueChangePct,  int cancelledOrders)?  $default,) {final _that = this;
switch (_that) {
case _ReportRow() when $default != null:
return $default(_that.date,_that.hour,_that.name,_that.method,_that.status,_that.type,_that.branchId,_that.branchName,_that.orders,_that.quantity,_that.revenue,_that.averageOrderValue,_that.previousRevenue,_that.revenueChangePct,_that.cancelledOrders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportRow implements ReportRow {
  const _ReportRow({this.date, this.hour, this.name, this.method, this.status, this.type, this.branchId, this.branchName, this.orders = 0, this.quantity = 0, this.revenue = 0, this.averageOrderValue = 0, this.previousRevenue = 0, this.revenueChangePct, this.cancelledOrders = 0});
  factory _ReportRow.fromJson(Map<String, dynamic> json) => _$ReportRowFromJson(json);

@override final  String? date;
@override final  int? hour;
@override final  String? name;
@override final  String? method;
@override final  String? status;
@override final  String? type;
@override final  String? branchId;
@override final  String? branchName;
@override@JsonKey() final  int orders;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  int revenue;
@override@JsonKey() final  int averageOrderValue;
@override@JsonKey() final  int previousRevenue;
@override final  double? revenueChangePct;
@override@JsonKey() final  int cancelledOrders;

/// Create a copy of ReportRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportRowCopyWith<_ReportRow> get copyWith => __$ReportRowCopyWithImpl<_ReportRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportRowToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportRow&&(identical(other.date, date) || other.date == date)&&(identical(other.hour, hour) || other.hour == hour)&&(identical(other.name, name) || other.name == name)&&(identical(other.method, method) || other.method == method)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.orders, orders) || other.orders == orders)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.averageOrderValue, averageOrderValue) || other.averageOrderValue == averageOrderValue)&&(identical(other.previousRevenue, previousRevenue) || other.previousRevenue == previousRevenue)&&(identical(other.revenueChangePct, revenueChangePct) || other.revenueChangePct == revenueChangePct)&&(identical(other.cancelledOrders, cancelledOrders) || other.cancelledOrders == cancelledOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,hour,name,method,status,type,branchId,branchName,orders,quantity,revenue,averageOrderValue,previousRevenue,revenueChangePct,cancelledOrders);
}

@override
String toString() {
    return 'ReportRow(date: $date, hour: $hour, name: $name, method: $method, status: $status, type: $type, branchId: $branchId, branchName: $branchName, orders: $orders, quantity: $quantity, revenue: $revenue, averageOrderValue: $averageOrderValue, previousRevenue: $previousRevenue, revenueChangePct: $revenueChangePct, cancelledOrders: $cancelledOrders)';
}


}

/// @nodoc
abstract mixin class _$ReportRowCopyWith<$Res> implements $ReportRowCopyWith<$Res> {
  factory _$ReportRowCopyWith(_ReportRow value, $Res Function(_ReportRow) _then) = __$ReportRowCopyWithImpl;
@override @useResult
$Res call({
 String? date, int? hour, String? name, String? method, String? status, String? type, String? branchId, String? branchName, int orders, int quantity, int revenue, int averageOrderValue, int previousRevenue, double? revenueChangePct, int cancelledOrders
});




}
/// @nodoc
class __$ReportRowCopyWithImpl<$Res>
    implements _$ReportRowCopyWith<$Res> {
  __$ReportRowCopyWithImpl(this._self, this._then);

  final _ReportRow _self;
  final $Res Function(_ReportRow) _then;

/// Create a copy of ReportRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? hour = freezed,Object? name = freezed,Object? method = freezed,Object? status = freezed,Object? type = freezed,Object? branchId = freezed,Object? branchName = freezed,Object? orders = null,Object? quantity = null,Object? revenue = null,Object? averageOrderValue = null,Object? previousRevenue = null,Object? revenueChangePct = freezed,Object? cancelledOrders = null,}) {
  return _then(_ReportRow(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,hour: freezed == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,averageOrderValue: null == averageOrderValue ? _self.averageOrderValue : averageOrderValue // ignore: cast_nullable_to_non_nullable
as int,previousRevenue: null == previousRevenue ? _self.previousRevenue : previousRevenue // ignore: cast_nullable_to_non_nullable
as int,revenueChangePct: freezed == revenueChangePct ? _self.revenueChangePct : revenueChangePct // ignore: cast_nullable_to_non_nullable
as double?,cancelledOrders: null == cancelledOrders ? _self.cancelledOrders : cancelledOrders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ForecastHour {

 int get hour; double get expectedOrders; double get lower; double get upper; int get expectedRevenue;
/// Create a copy of ForecastHour
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastHourCopyWith<ForecastHour> get copyWith => _$ForecastHourCopyWithImpl<ForecastHour>(this as ForecastHour, _$identity);

  /// Serializes this ForecastHour to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ForecastHour;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastHour&&(identical(other.hour, _this.hour) || other.hour == _this.hour)&&(identical(other.expectedOrders, _this.expectedOrders) || other.expectedOrders == _this.expectedOrders)&&(identical(other.lower, _this.lower) || other.lower == _this.lower)&&(identical(other.upper, _this.upper) || other.upper == _this.upper)&&(identical(other.expectedRevenue, _this.expectedRevenue) || other.expectedRevenue == _this.expectedRevenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ForecastHour;
  return Object.hash(runtimeType,_this.hour,_this.expectedOrders,_this.lower,_this.upper,_this.expectedRevenue);
}

@override
String toString() {
  final _this = this as ForecastHour;
  return 'ForecastHour(hour: ${_this.hour}, expectedOrders: ${_this.expectedOrders}, lower: ${_this.lower}, upper: ${_this.upper}, expectedRevenue: ${_this.expectedRevenue})';
}


}

/// @nodoc
abstract mixin class $ForecastHourCopyWith<$Res>  {
  factory $ForecastHourCopyWith(ForecastHour value, $Res Function(ForecastHour) _then) = _$ForecastHourCopyWithImpl;
@useResult
$Res call({
 int hour, double expectedOrders, double lower, double upper, int expectedRevenue
});




}
/// @nodoc
class _$ForecastHourCopyWithImpl<$Res>
    implements $ForecastHourCopyWith<$Res> {
  _$ForecastHourCopyWithImpl(this._self, this._then);

  final ForecastHour _self;
  final $Res Function(ForecastHour) _then;

/// Create a copy of ForecastHour
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hour = null,Object? expectedOrders = null,Object? lower = null,Object? upper = null,Object? expectedRevenue = null,}) {
  return _then(ForecastHour(
hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,expectedOrders: null == expectedOrders ? _self.expectedOrders : expectedOrders // ignore: cast_nullable_to_non_nullable
as double,lower: null == lower ? _self.lower : lower // ignore: cast_nullable_to_non_nullable
as double,upper: null == upper ? _self.upper : upper // ignore: cast_nullable_to_non_nullable
as double,expectedRevenue: null == expectedRevenue ? _self.expectedRevenue : expectedRevenue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ForecastHour].
extension ForecastHourPatterns on ForecastHour {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastHour value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastHour() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastHour value)  $default,){
final _that = this;
switch (_that) {
case _ForecastHour():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastHour value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastHour() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int hour,  double expectedOrders,  double lower,  double upper,  int expectedRevenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastHour() when $default != null:
return $default(_that.hour,_that.expectedOrders,_that.lower,_that.upper,_that.expectedRevenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int hour,  double expectedOrders,  double lower,  double upper,  int expectedRevenue)  $default,) {final _that = this;
switch (_that) {
case _ForecastHour():
return $default(_that.hour,_that.expectedOrders,_that.lower,_that.upper,_that.expectedRevenue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int hour,  double expectedOrders,  double lower,  double upper,  int expectedRevenue)?  $default,) {final _that = this;
switch (_that) {
case _ForecastHour() when $default != null:
return $default(_that.hour,_that.expectedOrders,_that.lower,_that.upper,_that.expectedRevenue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastHour implements ForecastHour {
  const _ForecastHour({required this.hour, this.expectedOrders = 0, this.lower = 0, this.upper = 0, this.expectedRevenue = 0});
  factory _ForecastHour.fromJson(Map<String, dynamic> json) => _$ForecastHourFromJson(json);

@override final  int hour;
@override@JsonKey() final  double expectedOrders;
@override@JsonKey() final  double lower;
@override@JsonKey() final  double upper;
@override@JsonKey() final  int expectedRevenue;

/// Create a copy of ForecastHour
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastHourCopyWith<_ForecastHour> get copyWith => __$ForecastHourCopyWithImpl<_ForecastHour>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastHourToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastHour&&(identical(other.hour, hour) || other.hour == hour)&&(identical(other.expectedOrders, expectedOrders) || other.expectedOrders == expectedOrders)&&(identical(other.lower, lower) || other.lower == lower)&&(identical(other.upper, upper) || other.upper == upper)&&(identical(other.expectedRevenue, expectedRevenue) || other.expectedRevenue == expectedRevenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,hour,expectedOrders,lower,upper,expectedRevenue);
}

@override
String toString() {
    return 'ForecastHour(hour: $hour, expectedOrders: $expectedOrders, lower: $lower, upper: $upper, expectedRevenue: $expectedRevenue)';
}


}

/// @nodoc
abstract mixin class _$ForecastHourCopyWith<$Res> implements $ForecastHourCopyWith<$Res> {
  factory _$ForecastHourCopyWith(_ForecastHour value, $Res Function(_ForecastHour) _then) = __$ForecastHourCopyWithImpl;
@override @useResult
$Res call({
 int hour, double expectedOrders, double lower, double upper, int expectedRevenue
});




}
/// @nodoc
class __$ForecastHourCopyWithImpl<$Res>
    implements _$ForecastHourCopyWith<$Res> {
  __$ForecastHourCopyWithImpl(this._self, this._then);

  final _ForecastHour _self;
  final $Res Function(_ForecastHour) _then;

/// Create a copy of ForecastHour
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hour = null,Object? expectedOrders = null,Object? lower = null,Object? upper = null,Object? expectedRevenue = null,}) {
  return _then(_ForecastHour(
hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,expectedOrders: null == expectedOrders ? _self.expectedOrders : expectedOrders // ignore: cast_nullable_to_non_nullable
as double,lower: null == lower ? _self.lower : lower // ignore: cast_nullable_to_non_nullable
as double,upper: null == upper ? _self.upper : upper // ignore: cast_nullable_to_non_nullable
as double,expectedRevenue: null == expectedRevenue ? _self.expectedRevenue : expectedRevenue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ForecastDay {

 String get date; int get dayOfWeek; double get expectedOrders; int get expectedRevenue; double get historicalAverageOrders; List<int> get peakHours; List<ForecastHour> get hours;
/// Create a copy of ForecastDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastDayCopyWith<ForecastDay> get copyWith => _$ForecastDayCopyWithImpl<ForecastDay>(this as ForecastDay, _$identity);

  /// Serializes this ForecastDay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ForecastDay;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastDay&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.dayOfWeek, _this.dayOfWeek) || other.dayOfWeek == _this.dayOfWeek)&&(identical(other.expectedOrders, _this.expectedOrders) || other.expectedOrders == _this.expectedOrders)&&(identical(other.expectedRevenue, _this.expectedRevenue) || other.expectedRevenue == _this.expectedRevenue)&&(identical(other.historicalAverageOrders, _this.historicalAverageOrders) || other.historicalAverageOrders == _this.historicalAverageOrders)&&const DeepCollectionEquality().equals(other.peakHours, _this.peakHours)&&const DeepCollectionEquality().equals(other.hours, _this.hours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ForecastDay;
  return Object.hash(runtimeType,_this.date,_this.dayOfWeek,_this.expectedOrders,_this.expectedRevenue,_this.historicalAverageOrders,const DeepCollectionEquality().hash(_this.peakHours),const DeepCollectionEquality().hash(_this.hours));
}

@override
String toString() {
  final _this = this as ForecastDay;
  return 'ForecastDay(date: ${_this.date}, dayOfWeek: ${_this.dayOfWeek}, expectedOrders: ${_this.expectedOrders}, expectedRevenue: ${_this.expectedRevenue}, historicalAverageOrders: ${_this.historicalAverageOrders}, peakHours: ${_this.peakHours}, hours: ${_this.hours})';
}


}

/// @nodoc
abstract mixin class $ForecastDayCopyWith<$Res>  {
  factory $ForecastDayCopyWith(ForecastDay value, $Res Function(ForecastDay) _then) = _$ForecastDayCopyWithImpl;
@useResult
$Res call({
 String date, int dayOfWeek, double expectedOrders, int expectedRevenue, double historicalAverageOrders, List<int> peakHours, List<ForecastHour> hours
});




}
/// @nodoc
class _$ForecastDayCopyWithImpl<$Res>
    implements $ForecastDayCopyWith<$Res> {
  _$ForecastDayCopyWithImpl(this._self, this._then);

  final ForecastDay _self;
  final $Res Function(ForecastDay) _then;

/// Create a copy of ForecastDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? dayOfWeek = null,Object? expectedOrders = null,Object? expectedRevenue = null,Object? historicalAverageOrders = null,Object? peakHours = null,Object? hours = null,}) {
  return _then(ForecastDay(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,expectedOrders: null == expectedOrders ? _self.expectedOrders : expectedOrders // ignore: cast_nullable_to_non_nullable
as double,expectedRevenue: null == expectedRevenue ? _self.expectedRevenue : expectedRevenue // ignore: cast_nullable_to_non_nullable
as int,historicalAverageOrders: null == historicalAverageOrders ? _self.historicalAverageOrders : historicalAverageOrders // ignore: cast_nullable_to_non_nullable
as double,peakHours: null == peakHours ? _self.peakHours : peakHours // ignore: cast_nullable_to_non_nullable
as List<int>,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as List<ForecastHour>,
  ));
}

}


/// Adds pattern-matching-related methods to [ForecastDay].
extension ForecastDayPatterns on ForecastDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastDay value)  $default,){
final _that = this;
switch (_that) {
case _ForecastDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastDay value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastDay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  int dayOfWeek,  double expectedOrders,  int expectedRevenue,  double historicalAverageOrders,  List<int> peakHours,  List<ForecastHour> hours)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastDay() when $default != null:
return $default(_that.date,_that.dayOfWeek,_that.expectedOrders,_that.expectedRevenue,_that.historicalAverageOrders,_that.peakHours,_that.hours);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  int dayOfWeek,  double expectedOrders,  int expectedRevenue,  double historicalAverageOrders,  List<int> peakHours,  List<ForecastHour> hours)  $default,) {final _that = this;
switch (_that) {
case _ForecastDay():
return $default(_that.date,_that.dayOfWeek,_that.expectedOrders,_that.expectedRevenue,_that.historicalAverageOrders,_that.peakHours,_that.hours);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  int dayOfWeek,  double expectedOrders,  int expectedRevenue,  double historicalAverageOrders,  List<int> peakHours,  List<ForecastHour> hours)?  $default,) {final _that = this;
switch (_that) {
case _ForecastDay() when $default != null:
return $default(_that.date,_that.dayOfWeek,_that.expectedOrders,_that.expectedRevenue,_that.historicalAverageOrders,_that.peakHours,_that.hours);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastDay implements ForecastDay {
  const _ForecastDay({required this.date, this.dayOfWeek = 0, this.expectedOrders = 0, this.expectedRevenue = 0, this.historicalAverageOrders = 0,  List<int> peakHours = const [],  List<ForecastHour> hours = const []}): _peakHours = peakHours,_hours = hours;
  factory _ForecastDay.fromJson(Map<String, dynamic> json) => _$ForecastDayFromJson(json);

@override final  String date;
@override@JsonKey() final  int dayOfWeek;
@override@JsonKey() final  double expectedOrders;
@override@JsonKey() final  int expectedRevenue;
@override@JsonKey() final  double historicalAverageOrders;
 final  List<int> _peakHours;
@override@JsonKey() List<int> get peakHours {
  if (_peakHours is EqualUnmodifiableListView) return _peakHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_peakHours);
}

 final  List<ForecastHour> _hours;
@override@JsonKey() List<ForecastHour> get hours {
  if (_hours is EqualUnmodifiableListView) return _hours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hours);
}


/// Create a copy of ForecastDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastDayCopyWith<_ForecastDay> get copyWith => __$ForecastDayCopyWithImpl<_ForecastDay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastDayToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastDay&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.expectedOrders, expectedOrders) || other.expectedOrders == expectedOrders)&&(identical(other.expectedRevenue, expectedRevenue) || other.expectedRevenue == expectedRevenue)&&(identical(other.historicalAverageOrders, historicalAverageOrders) || other.historicalAverageOrders == historicalAverageOrders)&&const DeepCollectionEquality().equals(other.peakHours, _peakHours)&&const DeepCollectionEquality().equals(other.hours, _hours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,dayOfWeek,expectedOrders,expectedRevenue,historicalAverageOrders,const DeepCollectionEquality().hash(_peakHours),const DeepCollectionEquality().hash(_hours));
}

@override
String toString() {
    return 'ForecastDay(date: $date, dayOfWeek: $dayOfWeek, expectedOrders: $expectedOrders, expectedRevenue: $expectedRevenue, historicalAverageOrders: $historicalAverageOrders, peakHours: $peakHours, hours: $hours)';
}


}

/// @nodoc
abstract mixin class _$ForecastDayCopyWith<$Res> implements $ForecastDayCopyWith<$Res> {
  factory _$ForecastDayCopyWith(_ForecastDay value, $Res Function(_ForecastDay) _then) = __$ForecastDayCopyWithImpl;
@override @useResult
$Res call({
 String date, int dayOfWeek, double expectedOrders, int expectedRevenue, double historicalAverageOrders, List<int> peakHours, List<ForecastHour> hours
});




}
/// @nodoc
class __$ForecastDayCopyWithImpl<$Res>
    implements _$ForecastDayCopyWith<$Res> {
  __$ForecastDayCopyWithImpl(this._self, this._then);

  final _ForecastDay _self;
  final $Res Function(_ForecastDay) _then;

/// Create a copy of ForecastDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? dayOfWeek = null,Object? expectedOrders = null,Object? expectedRevenue = null,Object? historicalAverageOrders = null,Object? peakHours = null,Object? hours = null,}) {
  return _then(_ForecastDay(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,expectedOrders: null == expectedOrders ? _self.expectedOrders : expectedOrders // ignore: cast_nullable_to_non_nullable
as double,expectedRevenue: null == expectedRevenue ? _self.expectedRevenue : expectedRevenue // ignore: cast_nullable_to_non_nullable
as int,historicalAverageOrders: null == historicalAverageOrders ? _self.historicalAverageOrders : historicalAverageOrders // ignore: cast_nullable_to_non_nullable
as double,peakHours: null == peakHours ? _self._peakHours : peakHours // ignore: cast_nullable_to_non_nullable
as List<int>,hours: null == hours ? _self._hours : hours // ignore: cast_nullable_to_non_nullable
as List<ForecastHour>,
  ));
}


}


/// @nodoc
mixin _$Forecast {

 String get branchId; String get branchName; String get status; String? get message; String? get method; DateTime? get generatedAt; int get historyWeeks; List<ForecastDay> get days;
/// Create a copy of Forecast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastCopyWith<Forecast> get copyWith => _$ForecastCopyWithImpl<Forecast>(this as Forecast, _$identity);

  /// Serializes this Forecast to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Forecast;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Forecast&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.generatedAt, _this.generatedAt) || other.generatedAt == _this.generatedAt)&&(identical(other.historyWeeks, _this.historyWeeks) || other.historyWeeks == _this.historyWeeks)&&const DeepCollectionEquality().equals(other.days, _this.days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Forecast;
  return Object.hash(runtimeType,_this.branchId,_this.branchName,_this.status,_this.message,_this.method,_this.generatedAt,_this.historyWeeks,const DeepCollectionEquality().hash(_this.days));
}

@override
String toString() {
  final _this = this as Forecast;
  return 'Forecast(branchId: ${_this.branchId}, branchName: ${_this.branchName}, status: ${_this.status}, message: ${_this.message}, method: ${_this.method}, generatedAt: ${_this.generatedAt}, historyWeeks: ${_this.historyWeeks}, days: ${_this.days})';
}


}

/// @nodoc
abstract mixin class $ForecastCopyWith<$Res>  {
  factory $ForecastCopyWith(Forecast value, $Res Function(Forecast) _then) = _$ForecastCopyWithImpl;
@useResult
$Res call({
 String branchId, String branchName, String status, String? message, String? method, DateTime? generatedAt, int historyWeeks, List<ForecastDay> days
});




}
/// @nodoc
class _$ForecastCopyWithImpl<$Res>
    implements $ForecastCopyWith<$Res> {
  _$ForecastCopyWithImpl(this._self, this._then);

  final Forecast _self;
  final $Res Function(Forecast) _then;

/// Create a copy of Forecast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branchId = null,Object? branchName = null,Object? status = null,Object? message = freezed,Object? method = freezed,Object? generatedAt = freezed,Object? historyWeeks = null,Object? days = null,}) {
  return _then(Forecast(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,generatedAt: freezed == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,historyWeeks: null == historyWeeks ? _self.historyWeeks : historyWeeks // ignore: cast_nullable_to_non_nullable
as int,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<ForecastDay>,
  ));
}

}


/// Adds pattern-matching-related methods to [Forecast].
extension ForecastPatterns on Forecast {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Forecast value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Forecast() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Forecast value)  $default,){
final _that = this;
switch (_that) {
case _Forecast():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Forecast value)?  $default,){
final _that = this;
switch (_that) {
case _Forecast() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String branchId,  String branchName,  String status,  String? message,  String? method,  DateTime? generatedAt,  int historyWeeks,  List<ForecastDay> days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Forecast() when $default != null:
return $default(_that.branchId,_that.branchName,_that.status,_that.message,_that.method,_that.generatedAt,_that.historyWeeks,_that.days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String branchId,  String branchName,  String status,  String? message,  String? method,  DateTime? generatedAt,  int historyWeeks,  List<ForecastDay> days)  $default,) {final _that = this;
switch (_that) {
case _Forecast():
return $default(_that.branchId,_that.branchName,_that.status,_that.message,_that.method,_that.generatedAt,_that.historyWeeks,_that.days);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String branchId,  String branchName,  String status,  String? message,  String? method,  DateTime? generatedAt,  int historyWeeks,  List<ForecastDay> days)?  $default,) {final _that = this;
switch (_that) {
case _Forecast() when $default != null:
return $default(_that.branchId,_that.branchName,_that.status,_that.message,_that.method,_that.generatedAt,_that.historyWeeks,_that.days);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Forecast implements Forecast {
  const _Forecast({required this.branchId, this.branchName = '', required this.status, this.message, this.method, this.generatedAt, this.historyWeeks = 0,  List<ForecastDay> days = const []}): _days = days;
  factory _Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);

@override final  String branchId;
@override@JsonKey() final  String branchName;
@override final  String status;
@override final  String? message;
@override final  String? method;
@override final  DateTime? generatedAt;
@override@JsonKey() final  int historyWeeks;
 final  List<ForecastDay> _days;
@override@JsonKey() List<ForecastDay> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}


/// Create a copy of Forecast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastCopyWith<_Forecast> get copyWith => __$ForecastCopyWithImpl<_Forecast>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Forecast&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.method, method) || other.method == method)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.historyWeeks, historyWeeks) || other.historyWeeks == historyWeeks)&&const DeepCollectionEquality().equals(other.days, _days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,branchId,branchName,status,message,method,generatedAt,historyWeeks,const DeepCollectionEquality().hash(_days));
}

@override
String toString() {
    return 'Forecast(branchId: $branchId, branchName: $branchName, status: $status, message: $message, method: $method, generatedAt: $generatedAt, historyWeeks: $historyWeeks, days: $days)';
}


}

/// @nodoc
abstract mixin class _$ForecastCopyWith<$Res> implements $ForecastCopyWith<$Res> {
  factory _$ForecastCopyWith(_Forecast value, $Res Function(_Forecast) _then) = __$ForecastCopyWithImpl;
@override @useResult
$Res call({
 String branchId, String branchName, String status, String? message, String? method, DateTime? generatedAt, int historyWeeks, List<ForecastDay> days
});




}
/// @nodoc
class __$ForecastCopyWithImpl<$Res>
    implements _$ForecastCopyWith<$Res> {
  __$ForecastCopyWithImpl(this._self, this._then);

  final _Forecast _self;
  final $Res Function(_Forecast) _then;

/// Create a copy of Forecast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branchId = null,Object? branchName = null,Object? status = null,Object? message = freezed,Object? method = freezed,Object? generatedAt = freezed,Object? historyWeeks = null,Object? days = null,}) {
  return _then(_Forecast(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,generatedAt: freezed == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,historyWeeks: null == historyWeeks ? _self.historyWeeks : historyWeeks // ignore: cast_nullable_to_non_nullable
as int,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<ForecastDay>,
  ));
}


}

// dart format on
