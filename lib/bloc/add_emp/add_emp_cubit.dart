import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realtime_innovation/model_class/emp_details/emp_details_model.dart';
import 'package:realtime_innovation/utils/common_function.dart';
import 'package:realtime_innovation/utils/preference_handler.dart';

part 'add_emp_state.dart';
part 'add_emp_cubit.freezed.dart';

class AddEmpCubit extends Cubit<AddEmpState> {
  final PreferenceHandler? handler;
  AddEmpCubit({this.handler}) : super(const AddEmpState.initial());

  Future<void> saveEmpDetails(EmpDetailsModel empDetailsModel, String id) async {
    emit(AddEmpState.loading());
    try {
      String? data = handler!.getEmpData();
      if (data!.isNotEmpty) {
        List<dynamic> jsonList = jsonDecode(data);
        List<EmpDetailsModel> empList = jsonList.map((json) => EmpDetailsModel.fromJson(json)).toList();
        if(id != "0") {
          empList = empList.map((ele) => ele.empId == id ? empDetailsModel : ele).toList();
        } else {
          empList.add(generateEmpData(empDetailsModel));
        }
        await CommonFunction.saveData(empList, handler!);
      } else {
        List<EmpDetailsModel> empList = [generateEmpData(empDetailsModel)];
        await CommonFunction.saveData(empList, handler!);
      }
      if(id != "0") {
        emit(AddEmpState.saveEmp("Employee data has been edited"));
      } else {
        emit(AddEmpState.saveEmp("Employee data has been added"));
      }
    } catch (e) {
      emit(AddEmpState.error("Unable to add the data"));
    }
  }

  void getEmpDetails(String id) {
    try {
      emit(AddEmpState.loading());
      String? data = handler!.getEmpData();
      if (data!.isNotEmpty) {
        List<dynamic> jsonList = jsonDecode(data);
        List<EmpDetailsModel>? empList = jsonList.map((json) => EmpDetailsModel.fromJson(json)).toList();
        EmpDetailsModel? empDetail = empList.where((data) => data.empId == id).firstOrNull;
        emit(AddEmpState.success(empDetail));
      } else {
        emit(AddEmpState.success(null));
      }
    } catch (e) {
      emit(AddEmpState.error("Something went wrong"));
    }
  }

  EmpDetailsModel generateEmpData(EmpDetailsModel empDetailsModel){
    return EmpDetailsModel(
        empId: empDetailsModel.empId,
        empName: empDetailsModel.empName,
        empRole: empDetailsModel.empRole,
        fromDate: empDetailsModel.fromDate,
        toDate: empDetailsModel.toDate);
  }
}
