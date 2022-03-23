part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isSubmitting,
    required bool isAuth,
  }) = _AuthState;
  const AuthState._();

  factory AuthState.initial() => const AuthState(
        isSubmitting: false,
        isAuth: false,
      );

  factory AuthState.loading() => const AuthState(
        isSubmitting: true,
        isAuth: false,
      );

  factory AuthState.authenticated() => const AuthState(
        isSubmitting: false,
        isAuth: true,
      );

  factory AuthState.unAuthenticated() => const AuthState(
        isSubmitting: false,
        isAuth: false,
      );
}
