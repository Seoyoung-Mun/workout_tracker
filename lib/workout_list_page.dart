import 'package:flutter/material.dart';
import 'package:workout_tracker/workout.dart';

class WorkoutListPage extends StatelessWidget {
  WorkoutListPage({super.key});
  // List<String> workoutName = [
  //   '스쿼트',
  //   '사이드런지',
  //   '푸쉬업',
  //   '마운틴클림버',
  //   '런지',
  //   '덤벨컬',
  //   '덩키킥',
  //   '친업',
  //   '벤치프레스'
  // ];
  // List<String> workoutImg = [
  //   'assets/squat.jpeg',
  //   'assets/side_lunge.jpeg',
  //   'assets/pushup.jpeg',
  //   'assets/mountain_climber.jpeg',
  //   'assets/lunge.jpeg',
  //   'assets/dumbbell_curl.jpeg',
  //   'assets/donkey_kick.jpeg',
  //   'assets/chinup.jpeg',
  //   'assets/benchpress.jpeg'
  // ];
  // List<int> workoutTime = [
  //   30,
  //   20,
  //   15,
  //   15,
  //   20,
  //   40,
  //   30,
  //   25,
  //   10,
  // ];

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
        kcal: 100),    Workout(
        name: '푸쉬업',
        minutes: 15,
        imageName: 'pushup.gif',
        audioName: 'pushup.mp3',
        kcal: 100),
    Workout(
        name: '마운틴클림버',
        minutes: 15,
        imageName: 'mountain_climber.gif',
        audioName: 'mountain_climber.mp3',
        kcal: 50),
    Workout(
        name: '런지',
        minutes: 20,
        imageName: 'lunge.gif',
        audioName: 'lunge.mp3',
        kcal: 100),
    Workout(
        name: '덤벨컬',
        minutes: 40,
        imageName: 'dumbell_curl.gif',
        audioName: 'dumbell_curl.mp3',
        kcal: 200),
    Workout(
        name: '덩키킥',
        minutes: 30,
        imageName: 'donkey_kick.gif',
        audioName: 'donkey_kick.mp3',
        kcal: 50),
    Workout(
        name: '친업',
        minutes: 25,
        imageName: 'chinup.gif',
        audioName: 'chinup.mp3',
        kcal: 300),
    Workout(
        name: '벤치프레스',
        minutes: 1,
        imageName: 'benchpress.gif',
        audioName: 'benchpress.mp3',
        kcal: 250),
  ];
  List<Row> getWorkoutList() {
    List<Row> workoutListRow = [];
    for (int i = 0; i < workouts.length; i++) {
      Workout workout = workouts[i]; // workouts 리스트에서 워크아웃을 하나씩 꺼내서
      // 워크아웃 이름, 이미지, 시간을 변수로 저장
      var name = workout.name;
      var image = workout.imageName;
      var time = workout.minutes;

      workoutListRow.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('${image}'),
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
              getWorkoutList(),
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
