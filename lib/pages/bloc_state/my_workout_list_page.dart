import 'package:flutter/material.dart';
import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/pages/bloc_state/add_workout_dialog.dart';
import 'package:workout_tracker/services/firebase_storage_service.dart';
import 'package:workout_tracker/widgets/dashboard_card.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/logic/workout_manager.dart';
import 'package:workout_tracker/pages/bloc_state/workout_tile.dart';

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

  ];

  // void addWorkoutCallback(Workout w3){
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyWorkoutListBloc'),
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