import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthsafe_exam/core/di/injector.dart';
import 'package:healthsafe_exam/core/model/track_record_model.dart';
import 'package:healthsafe_exam/features/auth/cubit/auth_cubit.dart';
import 'package:healthsafe_exam/features/distance_tracker/cubit/distance_tracker_cubit.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class DistanceTrackerPage extends StatefulWidget {
  const DistanceTrackerPage({Key? key}) : super(key: key);

  @override
  State<DistanceTrackerPage> createState() => _DistanceTrackerPageState();
}

class _DistanceTrackerPageState extends State<DistanceTrackerPage> {
  final _authCubit = getIt<AuthCubit>();
  final _distanceTrackerSingleCubit = getIt<DistanceTrackerCubit>();

  final _addRecordController = TextEditingController();
  final _editRecordController = TextEditingController();

  final dateTimeFormat = DateFormat('yy/MM/dd H:m:s');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Track Record'),
        actions: [
          IconButton(
            onPressed: () {
              _authCubit.signOut();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.redAccent,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Distance:'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _addRecordController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Distance in kilometers',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              _addTrackRecord(_addRecordController.text);
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            child: const Text("Add Record"),
          ),
          SizedBox(
            height: 500,
            width: double.maxFinite,
            child: StreamBuilder<QuerySnapshot>(
              stream: _distanceTrackerSingleCubit.getAllRecordAsStream(),
              builder: (_, snapshot) {
                if (snapshot.hasError) {
                  debugPrint('Error: ${snapshot.error}');
                  return Center(
                    child: Text('There was an error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                } else {
                  return _buildTrackRecordList(context, snapshot);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTrackRecordList(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.data != null && snapshot.data!.docs.isEmpty) {
      return const Center(
        child: Text('There was no record'),
      );
    }

    var itemCount = snapshot.data!.docs.length;

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        var data = snapshot.data!.docs[index].data();
        var trackRecordModel =
            TrackRecordModel.fromJson(data as Map<String, dynamic>);

        String dateUpdated =
            dateTimeFormat.format(trackRecordModel.dateUpdated);

        double distance = trackRecordModel.distance;
        return ListTile(
          leading: Text(dateUpdated),
          title: Center(
            child: Text('$distance km'),
          ),
          trailing: Wrap(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  _showEditDialog(context, trackRecordModel);
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  _showDeleteDialog(context, trackRecordModel);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _addTrackRecord(String value) async {
    debugPrint('DistanceTrackerPage _addTrackRecord value = $value');
    const uuid = Uuid();
    var userId = await _authCubit.getUserId();
    var id = uuid.v1();

    TrackRecordModel trackRecordModel = TrackRecordModel(
      userId: userId!,
      id: id,
      distance: double.tryParse(value) ?? 0,
      dateCreated: DateTime.now(),
      dateUpdated: DateTime.now(),
    );

    _distanceTrackerSingleCubit.addRecord(trackRecordModel);
    _addRecordController.clear();
  }

  Future<void> _showEditDialog(
      BuildContext context, TrackRecordModel trackRecordModel) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update distance value'),
          content: TextField(
            onChanged: (value) {},
            controller: _editRecordController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                trackRecordModel.dateUpdated = DateTime.now();
                trackRecordModel.distance =
                    double.tryParse(_editRecordController.text) ?? 0;
                _distanceTrackerSingleCubit.editRecord(trackRecordModel);
                _editRecordController.clear();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              child: const Text(
                'Ok',
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDeleteDialog(
      BuildContext context, TrackRecordModel trackRecordModel) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure you want to delete the value?'),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                _distanceTrackerSingleCubit.deleteRecord(trackRecordModel);
                Navigator.pop(context);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              child: const Text(
                'Ok',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        );
      },
    );
  }
}
