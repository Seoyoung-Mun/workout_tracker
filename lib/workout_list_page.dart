import 'package:flutter/material.dart';

class WorkoutListPage extends StatelessWidget {
  WorkoutListPage({super.key});
  List<String> workoutName = [
    '스쿼트',
    '사이드런지',
    '푸쉬업',
    '마운틴클림버',
    '런지',
    '덤벨컬',
    '덩키킥',
    '친업',
    '벤치프레스'
  ];
  List<String> workoutImg = [
    'assets/squat.jpeg',
    'assets/side_lunge.jpeg',
    'assets/pushup.jpeg',
    'assets/mountain_climber.jpeg',
    'assets/lunge.jpeg',
    'assets/dumbbell_curl.jpeg',
    'assets/donkey_kick.jpeg',
    'assets/chinup.jpeg',
    'assets/benchpress.jpeg'
  ];
  List<int> workoutTime = [
    30,
    20,
    15,
    15,
    20,
    40,
    30,
    25,
    10,
  ];
  List<Row> getWorkoutList() {
    List<Row> workoutListRow = [];
    for (int i = 0; i < workoutName.length; i++) {
      var name = workoutName[i];
      var image = workoutImg[i];
      var time = workoutTime[i];
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
        body: SingleChildScrollView(
            child: Column(
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
        )));
  }
}
