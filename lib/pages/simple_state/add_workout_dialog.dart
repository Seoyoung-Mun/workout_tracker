import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/models/workout.dart';

class AddWorkoutDialog extends StatelessWidget {
  void Function(Workout) addWorkoutCallback; //프로퍼티 정의

  AddWorkoutDialog({super.key, required this.addWorkoutCallback});

  String? newWorkoutTitle;
  String? newWorkoutImageUrl;
  String? newWorkoutAudioUrl;
  int newWorkoutMinutes = 0;
  int newWorkoutKcal = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        //command k 로 키보드 올려서 화면 확인 후 스크롤뷰 추가
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                  child: Text('운동추가',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 3, 18, 3),
              child: TextField(
                onChanged: (value) {
                  newWorkoutTitle = value;
                },
                decoration: InputDecoration(
                  labelText: '운동명',
                  border: InputBorder.none,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 3, 18, 3),
              child: TextField(
                onChanged: (value) {
                  newWorkoutImageUrl = value;
                },
                decoration: InputDecoration(
                  labelText: '이미지',
                  border: InputBorder.none,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 3, 18, 3),
              child: TextField(
                onChanged: (value) {
                  newWorkoutAudioUrl = value;
                },
                decoration: InputDecoration(
                  labelText: 'mp3',
                  border: InputBorder.none,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 3, 18, 3),
              child: TextField(
                onChanged: (value) {
                  newWorkoutMinutes = int.parse(value);
                },
                decoration: InputDecoration(
                  labelText: '목표시간',
                  border: InputBorder.none,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 3, 18, 3),
              child: TextField(
                onChanged: (value) {
                  newWorkoutKcal = int.parse(value);
                },
                decoration: InputDecoration(
                  labelText: '칼로리',
                  border: InputBorder.none,
                  filled: true,
                ),
              ),
            ),
            Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    color: Theme.of(context).primaryColor),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      print(newWorkoutTitle);
                      print(newWorkoutImageUrl);
                      print(newWorkoutAudioUrl);
                      print(newWorkoutMinutes);
                      print(newWorkoutKcal);
                      Workout workout3 = Workout(
                          name: newWorkoutTitle!,
                          minutes: newWorkoutMinutes,
                          imageName: newWorkoutImageUrl!,
                          audioName: newWorkoutAudioUrl!,
                          kcal: newWorkoutKcal);
                      addWorkoutCallback(workout3); //부모에서 정의된 함수 호출
                      context.pop();
                      //gorouter에서 Navigator.pop(context); 과 같음
                    },
                    child: Text(
                      '추가',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}