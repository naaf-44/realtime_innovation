import 'package:freezed_annotation/freezed_annotation.dart';

part 'emp_details_model.freezed.dart';
part 'emp_details_model.g.dart';

@freezed
class EmpDetailsModel with _$EmpDetailsModel {
  const factory EmpDetailsModel({
    String? empId,
    String? empName,
    String? empRole,
    String? fromDate,
    String? toDate,
  }) = _EmpDetailsModel;

  factory EmpDetailsModel.fromJson(Map<String, dynamic> json) => _$EmpDetailsModelFromJson(json);
}
