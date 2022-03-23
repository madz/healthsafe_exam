import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.firebaseAuth,
  ) : super(AuthState.initial());

  final FirebaseAuth firebaseAuth;

  Future<void> authCheckRequested() async {
    debugPrint('AuthCubit authCheckRequested()');

    if (firebaseAuth.currentUser != null) {
      debugPrint('uid = ${firebaseAuth.currentUser?.uid}');
      emit(AuthState.authenticated());
    } else {
      emit(AuthState.unAuthenticated());
    }
  }

  Future<void> signInAnonymously() async {
    debugPrint('AuthCubit signInAnonymously()');
    emit(AuthState.loading());
    await firebaseAuth.signInAnonymously();
    emit(AuthState.authenticated());
  }

  Future<void> signOut() async {
    debugPrint('AuthCubit signOut()');
    emit(AuthState.loading());
    await firebaseAuth.signOut();
    emit(AuthState.unAuthenticated());
  }

  Future<String?> getUserId() async {
    debugPrint('AuthCubit getUserId()');
    if (firebaseAuth.currentUser != null) {
      return firebaseAuth.currentUser?.uid ?? '';
    }
    return null;
  }
}
