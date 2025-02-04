import 'dart:collection'; //ChangeNotifier 상속받기 위해
import 'package:flutter/material.dart';
import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:workout_tracker/services/firebase_auth_service.dart';
import 'package:workout_tracker/services/firestore_service.dart';

class WorkoutProvider extends ChangeNotifier {
  FirebaseAuthService _auth = FirebaseAuthService();
  final _firestoreService = FirebaseService();

  List<Workout> _workouts = [
    // Workout(
    //   name: '스쿼트',
    //   minutes: 30,
    //   imageName:
    //       'https://firebasestorage.googleapis.com/v0/b/workout-tracker-5b016.firebasestorage.app/o/workout_images%2F01081301-Barbell-Standing-Leg-Calf-Raise_Calf_360%20Small.jpeg?alt=media&token=307ea3ab-d359-45ec-b31b-463fe9b82312',
    //   audioName: 'squat.mp3',
    //   kcal: 200,
    //   workoutDays: {DaysOfWeek.monday, DaysOfWeek.wednesday},
    // ),
    // Workout(
    //   name: '사이드런지',
    //   minutes: 20,
    //   imageName:
    //       'https://firebasestorage.googleapis.com/v0/b/workout-tracker-5b016.firebasestorage.app/o/workout_images%2F00201301-Balance-Board_Calves_360%20Small.jpeg?alt=media&token=9ddc6680-f6db-4a0c-8180-1fcf9e80a415',
    //   audioName: 'side_lunge.mp3',
    //   kcal: 100,
    //   workoutDays: {DaysOfWeek.sunday},
    // ),
  ];

  //[] => list
  //{} => map
  //() => record
  //서비스에서 발생한 에러를 로직단에서 가공하기 위한 변수 (Record타입을 활용하여 message와 errorflag를 분리)
  (bool errorFlag, String? errorMessage) errorState = (false, null);

  void resetErrorState() {
    errorState = (false, null);
  }

  List<Workout> get workouts {
    //getter를 정의
    return UnmodifiableListView(_workouts); //List를 수정할 수 없도록 설정
  }

  Future<void> fetchAllWorkouts() async {
    if (_auth.user == null) return; //user가 null일 경우에는 아무것도 하지 않음(null safety)
    try {
      final List<Workout> fetchAllWorkouts =
          await _firestoreService.fetchAllWorkouts(
        uid: _auth.user!.uid,
        lastWorkout: _workouts.lastOrNull,
      );
      _workouts.addAll(fetchAllWorkouts);
    } catch (e) {
      errorState = (true, e.toString());
    }
    notifyListeners(); //리스너에게 알림
  }

  Future<void> getDoc() async {
    final Workout getWorkout =
        await _firestoreService.readWorkout('H9O1cTcgjcho7sTqSBHt');
    print('로직에 도착한 getDoc : ${getWorkout}');
  }

  Future<void> addWorkout(Workout workout) async {
    workout.uid = _auth.user?.uid;
    try {
      await _firestoreService.createWorkout(workout);
      _workouts.add(workout);
    } catch (e) {
      print('logi layer error');
      // rethrow;
      errorState = (true, e.toString()); //에러상태 변수에 에러상태와 메세지를 담음
    }
    notifyListeners(); //리스너에게 알려줌 (화면갱신)
  }

  void deleteWorkout(int index) {
    if (_workouts[index] == null) return;
    try {
      _firestoreService.deleteWorkout(_workouts[index].id!);
      _workouts.removeAt(index);
    } catch (e) {
      errorState = (true, e.toString());
    }
    notifyListeners();
  }

  //update workout
  void updateWorkoutDays({
    required List<bool> isSelected,
    required int workoutIndex,
  }) {
    try {
      workouts[workoutIndex].workoutDays =
          changeIsSelectedToWorkoutDays(isSelected);
      _firestoreService.updateWorkout(workouts[workoutIndex]);
    } catch (e) {
      errorState = (true, e.toString());
    }
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
