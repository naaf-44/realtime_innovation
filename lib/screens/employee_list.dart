import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:realtime_innovation/bloc/emp_details/emp_details_cubit.dart';
import 'package:realtime_innovation/model_class/emp_details/emp_details_model.dart';
import 'package:realtime_innovation/utils/app_colors.dart';
import 'package:realtime_innovation/utils/app_path.dart';
import 'package:realtime_innovation/utils/enum.dart';
import 'package:realtime_innovation/widgets/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_innovation/widgets/loader.dart';
import 'package:realtime_innovation/widgets/snack_bar_widget.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EmpDetailsCubit>().getEmpDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<EmpDetailsCubit>().getEmpDetails();
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: "Employee List", textType: TextType.appBarTitle),
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: BlocBuilder<EmpDetailsCubit, EmpDetailsState>(
            builder: (context, state) {
          return state.map(
              initial: (_) => LoaderWidget(),
              loading: (_) => LoaderWidget(),
              success: (loadedData) {
                if (loadedData.empDetails.isEmpty) {
                  return Center(
                      child: Lottie.asset("assets/lottie/no_data.json",
                          repeat: true, animate: true));
                } else {
                  return getEmployeeList(true, loadedData.empDetails);
                }
              },
              error: (error) {
                return AppText(
                    text: error.errorMessage, textType: TextType.label);
              });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          context.go("/${AppPath.addEmployeeScreen}/0");
        },
        child: Icon(Icons.add, color: AppColors.whiteColor),
      ),
    );
  }

  Widget getEmployeeList(
      bool currentEmp, List<EmpDetailsModel> empDetailModel) {
    List<EmpDetailsModel> currentEmp = [];
    List<EmpDetailsModel> exEmp = [];

    for (var data in empDetailModel) {
      if (data.toDate == null ||
          data.toDate!.isEmpty ||
          checkToDate(data.toDate!)) {
        exEmp.add(data);
      } else {
        currentEmp.add(data);
      }
    }
    return ListView(
      children: [
        AppText(text: "Current Employee", textType: TextType.label),
        const SizedBox(height: 10),
        for (var data in currentEmp)
          InkWell(
            onTap: () {
              context.go("/${AppPath.addEmployeeScreen}/${data.empId}");
            },
            child: dismissibleWidget(
                data.empId,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: data.empName, textType: TextType.title),
                    AppText(text: data.empRole, textType: TextType.body),
                    AppText(text: data.fromDate, textType: TextType.body),
                    Divider(color: AppColors.greyColor.withValues(alpha: 0.4)),
                  ],
                )),
          ),
        const SizedBox(height: 10),
        AppText(text: "Previous Employee", textType: TextType.label),
        const SizedBox(height: 10),
        for (var data in exEmp)
          InkWell(
            onTap: () {
              context.go("/${AppPath.addEmployeeScreen}/${data.empId}");
            },
            child: dismissibleWidget(
                data.empId,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: data.empName, textType: TextType.title),
                    AppText(text: data.empRole, textType: TextType.body),
                    Row(
                      children: [
                        AppText(text: data.fromDate, textType: TextType.body),
                        AppText(text: "  --  ", textType: TextType.body),
                        AppText(text: data.toDate, textType: TextType.body),
                      ],
                    ),
                    Divider(color: AppColors.greyColor.withValues(alpha: 0.4)),
                  ],
                )),
          ),
      ],
    );
  }

  checkToDate(String date) {
    if (date == "No Date") {
      return false;
    }
    DateFormat dateFormat = DateFormat('d MMM yyyy');
    DateTime inputDate = dateFormat.parse(date);
    DateTime today = DateTime.now();
    DateTime todayWithoutTime = DateTime(today.year, today.month, today.day);

    if (inputDate.isAtSameMomentAs(todayWithoutTime) ||
        inputDate.isAfter(todayWithoutTime)) {
      return false;
    } else {
      return true;
    }
  }

  Widget dismissibleWidget(String? id, Widget child) {
    return Dismissible(
      key: Key(id!),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: AppColors.whiteColor),
      ),
      onDismissed: (direction) {
        context.read<EmpDetailsCubit>().getEmpDetails(id: id);
        SnackBarWidget.show(context, "Employee date has been deleted");
      },
      child: child,
    );
  }
}
