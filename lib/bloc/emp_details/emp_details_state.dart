part of 'emp_details_cubit.dart';

@freezed
class EmpDetailsState with _$EmpDetailsState {
  const factory EmpDetailsState.initial() = _Initial;
  const factory EmpDetailsState.loading() = _Loading;
  const factory EmpDetailsState.success(List<EmpDetailsModel> empDetails) = _Success;
  const factory EmpDetailsState.error(String errorMessage) = _Error;
}
