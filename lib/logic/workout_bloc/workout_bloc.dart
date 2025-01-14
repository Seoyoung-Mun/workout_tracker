import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_event.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_state.dart';
import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:workout_tracker/repository/workout_repository.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository workoutRepository;

  WorkoutBloc(this.workoutRepository) : super(WorkoutInitial()) {
    //constructor body 안에 4개의 on 메소드를 생성하여
    //각각의 이벤트에 따른 상태를 어떻게 바꿀지 구현해준다.
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

      //화면단에 반영하는 부분
      emit(WorkoutLoaded(workout));
    });

    on<UpdateWorkout>((event, emit) async {
      // List<Workout> workouts = state.workouts;
      state.workouts[event.workoutIndex].workoutDays =
          changeIsSelectedToWorkoutDays(event.isSelected);
      workoutRepository.updataWorkout(state.workouts[event.workoutIndex]);
      emit(WorkoutLoaded(state.workouts));
    });

    on<DeleteWorkout>((event, emit) async {
      workoutRepository.deleteWorkout(event.workoutIndex);
      state.workouts.removeAt(event.workoutIndex);
      emit(WorkoutLoaded(state.workouts));
    });
  }

  //보조함수 changeIsSelectedToWorkoutDays
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

  //보조함수 changeWorkoutDaysToIsSelected
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
