import 'package:flutter/material.dart';
import 'package:workout_tracker/dashboard_card.dart';
import 'package:workout_tracker/workout.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/workout_manager.dart';

class WorkoutListPage extends StatelessWidget {
  final int groupIndex;
  WorkoutListPage({super.key, required this.groupIndex}) {
    WorkoutManager.currentWorkoutGroupIndex = groupIndex;
    WorkoutManager.increaseMonthlyWorkoutCount();
  } //constructor body는 인스턴스가 초기화 된 다음에 동작함

  List<Widget> getWorkoutList(BuildContext context) {
    final List<Workout> workouts = WorkoutManager
        .workoutGroups[groupIndex].workouts; //instance 변수를 넣는 시점은 함수가 실행될 때 동작
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
            context
                .go('/workout_home/workout_list/$groupIndex/workout_guide/$i');
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

  Widget getHero(BuildContext context) {
    if (groupIndex == 1) {
      return Hero(
        tag: 'group_1',
        child: SizedBox(
          height: 100,
          child: DashboardCard(
            customOnTap: () => context.go('/workout_home/workout_list/1'),
            icon: Icon(Icons.rowing_outlined,
                size: Theme.of(context).textTheme.headlineSmall?.fontSize,
                color: Theme.of(context).colorScheme.onPrimary),
            title: Text(
              '그룹2',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            info: Expanded(
              child: Text(
                WorkoutManager.workoutGroups[1].groupDescription,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            backgraoundColor: Theme.of(context).colorScheme.inversePrimary,
            imagePath: 'sample2.png',
          ),
        ),
      );
    } else {
      return Hero(
        tag: 'group_0',
        child: SizedBox(
          height: 100,
          child: DashboardCard(
            icon: Icon(Icons.run_circle_outlined,
                size: Theme.of(context).textTheme.headlineSmall?.fontSize,
                color: Theme.of(context).colorScheme.onPrimary),
            title: Text(
              '그룹1',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            info: Expanded(
              child: Text(
                WorkoutManager.workoutGroups[0].groupDescription,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            backgraoundColor: Theme.of(context).colorScheme.inversePrimary,
            imagePath: 'sample1.png',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WorkoutList'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            getHero(context),
            ...getWorkoutList(context), //빌드하면서 리스트에 추가하기 위해 '...'오퍼레이트 추가 (확장의 의미)

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
          ],
        ),);
  }
}
