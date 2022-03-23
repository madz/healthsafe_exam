import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthsafe_exam/app/app.dart';
import 'package:healthsafe_exam/core/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Register all the models and services before the app starts
  configureDependencies();

  runApp(const App());
}
