import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthsafe_exam/core/model/track_record_model.dart';
import 'package:healthsafe_exam/core/repo/track_record_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_tracker_cubit.freezed.dart';
part 'distance_tracker_state.dart';

@lazySingleton
class DistanceTrackerCubit extends Cubit<DistanceTrackerState> {
  DistanceTrackerCubit(
    this.trackRecordRepo,
  ) : super(DistanceTrackerState.empty());

  final TrackRecordRepo trackRecordRepo;

  void addRecord(TrackRecordModel trackRecordModel) {
    trackRecordRepo.addRecord(trackRecordModel);
  }

  void editRecord(TrackRecordModel trackRecordModel) {
    trackRecordRepo.editRecord(trackRecordModel);
  }

  void deleteRecord(TrackRecordModel trackRecordModel) {
    trackRecordRepo.deleteRecord(trackRecordModel);
  }

  Stream<QuerySnapshot> getAllRecordAsStream() {
    final streamAllTrackRecordUsingUserId =
        trackRecordRepo.getStreamAllTrackRecordUsingUserId();

    return streamAllTrackRecordUsingUserId;
  }
}
