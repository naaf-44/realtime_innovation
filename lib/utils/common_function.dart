import 'dart:convert';

import 'package:realtime_innovation/model_class/emp_details/emp_details_model.dart';
import 'package:realtime_innovation/utils/preference_handler.dart';

class CommonFunction {
  static Future<void> saveData(List<EmpDetailsModel> empList, PreferenceHandler handler) async {
    final jsonList = empList.map((emp) => emp.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await handler.saveEmpData(jsonString);
  }
}