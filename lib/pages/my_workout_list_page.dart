import 'package:flutter/material.dart';
import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/pages/add_workout_dialog.dart';
import 'package:workout_tracker/services/firebase_storage_service.dart';
import 'package:workout_tracker/widgets/dashboard_card.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/logic/workout_manager.dart';
import 'package:workout_tracker/widgets/workout_tile.dart';

class MyWorkoutListPage extends StatefulWidget {
  MyWorkoutListPage({super.key}) {
    WorkoutManager.increaseMonthlyWorkoutCount();
  }

  @override
  State<MyWorkoutListPage> createState() => _MyWorkoutListPageState();
}

class _MyWorkoutListPageState extends State<MyWorkoutListPage> {
  //constructor body는 인스턴스가 초기화 된 다음에 동작함
  List<Workout> workouts = [
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

  // void addWorkoutCallback(Workout w3){
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyWorkoutList'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return WorkoutTile(
              index: index,
              name: workouts[index].name,
              image: workouts[index].imageName,
              minutes: workouts[index].minutes,
              workoutDays: workouts[index].workoutDays ?? {},
              deleteWorkout: (int index) {
                setState(() {
                  workouts.removeAt(index);
                });
              },
              updateWorkoutDaysFromList: (Set<DaysOfWeek>? workoutDays) {
                workouts[index].workoutDays = workoutDays;
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: AddWorkoutDialog(
                addWorkoutCallback: (Workout workout3) {
                  setState(() {
                    // print(w3);

                    workouts.add(workout3);
                  });
                }, //콜백함수 정의
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, //버튼 위치 가운데 아래
    );
  }
}
