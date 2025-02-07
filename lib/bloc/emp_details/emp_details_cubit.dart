import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realtime_innovation/model_class/emp_details/emp_details_model.dart';
import 'package:realtime_innovation/utils/common_function.dart';
import 'package:realtime_innovation/utils/preference_handler.dart';

part 'emp_details_state.dart';
part 'emp_details_cubit.freezed.dart';

class EmpDetailsCubit extends Cubit<EmpDetailsState> {
  final PreferenceHandler? handler;
  EmpDetailsCubit({this.handler}) : super(const EmpDetailsState.initial());

  Future<void> getEmpDetails({String? id}) async {
    try {
      emit(EmpDetailsState.loading());
      String? data = handler!.getEmpData();
      if (data!.isNotEmpty) {
        List<dynamic> jsonList = jsonDecode(data);
        List<EmpDetailsModel>? empList = jsonList.map((json) => EmpDetailsModel.fromJson(json)).toList();
        if(id != null) {
          empList.removeWhere((data) => data.empId == id);
          await CommonFunction.saveData(empList, handler!);
        }
        emit(EmpDetailsState.success(empList));
      } else {
        emit(EmpDetailsState.success([]));
      }
    } catch (e) {
      emit(EmpDetailsState.error("Something went wrong"));
    }
  }

  void removeEmpDetails(String id) {
    try {
      emit(EmpDetailsState.loading());
      String? data = handler!.getEmpData();
      List<dynamic> jsonList = jsonDecode(data!);
      List<EmpDetailsModel>? empList = jsonList.map((json) => EmpDetailsModel.fromJson(json)).toList();

    } catch (e) {
      emit(EmpDetailsState.error("Something went wrong"));
    }
  }
}
