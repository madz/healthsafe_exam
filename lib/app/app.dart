import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthsafe_exam/core/di/injector.dart';
import 'package:healthsafe_exam/features/auth/auth_controller.dart';
import 'package:healthsafe_exam/features/auth/cubit/auth_cubit.dart';
import 'package:healthsafe_exam/features/distance_tracker/cubit/distance_tracker_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => getIt<AuthCubit>(),
        ),
        BlocProvider<DistanceTrackerCubit>(
          create: (BuildContext context) => getIt<DistanceTrackerCubit>(),
        ),
      ],
      child: const MaterialApp(
        home: AuthController(),
      ),
    );
  }
}
