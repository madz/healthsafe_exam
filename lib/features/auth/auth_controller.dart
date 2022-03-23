import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthsafe_exam/core/di/injector.dart';
import 'package:healthsafe_exam/features/auth/cubit/auth_cubit.dart';
import 'package:healthsafe_exam/features/distance_tracker/distance_tracker_page.dart';
import 'package:healthsafe_exam/features/login/login_page.dart';

class AuthController extends StatefulWidget {
  const AuthController({Key? key}) : super(key: key);

  @override
  State<AuthController> createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  final _authCubit = getIt<AuthCubit>();

  @override
  void initState() {
    super.initState();
    _authCubit.authCheckRequested();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state.isSubmitting) {
          return const Scaffold(
            body: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        } else if (state.isAuth) {
          return const DistanceTrackerPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
