// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emp_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmpDetailsModelImpl _$$EmpDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EmpDetailsModelImpl(
      empId: json['empId'] as String?,
      empName: json['empName'] as String?,
      empRole: json['empRole'] as String?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
    );

Map<String, dynamic> _$$EmpDetailsModelImplToJson(
        _$EmpDetailsModelImpl instance) =>
    <String, dynamic>{
      'empId': instance.empId,
      'empName': instance.empName,
      'empRole': instance.empRole,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
    };
