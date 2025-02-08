import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:realtime_innovation/bloc/add_emp/add_emp_cubit.dart';
import 'package:realtime_innovation/bloc/emp_details/emp_details_cubit.dart';
import 'package:realtime_innovation/model_class/emp_details/emp_details_model.dart';
import 'package:realtime_innovation/utils/app_colors.dart';
import 'package:realtime_innovation/utils/app_data.dart';
import 'package:realtime_innovation/utils/enum.dart';
import 'package:realtime_innovation/utils/screen_utils.dart';
import 'package:realtime_innovation/widgets/app_button.dart';
import 'package:realtime_innovation/widgets/app_text.dart';
import 'package:realtime_innovation/widgets/input_widget.dart';
import 'package:realtime_innovation/widgets/loader.dart';
import 'package:realtime_innovation/widgets/snack_bar_widget.dart';

class AddEmployeeScreen extends StatefulWidget {
  final String? id;
  const AddEmployeeScreen({super.key, this.id});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController fromDataController = TextEditingController();
  TextEditingController toDateController = TextEditingController(text: "No Date");
  String empId = DateTime.now().toString();
  String title = "";

  late StreamSubscription subscription;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddEmpCubit>().getEmpDetails(widget.id!);
    });
    if(widget.id == "0") {
      title = "Add Employee Details";
    } else {
      title = "Edit Employee Details";
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    roleController.dispose();
    fromDataController.dispose();
    toDateController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            text: title, textType: TextType.appBarTitle),
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          if(widget.id != "0")
            IconButton(onPressed: (){
              context.read<EmpDetailsCubit>().getEmpDetails(id: widget.id);
              context.replace("/");
            }, icon: Icon(Icons.delete), color: AppColors.whiteColor)
        ],
      ),
      body: BlocBuilder<AddEmpCubit, AddEmpState>(
        builder: (context, state) {
          return state.map(
              initial: (_) => LoaderWidget(),
              loading: (_) => LoaderWidget(),
              success: (loadedData) {
                if (loadedData.empDetails != null) {
                  nameController.text = loadedData.empDetails!.empName!;
                  roleController.text = loadedData.empDetails!.empRole!;
                  fromDataController.text = loadedData.empDetails!.fromDate!;
                  toDateController.text = loadedData.empDetails!.toDate!;
                  empId = loadedData.empDetails!.empId!;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InputWidget(controller: nameController, hintText: "Employee Name"),
                        const SizedBox(height: 20),
                        InputWidget(
                            readOnly: true,
                            hintText: "Select Role",
                            onTap: () {
                              openBottomNavigator(context);
                            },
                            controller: roleController,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [

                            Expanded(
                              child: InputWidget(
                                controller: fromDataController,
                                readOnly: true,
                                hintText: "Today",
                                onTap: () {
                                  showDatePickerDialog(context, true);
                                },),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Icon(Icons.arrow_forward,
                                  color: AppColors.primaryColor),
                            ),
                            Expanded(
                              child: InputWidget(
                                controller: toDateController,
                                readOnly: true,
                                onTap: () {
                                  showDatePickerDialog(context, false);
                                },
                                hintText: "No Date",
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppButton(
                                text: "Cancel", buttonType: ButtonType.secondary,
                              onPressed: (){
                                  context.go("/");
                              },
                            ),
                            const SizedBox(width: 10),
                            AppButton(
                                text: "Save",
                                buttonType: ButtonType.primary,
                                onPressed: () {
                                  saveData(context);
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              error: (error) {
                return AppText(
                    text: error.errorMessage, textType: TextType.label);
              },
              saveEmp: (_) => SizedBox());
        },
      ),
    );
  }

  void saveData(BuildContext context) {
    if(formKey.currentState!.validate()) {
      if(checkDate(fromDataController.text, toDateController.text)) {
        EmpDetailsModel empDetailsModel = EmpDetailsModel(
          empId: empId,
          empName: nameController.text,
          empRole: roleController.text,
          fromDate: fromDataController.text,
          toDate: toDateController.text,
        );

        context.read<AddEmpCubit>().saveEmpDetails(empDetailsModel, widget.id!);

        subscription = context
            .read<AddEmpCubit>()
            .stream
            .listen((state) {
          state.map(
            initial: (_) {},
            loading: (_) {},
            saveEmp: (data) {
              SnackBarWidget.show(context, data.message);
              context.replace("/");
              subscription.cancel();
            },
            success: (data) {},
            error: (error) {
              SnackBarWidget.show(context, error.errorMessage);
              subscription.cancel();
            },
          );
        });
      } else {
        SnackBarWidget.show(context, "To date should be after from date");
      }
    }
  }

  void openBottomNavigator(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          width: ScreenUtils.getWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var data in AppData.roleList)
                InkWell(
                  onTap: () {
                    roleController.text = data;
                    Navigator.of(context).pop();
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      AppText(text: data, textType: TextType.title),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Divider(height: 1, color: AppColors.greyColor),
                      ),
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  void showDatePickerDialog(BuildContext context, bool isFromDate) {
    DateTime? selectedDate;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
            content: StatefulBuilder(builder: (context, stateSetter) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isFromDate)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: ScreenUtils.getWidth(context) * 0.3,
                        child: AppButton(
                            text: "Today",
                            buttonType: ButtonType.secondary,
                            onPressed: () {
                              selectedDate = DateTime.now();
                              stateSetter(() {});
                            })),
                    SizedBox(
                        width: ScreenUtils.getWidth(context) * 0.3,
                        child: AppButton(
                            text: "Next Monday",
                            buttonType: ButtonType.primary,
                            onPressed: () {
                              int daysToAdd =
                                  (DateTime.monday - DateTime.now().weekday) %
                                      7;
                              daysToAdd = daysToAdd == 0 ? 7 : daysToAdd;
                              selectedDate =
                                  DateTime.now().add(Duration(days: daysToAdd));
                              stateSetter(() {});
                            })),
                  ],
                ),
              if (isFromDate) const SizedBox(height: 20),
              if (isFromDate)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: ScreenUtils.getWidth(context) * 0.3,
                        child: AppButton(
                            text: "Next Tuesday",
                            buttonType: ButtonType.secondary,
                            onPressed: () {
                              int daysToAdd = (DateTime.tuesday -
                                      DateTime.now().weekday +
                                      7) %
                                  7;
                              daysToAdd = daysToAdd == 0 ? 7 : daysToAdd;
                              selectedDate =
                                  DateTime.now().add(Duration(days: daysToAdd));
                              stateSetter(() {});
                            })),
                    SizedBox(
                        width: ScreenUtils.getWidth(context) * 0.3,
                        child: AppButton(
                            text: "After 1 Week",
                            buttonType: ButtonType.secondary,
                            onPressed: () {
                              selectedDate =
                                  DateTime.now().add(const Duration(days: 7));
                              stateSetter(() {});
                            })),
                  ],
                ),
              if (!isFromDate)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: ScreenUtils.getWidth(context) * 0.3,
                        child: AppButton(
                            text: "No Date",
                            buttonType: ButtonType.primary,
                            onPressed: () {
                              selectedDate = null;
                              toDateController.text = "No Date";
                              stateSetter(() {});
                            })),
                    SizedBox(
                        width: ScreenUtils.getWidth(context) * 0.3,
                        child: AppButton(
                            text: "Today",
                            buttonType: ButtonType.secondary,
                            onPressed: () {
                              selectedDate = DateTime.now();
                              stateSetter(() {});
                            })),
                  ],
                ),
              SizedBox(
                width: ScreenUtils.getWidth(context),
                child: CalendarDatePicker(
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  onDateChanged: (DateTime date) {
                    selectedDate = date;
                    stateSetter(() {});
                  },
                  currentDate: selectedDate,
                ),
              ),
              const SizedBox(height: 0),
              Divider(color: AppColors.greyColor),
              if(ScreenUtils.getWidth(context) < 400)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: showSelectedDate(isFromDate, selectedDate),
                ),
              Row(
                children: [
                  Expanded(
                    child: ScreenUtils.getWidth(context) >= 400 ? showSelectedDate(isFromDate, selectedDate) :SizedBox(),
                  ),
                  AppButton(
                      text: "Cancel",
                      buttonType: ButtonType.secondary,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(width: 5),
                  AppButton(
                    text: "Save",
                    buttonType: ButtonType.primary,
                    onPressed: () {
                      saveDate(isFromDate, selectedDate, context);
                    },
                  ),
                ],
              )
            ],
          );
        }));
      },
    );
  }

  Widget showSelectedDate(bool isFromDate, DateTime? selectedDate){
    return Row(
      children: [
        Icon(Icons.calendar_month_outlined,
            color: AppColors.primaryColor),
        const SizedBox(width: 5),
        AppText(
            text: selectedDate == null
                ? !isFromDate
                ? "No Date"
                : ""
                : DateFormat("d MMM yyyy")
                .format(selectedDate),
            textType: TextType.title),
      ],
    );
  }

  void saveDate(bool isFromDate, DateTime? dateTime, BuildContext context) {
    if (dateTime != null) {
      String formattedDate = DateFormat("d MMM yyyy").format(dateTime);
      if (isFromDate) {
        fromDataController.text = formattedDate;
      } else {
        toDateController.text = formattedDate;
      }
    }
    Navigator.pop(context);
  }

  checkDate(String source, String destin) {
    if(destin == "No Date") {
      return true;
    }
    DateFormat dateFormat = DateFormat('d MMM yyyy');

    DateTime fromDate = dateFormat.parse(source);
    DateTime toDate = dateFormat.parse(destin);

    DateTime fromWithoutTime = DateTime(fromDate.year, fromDate.month, fromDate.day);
    DateTime toWithoutTime = DateTime(toDate.year, toDate.month, toDate.day);

    if(fromWithoutTime.isAtSameMomentAs(toWithoutTime) || fromWithoutTime.isBefore(toWithoutTime)) {
      return true;
    } else {
      return false;
    }
  }
}
