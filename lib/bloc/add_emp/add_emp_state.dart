part of 'add_emp_cubit.dart';

@freezed
class AddEmpState with _$AddEmpState {
  const factory AddEmpState.initial() = _Initial;
  const factory AddEmpState.loading() = _Loading;
  const factory AddEmpState.saveEmp(String message)= _SaveEmp;
  const factory AddEmpState.success(EmpDetailsModel? empDetails) = _Success;
  const factory AddEmpState.error(String errorMessage) = _Error;
}
