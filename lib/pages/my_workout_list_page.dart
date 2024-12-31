import 'package:flutter/material.dart';
import 'package:workout_tracker/pages/add_workout_dialog.dart';
import 'package:workout_tracker/widgets/dashboard_card.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/logic/workout_manager.dart';

class MyWorkoutListPage extends StatelessWidget {
  MyWorkoutListPage({super.key}) {
    WorkoutManager.increaseMonthlyWorkoutCount();
  } //constructor body는 인스턴스가 초기화 된 다음에 동작함

  List<Widget> getWorkoutList(BuildContext context) {
    final List<Workout> workouts = WorkoutManager
        .workoutGroups[0].workouts; //instance 변수를 넣는 시점은 함수가 실행될 때 동작
    //statefulWidget일 때는 Widget.변수 로 사용했었음.
    List<Widget> workoutListRow = [];
    for (int i = 0; i < workouts.length; i++) {
      Workout workout = workouts[i]; // workouts 리스트에서 워크아웃을 하나씩 꺼내서
      // 워크아웃 이름, 이미지, 시간을 변수로 저장
      var name = workout.name;
      var image = workout.imageName;
      var time = workout.minutes;

      workoutListRow.add(
        GestureDetector(
          onTap: () {
            context.go('/workout_home/workout_list/0/workout_guide/$i');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/${image}'),
                  ),
                ),
              ),
              Expanded(
                //화면의 크기와 상관없이 가능한 최대 크기로 확장
                child: Text(
                  '${i + 1}. ${name}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text('${time}분',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
              ),
            ],
          ),
        ),
      );
    }
    ;
    return workoutListRow;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyWorkoutList'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ...getWorkoutList(context),
          //빌드하면서 리스트에 추가하기 위해 '...'오퍼레이트 추가 (확장의 의미)
        ],
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
