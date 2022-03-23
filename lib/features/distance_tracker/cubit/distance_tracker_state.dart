part of 'distance_tracker_cubit.dart';

@freezed
class DistanceTrackerState with _$DistanceTrackerState {
  const factory DistanceTrackerState({
    required TrackRecordModel? trackRecordModel,
    required bool isSubmitting,
    required bool isSuccess,
    required bool isFailure,
    required String info,
  }) = _DistanceTrackerState;
  const DistanceTrackerState._();

  factory DistanceTrackerState.empty() => const DistanceTrackerState(
        trackRecordModel: null,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        info: '',
      );

  factory DistanceTrackerState.loading() => const DistanceTrackerState(
        trackRecordModel: null,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        info: '',
      );

  factory DistanceTrackerState.failure({required String? info}) =>
      DistanceTrackerState(
        trackRecordModel: null,
        isSubmitting: false,
        isSuccess: false,
        isFailure: true,
        info: info!,
      );

  factory DistanceTrackerState.success({
    required TrackRecordModel trackRecordModel,
    required String? info,
  }) {
    return DistanceTrackerState(
      trackRecordModel: trackRecordModel,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      info: info!,
    );
  }
}
