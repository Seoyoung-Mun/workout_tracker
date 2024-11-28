import 'package:flutter/material.dart';
import 'package:workout_tracker/workout.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/workout_manager.dart';

class WorkoutListPage extends StatelessWidget {
  final int groupIndex;
  WorkoutListPage({super.key, required this.groupIndex});

  List<Widget> getWorkoutList(BuildContext context) {
    final List<Workout> workouts = WorkoutManager.workoutGroups[groupIndex].workouts; //instance 변수를 넣는 시점은 함수가 실행될 때 동작
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
            context.go('/workout_home/workout_list/$groupIndex/workout_guide/$i');
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
          title: Text('WorkoutList'),
          centerTitle: true,
        ),
        body: ListView(
          children:
              // [
              getWorkoutList(context),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.all(10),
          //       width: 80,
          //       height: 80,
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         image: DecorationImage(
          //           image: AssetImage('assets/squat.jpeg'),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       //화면의 크기와 상관없이 가능한 최대 크기로 확장
          //       child: Text(
          //         '1. 스쿼트',
          //         style: TextStyle(fontSize: 20),
          //       ),
          //     ),
          //     Text('05:30',
          //         style: TextStyle(fontSize: 20, color: Colors.blue)),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.all(10),
          //       width: 80,
          //       height: 80,
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         image: DecorationImage(
          //           image: AssetImage('assets/mountain_climber.jpeg'),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Text(
          //         '2. 마운틴클림버',
          //         style: TextStyle(fontSize: 20),
          //       ),
          //     ),
          //     Text('25:30',
          //         style: TextStyle(fontSize: 20, color: Colors.blue)),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.all(10),
          //       width: 80,
          //       height: 80,
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         image: DecorationImage(
          //           image: AssetImage('assets/benchpress.jpeg'),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Text(
          //         '3. 벤치프레스',
          //         style: TextStyle(fontSize: 20),
          //       ),
          //     ),
          //     Text('12:30',
          //         style: TextStyle(fontSize: 20, color: Colors.blue)),
          //   ],
          // ),
          // ],
        ));
  }
}
