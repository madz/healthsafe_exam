// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/cubit/auth_cubit.dart' as _i5;
import '../../features/distance_tracker/cubit/distance_tracker_cubit.dart'
    as _i7;
import '../repo/track_record_repo.dart' as _i6;
import 'module_injector.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(() => injectableModule.firestore);
  gh.lazySingleton<_i5.AuthCubit>(() => _i5.AuthCubit(get<_i3.FirebaseAuth>()));
  gh.factory<_i6.TrackRecordRepo>(() => _i6.TrackRecordRepoImpl(
      get<_i4.FirebaseFirestore>(), get<_i5.AuthCubit>()));
  gh.lazySingleton<_i7.DistanceTrackerCubit>(
      () => _i7.DistanceTrackerCubit(get<_i6.TrackRecordRepo>()));
  return get;
}

class _$InjectableModule extends _i8.InjectableModule {}
