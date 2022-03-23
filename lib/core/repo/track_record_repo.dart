import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:healthsafe_exam/core/model/track_record_model.dart';
import 'package:healthsafe_exam/features/auth/cubit/auth_cubit.dart';
import 'package:injectable/injectable.dart';

const firestoreCollectionName = 'track_record';

abstract class TrackRecordRepo {
  Future<void> addRecord(TrackRecordModel trackRecordModel);
  Future<void> editRecord(TrackRecordModel trackRecordModel);
  Future<void> deleteRecord(TrackRecordModel trackRecordModel);
  Stream<QuerySnapshot> getStreamAllTrackRecordUsingUserId();
}

@Injectable(as: TrackRecordRepo)
@lazySingleton
class TrackRecordRepoImpl extends TrackRecordRepo {
  TrackRecordRepoImpl(
    this.firestore,
    this.authCubit,
  );

  final FirebaseFirestore firestore;
  final AuthCubit authCubit;

  @override
  Future<void> addRecord(TrackRecordModel trackRecordModel) async {
    debugPrint("TrackRecordRepo addRecord ${trackRecordModel.toString()}");
    try {
      await firestore
          .collection(firestoreCollectionName)
          .doc(trackRecordModel.id)
          .set(trackRecordModel.toJson());
    } on PlatformException catch (platformException) {
      throw PlatformException(code: platformException.code);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> editRecord(TrackRecordModel trackRecordModel) async {
    debugPrint("TrackRecordRepo editRecord ${trackRecordModel.toString()}");
    try {
      await firestore
          .collection(firestoreCollectionName)
          .doc(trackRecordModel.id)
          .update(trackRecordModel.toJson());
    } on PlatformException catch (platformException) {
      throw PlatformException(code: platformException.code);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteRecord(TrackRecordModel trackRecordModel) async {
    debugPrint("TrackRecordRepo deleteRecord ${trackRecordModel.toString()}");
    try {
      await firestore
          .collection(firestoreCollectionName)
          .doc(trackRecordModel.id)
          .delete();
    } on PlatformException catch (platformException) {
      throw PlatformException(code: platformException.code);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> getStreamAllTrackRecordUsingUserId() {
    Stream<QuerySnapshot> query;
    try {
      query = firestore
          .collection(firestoreCollectionName)
          .orderBy('dateUpdated', descending: true)
          .snapshots();
    } on PlatformException catch (platformException) {
      throw PlatformException(code: platformException.code);
    } on Exception catch (e) {
      throw Exception(e);
    }

    return query;
  }
}
