import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/logic/provider/workout_provider.dart';
import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/pages/provider_state/add_workout_dialog.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:workout_tracker/logic/workout_manager.dart';
import 'package:workout_tracker/pages/provider_state/workout_tile.dart';

class MyWorkoutListPage extends StatefulWidget {
  MyWorkoutListPage({super.key}) {
    WorkoutManager.increaseMonthlyWorkoutCount();
  }

  @override
  State<MyWorkoutListPage> createState() => _MyWorkoutListPageState();
}

class _MyWorkoutListPageState extends State<MyWorkoutListPage> {
  // void addWorkoutCallback(Workout w3){
  //   // WorkoutProvider().workouts;
  //   workouts.add(w3);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyWorkoutList'),
        centerTitle: true,
      ),
      body:Consumer<WorkoutProvider>(
          builder: (context, workoutProvider, child) {
        List<Workout> workouts = workoutProvider.workouts;
        return ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            return WorkoutTile(
                index: index,
                name: workouts[index].name,
                image: workouts[index].imageName,
                minutes: workouts[index].minutes,
                workoutDays: workouts[index].workoutDays ?? {},
                updateWorkoutDaysFromList: (Set<DaysOfWeek>? workoutDays) {
                  workouts[index].workoutDays = workoutDays;
                });
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: AddWorkoutDialog(),
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
