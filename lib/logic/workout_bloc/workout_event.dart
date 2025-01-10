import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/models/workout.dart';

sealed class WorkoutEvent{
  const WorkoutEvent();
}

final class LoadWorkouts extends WorkoutEvent {

}
final class AddWorkout extends WorkoutEvent {
  final Workout workout;
  AddWorkout(this.workout);
}

final class UpdateWorkout extends WorkoutEvent {
  final int workoutIndex;
  final List<bool> isSelected;
  UpdateWorkout({required this.workoutIndex, required this.isSelected});
}

final class DeleteWorkout extends WorkoutEvent {
  final int workoutIndex;
  DeleteWorkout(this.workoutIndex);
}