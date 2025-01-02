import 'package:flutter/material.dart';
import 'package:workout_tracker/pages/add_workout_dialog.dart';
import 'package:workout_tracker/widgets/dashboard_card.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/logic/workout_manager.dart';
import 'package:workout_tracker/widgets/workout_tile.dart';

class MyWorkoutListPage extends StatelessWidget {
  MyWorkoutListPage({super.key}) {
    WorkoutManager.increaseMonthlyWorkoutCount();
  } //constructor body는 인스턴스가 초기화 된 다음에 동작함
  List<Workout> workouts = [
    Workout(
        name: '스쿼트',
        minutes: 30,
        imageName: 'squat.jpeg',
        audioName: 'squat.mp3',
        kcal: 200),
    Workout(
        name: '사이드런지',
        minutes: 20,
        imageName: 'side_lunge.jpeg',
        audioName: 'side_lunge.mp3',
        kcal: 100),
  ];

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
              minutes: workouts[index].minutes);
        },
      ),
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
