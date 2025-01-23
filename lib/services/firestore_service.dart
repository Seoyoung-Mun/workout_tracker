import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/workout.dart';

class FirebaseService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  Future<void> createWorkout(Workout workout) async {
    final _workoutsCollection = _fs.collection('workouts');
    try {
      final docRef = await _workoutsCollection.add(workout.toMap());
      docRef.update({'id': docRef.id});
    } catch (e) {
      throw Exception('create workout err: $e');
    }
    //firebase에서는 batch, transaction을 이용해서 데이터 안정성을 확보할 수도 있음
  }

  Future<Workout> readWorkout(String workoutId) async {
    final _workoutsCollection = _fs.collection('workouts'); //collection안에 document를 가져오는 것
    final documentSnapshot = await _workoutsCollection.doc(workoutId).get();//workoutId를 가진 document를 가져오는 것
    if (!documentSnapshot.exists) throw Exception('workout not found');
    final mapData = documentSnapshot.data()!;

    return Workout.fromMap(mapData);

  }

  Future<void> updateWorkout(Workout workout) async {}

  Future<void> deleteWorkout(String workoutId) async {}
}
