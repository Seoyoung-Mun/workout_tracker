import 'package:flutter/material.dart';

class WorkoutListPage extends StatelessWidget {
  const WorkoutListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WorkoutList'),
          centerTitle: true,
        ),
        body: Column(
          children: [
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
                      image: AssetImage('assets/squat.jpeg'),
                    ),
                  ),
                ),
                Expanded( //화면의 크기와 상관없이 가능한 최대 크기로 확장
                  child: Text(
                    '1. 스쿼트',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text('30분', style: TextStyle(fontSize: 20, color: Colors.blue)),
              ],
            ),
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
                      image: AssetImage('assets/mountain_climber.jpeg'),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    '2. 마운틴클림버',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text('30분', style: TextStyle(fontSize: 20, color: Colors.blue)),
              ],
            ),
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
                      image: AssetImage('assets/benchpress.jpeg'),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    '3. 벤치프레스',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text('30분', style: TextStyle(fontSize: 20, color: Colors.blue)),
              ],
            ),
          ],
        ));
  }
}
