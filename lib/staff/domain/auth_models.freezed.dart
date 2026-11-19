// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaffProfile {

 String get id; String get branchId; String get branchName;@JsonKey(unknownEnumValue: StaffRoleWire.unknown) StaffRoleWire get staffRole;@JsonKey(unknownEnumValue: StaffStatus.unknown) StaffStatus get status; bool get onDuty;
/// Create a copy of StaffProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffProfileCopyWith<StaffProfile> get copyWith => _$StaffProfileCopyWithImpl<StaffProfile>(this as StaffProfile, _$identity);

  /// Serializes this StaffProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StaffProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffProfile&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.staffRole, _this.staffRole) || other.staffRole == _this.staffRole)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.onDuty, _this.onDuty) || other.onDuty == _this.onDuty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StaffProfile;
  return Object.hash(runtimeType,_this.id,_this.branchId,_this.branchName,_this.staffRole,_this.status,_this.onDuty);
}

@override
String toString() {
  final _this = this as StaffProfile;
  return 'StaffProfile(id: ${_this.id}, branchId: ${_this.branchId}, branchName: ${_this.branchName}, staffRole: ${_this.staffRole}, status: ${_this.status}, onDuty: ${_this.onDuty})';
}


}

/// @nodoc
abstract mixin class $StaffProfileCopyWith<$Res>  {
  factory $StaffProfileCopyWith(StaffProfile value, $Res Function(StaffProfile) _then) = _$StaffProfileCopyWithImpl;
@useResult
$Res call({
 String id, String branchId, String branchName,@JsonKey(unknownEnumValue: StaffRoleWire.unknown) StaffRoleWire staffRole,@JsonKey(unknownEnumValue: StaffStatus.unknown) StaffStatus status, bool onDuty
});




}
/// @nodoc
class _$StaffProfileCopyWithImpl<$Res>
    implements $StaffProfileCopyWith<$Res> {
  _$StaffProfileCopyWithImpl(this._self, this._then);

  final StaffProfile _self;
  final $Res Function(StaffProfile) _then;

/// Create a copy of StaffProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? branchId = null,Object? branchName = null,Object? staffRole = null,Object? status = null,Object? onDuty = null,}) {
  return _then(StaffProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,staffRole: null == staffRole ? _self.staffRole : staffRole // ignore: cast_nullable_to_non_nullable
as StaffRoleWire,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StaffStatus,onDuty: null == onDuty ? _self.onDuty : onDuty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StaffProfile].
extension StaffProfilePatterns on StaffProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffProfile value)  $default,){
final _that = this;
switch (_that) {
case _StaffProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffProfile value)?  $default,){
final _that = this;
switch (_that) {
case _StaffProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String branchId,  String branchName, @JsonKey(unknownEnumValue: StaffRoleWire.unknown)  StaffRoleWire staffRole, @JsonKey(unknownEnumValue: StaffStatus.unknown)  StaffStatus status,  bool onDuty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffProfile() when $default != null:
return $default(_that.id,_that.branchId,_that.branchName,_that.staffRole,_that.status,_that.onDuty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String branchId,  String branchName, @JsonKey(unknownEnumValue: StaffRoleWire.unknown)  StaffRoleWire staffRole, @JsonKey(unknownEnumValue: StaffStatus.unknown)  StaffStatus status,  bool onDuty)  $default,) {final _that = this;
switch (_that) {
case _StaffProfile():
return $default(_that.id,_that.branchId,_that.branchName,_that.staffRole,_that.status,_that.onDuty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String branchId,  String branchName, @JsonKey(unknownEnumValue: StaffRoleWire.unknown)  StaffRoleWire staffRole, @JsonKey(unknownEnumValue: StaffStatus.unknown)  StaffStatus status,  bool onDuty)?  $default,) {final _that = this;
switch (_that) {
case _StaffProfile() when $default != null:
return $default(_that.id,_that.branchId,_that.branchName,_that.staffRole,_that.status,_that.onDuty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StaffProfile implements StaffProfile {
  const _StaffProfile({required this.id, required this.branchId, this.branchName = '', @JsonKey(unknownEnumValue: StaffRoleWire.unknown) required this.staffRole, @JsonKey(unknownEnumValue: StaffStatus.unknown) required this.status, this.onDuty = false});
  factory _StaffProfile.fromJson(Map<String, dynamic> json) => _$StaffProfileFromJson(json);

@override final  String id;
@override final  String branchId;
@override@JsonKey() final  String branchName;
@override@JsonKey(unknownEnumValue: StaffRoleWire.unknown) final  StaffRoleWire staffRole;
@override@JsonKey(unknownEnumValue: StaffStatus.unknown) final  StaffStatus status;
@override@JsonKey() final  bool onDuty;

/// Create a copy of StaffProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffProfileCopyWith<_StaffProfile> get copyWith => __$StaffProfileCopyWithImpl<_StaffProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.staffRole, staffRole) || other.staffRole == staffRole)&&(identical(other.status, status) || other.status == status)&&(identical(other.onDuty, onDuty) || other.onDuty == onDuty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,branchId,branchName,staffRole,status,onDuty);
}

@override
String toString() {
    return 'StaffProfile(id: $id, branchId: $branchId, branchName: $branchName, staffRole: $staffRole, status: $status, onDuty: $onDuty)';
}


}

/// @nodoc
abstract mixin class _$StaffProfileCopyWith<$Res> implements $StaffProfileCopyWith<$Res> {
  factory _$StaffProfileCopyWith(_StaffProfile value, $Res Function(_StaffProfile) _then) = __$StaffProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String branchId, String branchName,@JsonKey(unknownEnumValue: StaffRoleWire.unknown) StaffRoleWire staffRole,@JsonKey(unknownEnumValue: StaffStatus.unknown) StaffStatus status, bool onDuty
});




}
/// @nodoc
class __$StaffProfileCopyWithImpl<$Res>
    implements _$StaffProfileCopyWith<$Res> {
  __$StaffProfileCopyWithImpl(this._self, this._then);

  final _StaffProfile _self;
  final $Res Function(_StaffProfile) _then;

/// Create a copy of StaffProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? branchId = null,Object? branchName = null,Object? staffRole = null,Object? status = null,Object? onDuty = null,}) {
  return _then(_StaffProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,staffRole: null == staffRole ? _self.staffRole : staffRole // ignore: cast_nullable_to_non_nullable
as StaffRoleWire,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StaffStatus,onDuty: null == onDuty ? _self.onDuty : onDuty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AppUser {

 String get id; String? get name; String? get phone; String? get email;@JsonKey(unknownEnumValue: GlobalRole.unknown) GlobalRole get globalRole; bool get hasPassword; StaffProfile? get staffProfile;
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserCopyWith<AppUser> get copyWith => _$AppUserCopyWithImpl<AppUser>(this as AppUser, _$identity);

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppUser;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUser&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.globalRole, _this.globalRole) || other.globalRole == _this.globalRole)&&(identical(other.hasPassword, _this.hasPassword) || other.hasPassword == _this.hasPassword)&&(identical(other.staffProfile, _this.staffProfile) || other.staffProfile == _this.staffProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppUser;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.email,_this.globalRole,_this.hasPassword,_this.staffProfile);
}

@override
String toString() {
  final _this = this as AppUser;
  return 'AppUser(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, email: ${_this.email}, globalRole: ${_this.globalRole}, hasPassword: ${_this.hasPassword}, staffProfile: ${_this.staffProfile})';
}


}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res>  {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) = _$AppUserCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? phone, String? email,@JsonKey(unknownEnumValue: GlobalRole.unknown) GlobalRole globalRole, bool hasPassword, StaffProfile? staffProfile
});


$StaffProfileCopyWith<$Res>? get staffProfile;

}
/// @nodoc
class _$AppUserCopyWithImpl<$Res>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._self, this._then);

  final AppUser _self;
  final $Res Function(AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? phone = freezed,Object? email = freezed,Object? globalRole = null,Object? hasPassword = null,Object? staffProfile = freezed,}) {
  return _then(AppUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,globalRole: null == globalRole ? _self.globalRole : globalRole // ignore: cast_nullable_to_non_nullable
as GlobalRole,hasPassword: null == hasPassword ? _self.hasPassword : hasPassword // ignore: cast_nullable_to_non_nullable
as bool,staffProfile: freezed == staffProfile ? _self.staffProfile : staffProfile // ignore: cast_nullable_to_non_nullable
as StaffProfile?,
  ));
}
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StaffProfileCopyWith<$Res>? get staffProfile {
    if (_self.staffProfile == null) {
    return null;
  }

  return $StaffProfileCopyWith<$Res>(_self.staffProfile!, (value) {
    return _then(_self.copyWith(staffProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppUser].
extension AppUserPatterns on AppUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUser value)  $default,){
final _that = this;
switch (_that) {
case _AppUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUser value)?  $default,){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? phone,  String? email, @JsonKey(unknownEnumValue: GlobalRole.unknown)  GlobalRole globalRole,  bool hasPassword,  StaffProfile? staffProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.globalRole,_that.hasPassword,_that.staffProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? phone,  String? email, @JsonKey(unknownEnumValue: GlobalRole.unknown)  GlobalRole globalRole,  bool hasPassword,  StaffProfile? staffProfile)  $default,) {final _that = this;
switch (_that) {
case _AppUser():
return $default(_that.id,_that.name,_that.phone,_that.email,_that.globalRole,_that.hasPassword,_that.staffProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? phone,  String? email, @JsonKey(unknownEnumValue: GlobalRole.unknown)  GlobalRole globalRole,  bool hasPassword,  StaffProfile? staffProfile)?  $default,) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.globalRole,_that.hasPassword,_that.staffProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUser extends AppUser {
  const _AppUser({required this.id, this.name, this.phone, this.email, @JsonKey(unknownEnumValue: GlobalRole.unknown) required this.globalRole, this.hasPassword = false, this.staffProfile}): super._();
  factory _AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? phone;
@override final  String? email;
@override@JsonKey(unknownEnumValue: GlobalRole.unknown) final  GlobalRole globalRole;
@override@JsonKey() final  bool hasPassword;
@override final  StaffProfile? staffProfile;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUserCopyWith<_AppUser> get copyWith => __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUserToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.globalRole, globalRole) || other.globalRole == globalRole)&&(identical(other.hasPassword, hasPassword) || other.hasPassword == hasPassword)&&(identical(other.staffProfile, staffProfile) || other.staffProfile == staffProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,email,globalRole,hasPassword,staffProfile);
}

@override
String toString() {
    return 'AppUser(id: $id, name: $name, phone: $phone, email: $email, globalRole: $globalRole, hasPassword: $hasPassword, staffProfile: $staffProfile)';
}


}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) = __$AppUserCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? phone, String? email,@JsonKey(unknownEnumValue: GlobalRole.unknown) GlobalRole globalRole, bool hasPassword, StaffProfile? staffProfile
});


@override $StaffProfileCopyWith<$Res>? get staffProfile;

}
/// @nodoc
class __$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(this._self, this._then);

  final _AppUser _self;
  final $Res Function(_AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? phone = freezed,Object? email = freezed,Object? globalRole = null,Object? hasPassword = null,Object? staffProfile = freezed,}) {
  return _then(_AppUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,globalRole: null == globalRole ? _self.globalRole : globalRole // ignore: cast_nullable_to_non_nullable
as GlobalRole,hasPassword: null == hasPassword ? _self.hasPassword : hasPassword // ignore: cast_nullable_to_non_nullable
as bool,staffProfile: freezed == staffProfile ? _self.staffProfile : staffProfile // ignore: cast_nullable_to_non_nullable
as StaffProfile?,
  ));
}

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StaffProfileCopyWith<$Res>? get staffProfile {
    if (_self.staffProfile == null) {
    return null;
  }

  return $StaffProfileCopyWith<$Res>(_self.staffProfile!, (value) {
    return _then(_self.copyWith(staffProfile: value));
  });
}
}

// dart format on
