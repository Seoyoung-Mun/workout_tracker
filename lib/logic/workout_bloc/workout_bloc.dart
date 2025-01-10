import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_event.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_state.dart';
import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:workout_tracker/repository/workout_repository.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository workoutRepository;

  WorkoutBloc(this.workoutRepository) : super(WorkoutInitial()) {
    on<LoadWorkouts>((event, emit) async {
      List<Workout> workouts = workoutRepository.fetchWorkouts();
      await Future.delayed(Duration(seconds: 2));
      emit(WorkoutLoaded(workouts));
    });
    on<AddWorkout>((event, emit) async {
      //db update
      workoutRepository.addWorkout(event.workout);

      //client state update
      List<Workout> workout = state.workouts;
      workout.add(event.workout);
      emit(WorkoutLoaded(workout));
    });
    on<UpdateWorkout>((event, emit) async {
      List<Workout> workouts = state.workouts;
      state.workouts[event.workoutIndex].workoutDays =
          changeIsSelectedToWorkoutDays(event.isSelected);
      workoutRepository.updataWorkout(state.workouts[event.workoutIndex]);
      emit(WorkoutLoaded(workouts));
    });
    on<DeleteWorkout>((event, emit) async {
      state.workouts.removeAt(event.workoutIndex);
      workoutRepository.deleteWorkout(event.workoutIndex);
      emit(WorkoutLoaded(state.workouts));
    });
  }

  Set<DaysOfWeek> changeIsSelectedToWorkoutDays(List<bool>? isSelected) {
    Set<DaysOfWeek> selectedWorkoutDays = {};
    if (isSelected == null) {
      return selectedWorkoutDays;
    }
    for (var weekDay in DaysOfWeek.values) {
      if (isSelected[weekDay.index]) {
        selectedWorkoutDays.add(weekDay);
      }
    }
    return selectedWorkoutDays;
  }

  List<bool> changeWorkoutDaysToIsSelected(Set<DaysOfWeek>? workoutDays) {
    List<bool> isSelected = List.filled(7, false);
    if (workoutDays == null) {
      return isSelected;
    }
    for (var week in workoutDays) {
      isSelected[week.index] = true;
    }
    return isSelected;
  }
}
