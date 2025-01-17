import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/workout.dart';

class FirebaseService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  Future<void> createWorkout(Workout workout) async {
    final _workoutsCollection = _fs.collection('workouts');

    final docRef = await _workoutsCollection.add(workout.toMap());
    docRef.update({'id': docRef.id});
  }

  Future<void> readWorkout(String workoutId) async {}

  Future<void> updateWorkout(Workout workout) async {}

  Future<void> deleteWorkout(String workoutId) async {}
}
