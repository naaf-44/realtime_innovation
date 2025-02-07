// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emp_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmpDetailsModel _$EmpDetailsModelFromJson(Map<String, dynamic> json) {
  return _EmpDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$EmpDetailsModel {
  String? get empId => throw _privateConstructorUsedError;
  String? get empName => throw _privateConstructorUsedError;
  String? get empRole => throw _privateConstructorUsedError;
  String? get fromDate => throw _privateConstructorUsedError;
  String? get toDate => throw _privateConstructorUsedError;

  /// Serializes this EmpDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmpDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmpDetailsModelCopyWith<EmpDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmpDetailsModelCopyWith<$Res> {
  factory $EmpDetailsModelCopyWith(
          EmpDetailsModel value, $Res Function(EmpDetailsModel) then) =
      _$EmpDetailsModelCopyWithImpl<$Res, EmpDetailsModel>;
  @useResult
  $Res call(
      {String? empId,
      String? empName,
      String? empRole,
      String? fromDate,
      String? toDate});
}

/// @nodoc
class _$EmpDetailsModelCopyWithImpl<$Res, $Val extends EmpDetailsModel>
    implements $EmpDetailsModelCopyWith<$Res> {
  _$EmpDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmpDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empId = freezed,
    Object? empName = freezed,
    Object? empRole = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
  }) {
    return _then(_value.copyWith(
      empId: freezed == empId
          ? _value.empId
          : empId // ignore: cast_nullable_to_non_nullable
              as String?,
      empName: freezed == empName
          ? _value.empName
          : empName // ignore: cast_nullable_to_non_nullable
              as String?,
      empRole: freezed == empRole
          ? _value.empRole
          : empRole // ignore: cast_nullable_to_non_nullable
              as String?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmpDetailsModelImplCopyWith<$Res>
    implements $EmpDetailsModelCopyWith<$Res> {
  factory _$$EmpDetailsModelImplCopyWith(_$EmpDetailsModelImpl value,
          $Res Function(_$EmpDetailsModelImpl) then) =
      __$$EmpDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? empId,
      String? empName,
      String? empRole,
      String? fromDate,
      String? toDate});
}

/// @nodoc
class __$$EmpDetailsModelImplCopyWithImpl<$Res>
    extends _$EmpDetailsModelCopyWithImpl<$Res, _$EmpDetailsModelImpl>
    implements _$$EmpDetailsModelImplCopyWith<$Res> {
  __$$EmpDetailsModelImplCopyWithImpl(
      _$EmpDetailsModelImpl _value, $Res Function(_$EmpDetailsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmpDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empId = freezed,
    Object? empName = freezed,
    Object? empRole = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
  }) {
    return _then(_$EmpDetailsModelImpl(
      empId: freezed == empId
          ? _value.empId
          : empId // ignore: cast_nullable_to_non_nullable
              as String?,
      empName: freezed == empName
          ? _value.empName
          : empName // ignore: cast_nullable_to_non_nullable
              as String?,
      empRole: freezed == empRole
          ? _value.empRole
          : empRole // ignore: cast_nullable_to_non_nullable
              as String?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmpDetailsModelImpl implements _EmpDetailsModel {
  const _$EmpDetailsModelImpl(
      {this.empId, this.empName, this.empRole, this.fromDate, this.toDate});

  factory _$EmpDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmpDetailsModelImplFromJson(json);

  @override
  final String? empId;
  @override
  final String? empName;
  @override
  final String? empRole;
  @override
  final String? fromDate;
  @override
  final String? toDate;

  @override
  String toString() {
    return 'EmpDetailsModel(empId: $empId, empName: $empName, empRole: $empRole, fromDate: $fromDate, toDate: $toDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmpDetailsModelImpl &&
            (identical(other.empId, empId) || other.empId == empId) &&
            (identical(other.empName, empName) || other.empName == empName) &&
            (identical(other.empRole, empRole) || other.empRole == empRole) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, empId, empName, empRole, fromDate, toDate);

  /// Create a copy of EmpDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmpDetailsModelImplCopyWith<_$EmpDetailsModelImpl> get copyWith =>
      __$$EmpDetailsModelImplCopyWithImpl<_$EmpDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmpDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _EmpDetailsModel implements EmpDetailsModel {
  const factory _EmpDetailsModel(
      {final String? empId,
      final String? empName,
      final String? empRole,
      final String? fromDate,
      final String? toDate}) = _$EmpDetailsModelImpl;

  factory _EmpDetailsModel.fromJson(Map<String, dynamic> json) =
      _$EmpDetailsModelImpl.fromJson;

  @override
  String? get empId;
  @override
  String? get empName;
  @override
  String? get empRole;
  @override
  String? get fromDate;
  @override
  String? get toDate;

  /// Create a copy of EmpDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmpDetailsModelImplCopyWith<_$EmpDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
