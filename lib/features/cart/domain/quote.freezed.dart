// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Quote {

 String get branchId;@JsonKey(unknownEnumValue: OrderType.unknown) OrderType get orderType; List<QuoteLine> get lines; Totals get totals; List<QuoteIssue> get issues; int get minDeliveryOrder; bool get meetsMinimum;@JsonKey(unknownEnumValue: PaymentMethod.unknown) List<PaymentMethod> get allowedPaymentMethods;
/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteCopyWith<Quote> get copyWith => _$QuoteCopyWithImpl<Quote>(this as Quote, _$identity);

  /// Serializes this Quote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Quote;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Quote&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.orderType, _this.orderType) || other.orderType == _this.orderType)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.totals, _this.totals) || other.totals == _this.totals)&&const DeepCollectionEquality().equals(other.issues, _this.issues)&&(identical(other.minDeliveryOrder, _this.minDeliveryOrder) || other.minDeliveryOrder == _this.minDeliveryOrder)&&(identical(other.meetsMinimum, _this.meetsMinimum) || other.meetsMinimum == _this.meetsMinimum)&&const DeepCollectionEquality().equals(other.allowedPaymentMethods, _this.allowedPaymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Quote;
  return Object.hash(runtimeType,_this.branchId,_this.orderType,const DeepCollectionEquality().hash(_this.lines),_this.totals,const DeepCollectionEquality().hash(_this.issues),_this.minDeliveryOrder,_this.meetsMinimum,const DeepCollectionEquality().hash(_this.allowedPaymentMethods));
}

@override
String toString() {
  final _this = this as Quote;
  return 'Quote(branchId: ${_this.branchId}, orderType: ${_this.orderType}, lines: ${_this.lines}, totals: ${_this.totals}, issues: ${_this.issues}, minDeliveryOrder: ${_this.minDeliveryOrder}, meetsMinimum: ${_this.meetsMinimum}, allowedPaymentMethods: ${_this.allowedPaymentMethods})';
}


}

/// @nodoc
abstract mixin class $QuoteCopyWith<$Res>  {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) _then) = _$QuoteCopyWithImpl;
@useResult
$Res call({
 String branchId,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType orderType, List<QuoteLine> lines, Totals totals, List<QuoteIssue> issues, int minDeliveryOrder, bool meetsMinimum,@JsonKey(unknownEnumValue: PaymentMethod.unknown) List<PaymentMethod> allowedPaymentMethods
});


$TotalsCopyWith<$Res> get totals;

}
/// @nodoc
class _$QuoteCopyWithImpl<$Res>
    implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._self, this._then);

  final Quote _self;
  final $Res Function(Quote) _then;

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branchId = null,Object? orderType = null,Object? lines = null,Object? totals = null,Object? issues = null,Object? minDeliveryOrder = null,Object? meetsMinimum = null,Object? allowedPaymentMethods = null,}) {
  return _then(Quote(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as OrderType,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<QuoteLine>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as Totals,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as List<QuoteIssue>,minDeliveryOrder: null == minDeliveryOrder ? _self.minDeliveryOrder : minDeliveryOrder // ignore: cast_nullable_to_non_nullable
as int,meetsMinimum: null == meetsMinimum ? _self.meetsMinimum : meetsMinimum // ignore: cast_nullable_to_non_nullable
as bool,allowedPaymentMethods: null == allowedPaymentMethods ? _self.allowedPaymentMethods : allowedPaymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethod>,
  ));
}
/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotalsCopyWith<$Res> get totals {
  
  return $TotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [Quote].
extension QuotePatterns on Quote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Quote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Quote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Quote value)  $default,){
final _that = this;
switch (_that) {
case _Quote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Quote value)?  $default,){
final _that = this;
switch (_that) {
case _Quote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String branchId, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType orderType,  List<QuoteLine> lines,  Totals totals,  List<QuoteIssue> issues,  int minDeliveryOrder,  bool meetsMinimum, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  List<PaymentMethod> allowedPaymentMethods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Quote() when $default != null:
return $default(_that.branchId,_that.orderType,_that.lines,_that.totals,_that.issues,_that.minDeliveryOrder,_that.meetsMinimum,_that.allowedPaymentMethods);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String branchId, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType orderType,  List<QuoteLine> lines,  Totals totals,  List<QuoteIssue> issues,  int minDeliveryOrder,  bool meetsMinimum, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  List<PaymentMethod> allowedPaymentMethods)  $default,) {final _that = this;
switch (_that) {
case _Quote():
return $default(_that.branchId,_that.orderType,_that.lines,_that.totals,_that.issues,_that.minDeliveryOrder,_that.meetsMinimum,_that.allowedPaymentMethods);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String branchId, @JsonKey(unknownEnumValue: OrderType.unknown)  OrderType orderType,  List<QuoteLine> lines,  Totals totals,  List<QuoteIssue> issues,  int minDeliveryOrder,  bool meetsMinimum, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  List<PaymentMethod> allowedPaymentMethods)?  $default,) {final _that = this;
switch (_that) {
case _Quote() when $default != null:
return $default(_that.branchId,_that.orderType,_that.lines,_that.totals,_that.issues,_that.minDeliveryOrder,_that.meetsMinimum,_that.allowedPaymentMethods);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Quote extends Quote {
  const _Quote({required this.branchId, @JsonKey(unknownEnumValue: OrderType.unknown) required this.orderType,  List<QuoteLine> lines = const [], required this.totals,  List<QuoteIssue> issues = const [], this.minDeliveryOrder = 0, this.meetsMinimum = true, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  List<PaymentMethod> allowedPaymentMethods = const []}): _lines = lines,_issues = issues,_allowedPaymentMethods = allowedPaymentMethods,super._();
  factory _Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

@override final  String branchId;
@override@JsonKey(unknownEnumValue: OrderType.unknown) final  OrderType orderType;
 final  List<QuoteLine> _lines;
@override@JsonKey() List<QuoteLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override final  Totals totals;
 final  List<QuoteIssue> _issues;
@override@JsonKey() List<QuoteIssue> get issues {
  if (_issues is EqualUnmodifiableListView) return _issues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_issues);
}

@override@JsonKey() final  int minDeliveryOrder;
@override@JsonKey() final  bool meetsMinimum;
 final  List<PaymentMethod> _allowedPaymentMethods;
@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) List<PaymentMethod> get allowedPaymentMethods {
  if (_allowedPaymentMethods is EqualUnmodifiableListView) return _allowedPaymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedPaymentMethods);
}


/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteCopyWith<_Quote> get copyWith => __$QuoteCopyWithImpl<_Quote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Quote&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.totals, totals) || other.totals == totals)&&const DeepCollectionEquality().equals(other.issues, _issues)&&(identical(other.minDeliveryOrder, minDeliveryOrder) || other.minDeliveryOrder == minDeliveryOrder)&&(identical(other.meetsMinimum, meetsMinimum) || other.meetsMinimum == meetsMinimum)&&const DeepCollectionEquality().equals(other.allowedPaymentMethods, _allowedPaymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,branchId,orderType,const DeepCollectionEquality().hash(_lines),totals,const DeepCollectionEquality().hash(_issues),minDeliveryOrder,meetsMinimum,const DeepCollectionEquality().hash(_allowedPaymentMethods));
}

@override
String toString() {
    return 'Quote(branchId: $branchId, orderType: $orderType, lines: $lines, totals: $totals, issues: $issues, minDeliveryOrder: $minDeliveryOrder, meetsMinimum: $meetsMinimum, allowedPaymentMethods: $allowedPaymentMethods)';
}


}

/// @nodoc
abstract mixin class _$QuoteCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$QuoteCopyWith(_Quote value, $Res Function(_Quote) _then) = __$QuoteCopyWithImpl;
@override @useResult
$Res call({
 String branchId,@JsonKey(unknownEnumValue: OrderType.unknown) OrderType orderType, List<QuoteLine> lines, Totals totals, List<QuoteIssue> issues, int minDeliveryOrder, bool meetsMinimum,@JsonKey(unknownEnumValue: PaymentMethod.unknown) List<PaymentMethod> allowedPaymentMethods
});


@override $TotalsCopyWith<$Res> get totals;

}
/// @nodoc
class __$QuoteCopyWithImpl<$Res>
    implements _$QuoteCopyWith<$Res> {
  __$QuoteCopyWithImpl(this._self, this._then);

  final _Quote _self;
  final $Res Function(_Quote) _then;

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branchId = null,Object? orderType = null,Object? lines = null,Object? totals = null,Object? issues = null,Object? minDeliveryOrder = null,Object? meetsMinimum = null,Object? allowedPaymentMethods = null,}) {
  return _then(_Quote(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as OrderType,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<QuoteLine>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as Totals,issues: null == issues ? _self._issues : issues // ignore: cast_nullable_to_non_nullable
as List<QuoteIssue>,minDeliveryOrder: null == minDeliveryOrder ? _self.minDeliveryOrder : minDeliveryOrder // ignore: cast_nullable_to_non_nullable
as int,meetsMinimum: null == meetsMinimum ? _self.meetsMinimum : meetsMinimum // ignore: cast_nullable_to_non_nullable
as bool,allowedPaymentMethods: null == allowedPaymentMethods ? _self._allowedPaymentMethods : allowedPaymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethod>,
  ));
}

/// Create a copy of Quote
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
mixin _$QuoteLine {

 String get menuItemId; String get name; int get quantity; int get unitPrice; int get optionsTotal; int get lineTotal; List<PricedOption> get options; String? get notes;
/// Create a copy of QuoteLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteLineCopyWith<QuoteLine> get copyWith => _$QuoteLineCopyWithImpl<QuoteLine>(this as QuoteLine, _$identity);

  /// Serializes this QuoteLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuoteLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteLine&&(identical(other.menuItemId, _this.menuItemId) || other.menuItemId == _this.menuItemId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.optionsTotal, _this.optionsTotal) || other.optionsTotal == _this.optionsTotal)&&(identical(other.lineTotal, _this.lineTotal) || other.lineTotal == _this.lineTotal)&&const DeepCollectionEquality().equals(other.options, _this.options)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuoteLine;
  return Object.hash(runtimeType,_this.menuItemId,_this.name,_this.quantity,_this.unitPrice,_this.optionsTotal,_this.lineTotal,const DeepCollectionEquality().hash(_this.options),_this.notes);
}

@override
String toString() {
  final _this = this as QuoteLine;
  return 'QuoteLine(menuItemId: ${_this.menuItemId}, name: ${_this.name}, quantity: ${_this.quantity}, unitPrice: ${_this.unitPrice}, optionsTotal: ${_this.optionsTotal}, lineTotal: ${_this.lineTotal}, options: ${_this.options}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $QuoteLineCopyWith<$Res>  {
  factory $QuoteLineCopyWith(QuoteLine value, $Res Function(QuoteLine) _then) = _$QuoteLineCopyWithImpl;
@useResult
$Res call({
 String menuItemId, String name, int quantity, int unitPrice, int optionsTotal, int lineTotal, List<PricedOption> options, String? notes
});




}
/// @nodoc
class _$QuoteLineCopyWithImpl<$Res>
    implements $QuoteLineCopyWith<$Res> {
  _$QuoteLineCopyWithImpl(this._self, this._then);

  final QuoteLine _self;
  final $Res Function(QuoteLine) _then;

/// Create a copy of QuoteLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuItemId = null,Object? name = null,Object? quantity = null,Object? unitPrice = null,Object? optionsTotal = null,Object? lineTotal = null,Object? options = null,Object? notes = freezed,}) {
  return _then(QuoteLine(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,optionsTotal: null == optionsTotal ? _self.optionsTotal : optionsTotal // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<PricedOption>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteLine].
extension QuoteLinePatterns on QuoteLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteLine value)  $default,){
final _that = this;
switch (_that) {
case _QuoteLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteLine value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String menuItemId,  String name,  int quantity,  int unitPrice,  int optionsTotal,  int lineTotal,  List<PricedOption> options,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteLine() when $default != null:
return $default(_that.menuItemId,_that.name,_that.quantity,_that.unitPrice,_that.optionsTotal,_that.lineTotal,_that.options,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String menuItemId,  String name,  int quantity,  int unitPrice,  int optionsTotal,  int lineTotal,  List<PricedOption> options,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _QuoteLine():
return $default(_that.menuItemId,_that.name,_that.quantity,_that.unitPrice,_that.optionsTotal,_that.lineTotal,_that.options,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String menuItemId,  String name,  int quantity,  int unitPrice,  int optionsTotal,  int lineTotal,  List<PricedOption> options,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _QuoteLine() when $default != null:
return $default(_that.menuItemId,_that.name,_that.quantity,_that.unitPrice,_that.optionsTotal,_that.lineTotal,_that.options,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuoteLine implements QuoteLine {
  const _QuoteLine({required this.menuItemId, required this.name, required this.quantity, required this.unitPrice, this.optionsTotal = 0, required this.lineTotal,  List<PricedOption> options = const [], this.notes}): _options = options;
  factory _QuoteLine.fromJson(Map<String, dynamic> json) => _$QuoteLineFromJson(json);

@override final  String menuItemId;
@override final  String name;
@override final  int quantity;
@override final  int unitPrice;
@override@JsonKey() final  int optionsTotal;
@override final  int lineTotal;
 final  List<PricedOption> _options;
@override@JsonKey() List<PricedOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  String? notes;

/// Create a copy of QuoteLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteLineCopyWith<_QuoteLine> get copyWith => __$QuoteLineCopyWithImpl<_QuoteLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteLine&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.optionsTotal, optionsTotal) || other.optionsTotal == optionsTotal)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,menuItemId,name,quantity,unitPrice,optionsTotal,lineTotal,const DeepCollectionEquality().hash(_options),notes);
}

@override
String toString() {
    return 'QuoteLine(menuItemId: $menuItemId, name: $name, quantity: $quantity, unitPrice: $unitPrice, optionsTotal: $optionsTotal, lineTotal: $lineTotal, options: $options, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$QuoteLineCopyWith<$Res> implements $QuoteLineCopyWith<$Res> {
  factory _$QuoteLineCopyWith(_QuoteLine value, $Res Function(_QuoteLine) _then) = __$QuoteLineCopyWithImpl;
@override @useResult
$Res call({
 String menuItemId, String name, int quantity, int unitPrice, int optionsTotal, int lineTotal, List<PricedOption> options, String? notes
});




}
/// @nodoc
class __$QuoteLineCopyWithImpl<$Res>
    implements _$QuoteLineCopyWith<$Res> {
  __$QuoteLineCopyWithImpl(this._self, this._then);

  final _QuoteLine _self;
  final $Res Function(_QuoteLine) _then;

/// Create a copy of QuoteLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuItemId = null,Object? name = null,Object? quantity = null,Object? unitPrice = null,Object? optionsTotal = null,Object? lineTotal = null,Object? options = null,Object? notes = freezed,}) {
  return _then(_QuoteLine(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,optionsTotal: null == optionsTotal ? _self.optionsTotal : optionsTotal // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<PricedOption>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$QuoteIssue {

 int get index; String get menuItemId; String get code; String get message;
/// Create a copy of QuoteIssue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteIssueCopyWith<QuoteIssue> get copyWith => _$QuoteIssueCopyWithImpl<QuoteIssue>(this as QuoteIssue, _$identity);

  /// Serializes this QuoteIssue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuoteIssue;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteIssue&&(identical(other.index, _this.index) || other.index == _this.index)&&(identical(other.menuItemId, _this.menuItemId) || other.menuItemId == _this.menuItemId)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.message, _this.message) || other.message == _this.message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuoteIssue;
  return Object.hash(runtimeType,_this.index,_this.menuItemId,_this.code,_this.message);
}

@override
String toString() {
  final _this = this as QuoteIssue;
  return 'QuoteIssue(index: ${_this.index}, menuItemId: ${_this.menuItemId}, code: ${_this.code}, message: ${_this.message})';
}


}

/// @nodoc
abstract mixin class $QuoteIssueCopyWith<$Res>  {
  factory $QuoteIssueCopyWith(QuoteIssue value, $Res Function(QuoteIssue) _then) = _$QuoteIssueCopyWithImpl;
@useResult
$Res call({
 int index, String menuItemId, String code, String message
});




}
/// @nodoc
class _$QuoteIssueCopyWithImpl<$Res>
    implements $QuoteIssueCopyWith<$Res> {
  _$QuoteIssueCopyWithImpl(this._self, this._then);

  final QuoteIssue _self;
  final $Res Function(QuoteIssue) _then;

/// Create a copy of QuoteIssue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? menuItemId = null,Object? code = null,Object? message = null,}) {
  return _then(QuoteIssue(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteIssue].
extension QuoteIssuePatterns on QuoteIssue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteIssue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteIssue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteIssue value)  $default,){
final _that = this;
switch (_that) {
case _QuoteIssue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteIssue value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteIssue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  String menuItemId,  String code,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteIssue() when $default != null:
return $default(_that.index,_that.menuItemId,_that.code,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  String menuItemId,  String code,  String message)  $default,) {final _that = this;
switch (_that) {
case _QuoteIssue():
return $default(_that.index,_that.menuItemId,_that.code,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  String menuItemId,  String code,  String message)?  $default,) {final _that = this;
switch (_that) {
case _QuoteIssue() when $default != null:
return $default(_that.index,_that.menuItemId,_that.code,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuoteIssue extends QuoteIssue {
  const _QuoteIssue({required this.index, required this.menuItemId, required this.code, required this.message}): super._();
  factory _QuoteIssue.fromJson(Map<String, dynamic> json) => _$QuoteIssueFromJson(json);

@override final  int index;
@override final  String menuItemId;
@override final  String code;
@override final  String message;

/// Create a copy of QuoteIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteIssueCopyWith<_QuoteIssue> get copyWith => __$QuoteIssueCopyWithImpl<_QuoteIssue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteIssueToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteIssue&&(identical(other.index, index) || other.index == index)&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,index,menuItemId,code,message);
}

@override
String toString() {
    return 'QuoteIssue(index: $index, menuItemId: $menuItemId, code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$QuoteIssueCopyWith<$Res> implements $QuoteIssueCopyWith<$Res> {
  factory _$QuoteIssueCopyWith(_QuoteIssue value, $Res Function(_QuoteIssue) _then) = __$QuoteIssueCopyWithImpl;
@override @useResult
$Res call({
 int index, String menuItemId, String code, String message
});




}
/// @nodoc
class __$QuoteIssueCopyWithImpl<$Res>
    implements _$QuoteIssueCopyWith<$Res> {
  __$QuoteIssueCopyWithImpl(this._self, this._then);

  final _QuoteIssue _self;
  final $Res Function(_QuoteIssue) _then;

/// Create a copy of QuoteIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? menuItemId = null,Object? code = null,Object? message = null,}) {
  return _then(_QuoteIssue(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
