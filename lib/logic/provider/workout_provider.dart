import 'dart:collection';
import 'package:flutter/material.dart'; //ChangeNotifier 상속받기 위해
import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/models/workout.dart';

class WorkoutProvider extends ChangeNotifier {
  List<Workout> _workouts = [
    Workout(
      name: '스쿼트',
      minutes: 30,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-5b016.firebasestorage.app/o/workout_images%2F01081301-Barbell-Standing-Leg-Calf-Raise_Calf_360%20Small.jpeg?alt=media&token=307ea3ab-d359-45ec-b31b-463fe9b82312',
      audioName: 'squat.mp3',
      kcal: 200,
      workoutDays: {DaysOfWeek.monday, DaysOfWeek.wednesday},
    ),
    Workout(
      name: '사이드런지',
      minutes: 20,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-5b016.firebasestorage.app/o/workout_images%2F00201301-Balance-Board_Calves_360%20Small.jpeg?alt=media&token=9ddc6680-f6db-4a0c-8180-1fcf9e80a415',
      audioName: 'side_lunge.mp3',
      kcal: 100,
      workoutDays: {DaysOfWeek.sunday},
    ),
  ];

  List<Workout> get workouts {
    //getter를 정의
    return UnmodifiableListView(_workouts); //List를 수정할 수 없도록 설정
  }

  void addWorkout(Workout workout) {
    _workouts.add(workout);
    notifyListeners(); //리스너에게 알려줌 (화면갱신)
  }

  void deleteWorkout(int index) {
    _workouts.removeAt(index);
    notifyListeners();
  }

  //update workout
  void updateWorkoutDays(
      {required List<bool> isSelected, required int workoutIndex}) {
    workouts[workoutIndex].workoutDays = changeIsSelectedToWorkoutDays(isSelected);
  }

  //change list to set
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

  //change set to list
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
