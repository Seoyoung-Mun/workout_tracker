import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_bloc.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_event.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_state.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WorkoutBloc>().add(LoadWorkouts());
  }

  // void addWorkoutCallback(Workout w3){
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyWorkoutListBloc'),
        centerTitle: true,
      ),
      body: BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
        state.workouts;
        switch (state) {
          case WorkoutInitial():
            return Center(
              child: CircularProgressIndicator(),
            );
          case WorkoutLoaded():
            List<Workout> workouts = state.workouts;
            return ListView.builder(
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                return WorkoutTile(
                  index: index,
                  // name: workouts[index].name,
                  // image: workouts[index].imageName,
                  // minutes: workouts[index].minutes,
                  //
                  // updateWorkoutDaysFromList: (Set<DaysOfWeek>? workoutDays) {
                  //   workouts[index].workoutDays = workoutDays;
                  // },
                );
              },
            );
          default:
            return Center(
              child: Text('문제발생'),
            );
        }
      }),
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

                    // workouts.add(workout3);
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
