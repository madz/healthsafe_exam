// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackRecordModel _$TrackRecordModelFromJson(Map<String, dynamic> json) =>
    TrackRecordModel(
      userId: json['userId'] as String,
      id: json['id'] as String,
      distance: (json['distance'] as num).toDouble(),
      dateCreated:
          TrackRecordModel._fromJsonTimestamp(json['dateCreated'] as Timestamp),
      dateUpdated:
          TrackRecordModel._fromJsonTimestamp(json['dateUpdated'] as Timestamp),
    );

Map<String, dynamic> _$TrackRecordModelToJson(TrackRecordModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'distance': instance.distance,
      'dateCreated': TrackRecordModel._toJsonTimestamp(instance.dateCreated),
      'dateUpdated': TrackRecordModel._toJsonTimestamp(instance.dateUpdated),
    };
