import 'package:flutter/material.dart';
import 'package:healthsafe_exam/core/di/injector.dart';
import 'package:healthsafe_exam/features/auth/cubit/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _authCubit = getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              child: const Text('Sign In Anonymously'),
              onPressed: () {
                _authCubit.signInAnonymously();
              },
            ),
          ),
        ],
      ),
    );
  }
}
