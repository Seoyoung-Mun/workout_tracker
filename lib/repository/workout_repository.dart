import 'package:workout_tracker/models/workout.dart';
import 'package:workout_tracker/services/fake_db.dart';

class WorkoutRepository {
  FakeDb fakeDb;

  WorkoutRepository(this.fakeDb); //constructor

  List<Workout> fetchWorkouts() {
    return fakeDb.fetchWorkouts();
  }

  Workout getWorkout(int index) {
    return fakeDb.getWorkout(index);
  }

  void addWorkout(Workout workout) {
    fakeDb.addWorkout(workout);
  }

  void deleteWorkout(int workoutIndex) {
    // _workouts.removeAt(index);
    fakeDb.deleteWorkout(workoutIndex);
  }

  void updataWorkout(Workout workout) {
    // _workouts[index] = workout;
    fakeDb.updataWorkout(workout);
  }
}
