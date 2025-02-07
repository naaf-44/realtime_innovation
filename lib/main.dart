import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:realtime_innovation/bloc/add_emp/add_emp_cubit.dart';
import 'package:realtime_innovation/bloc/emp_details/emp_details_cubit.dart';
import 'package:realtime_innovation/screens/add_employee_screen.dart';
import 'package:realtime_innovation/screens/employee_list.dart';
import 'package:realtime_innovation/utils/app_colors.dart';
import 'package:realtime_innovation/utils/app_path.dart';
import 'package:realtime_innovation/utils/locator.dart';
import 'package:realtime_innovation/utils/preference_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await getIt<PreferenceHandler>().init();
  runApp(const MyApp());
}

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: "/",
    builder: (BuildContext context, GoRouterState state) {
      return const MyHomePage(title: "Realtime Innovation");
    },
    routes: <RouteBase>[
      GoRoute(
        path: "${AppPath.addEmployeeScreen}/:id",
        builder: (context, state){
          return AddEmployeeScreen(id: state.pathParameters['id']);
        }
      )
    ]
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>EmpDetailsCubit(handler: getIt<PreferenceHandler>())),
        BlocProvider(create: (context)=>AddEmpCubit(handler: getIt<PreferenceHandler>())),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Realtime innovation',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmployeeListScreen(),
    );
  }
}
