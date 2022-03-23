import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track_record_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TrackRecordModel {
  String userId;
  String id;
  double distance;

  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime dateCreated;

  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime dateUpdated;

  TrackRecordModel({
    required this.userId,
    required this.id,
    required this.distance,
    required this.dateCreated,
    required this.dateUpdated,
  });

  static DateTime _fromJsonTimestamp(Timestamp timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

  static Timestamp _toJsonTimestamp(DateTime time) => Timestamp.fromDate(time);

  factory TrackRecordModel.fromJson(Map<String, dynamic> json) =>
      _$TrackRecordModelFromJson(json);
  Map<String, dynamic> toJson() => _$TrackRecordModelToJson(this);

  @override
  String toString() {
    return '''userId = $userId id = $id distance = $distance dateCreated = $dateCreated dateUpdated = $dateUpdated''';
  }
}
