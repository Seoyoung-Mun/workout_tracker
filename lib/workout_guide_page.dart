import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:workout_tracker/workout.dart';

class WorkoutGuidePage extends StatefulWidget {
  WorkoutGuidePage({super.key});

  @override
  State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
  late Workout currentWorkout;
  final player = AudioPlayer();
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
    Workout(
        name: '푸쉬업',
        minutes: 15,
        imageName: 'pushup.jpeg',
        audioName: 'pushup.mp3',
        kcal: 100),
    Workout(
        name: '마운틴클림버',
        minutes: 15,
        imageName: 'mountain_climber.jpeg',
        audioName: 'mountain_climber.mp3',
        kcal: 50),
    Workout(
        name: '런지',
        minutes: 20,
        imageName: 'lunge.jpeg',
        audioName: 'lunge.mp3',
        kcal: 100),
    Workout(
        name: '덤벨컬',
        minutes: 40,
        imageName: 'dumbbell_curl.jpeg',
        audioName: 'dumbell_curl.mp3',
        kcal: 200),
    Workout(
        name: '덩키킥',
        minutes: 30,
        imageName: 'donkey_kick.jpeg',
        audioName: 'donkey_kick.mp3',
        kcal: 50),
    Workout(
        name: '친업',
        minutes: 25,
        imageName: 'chinup.jpeg',
        audioName: 'chinup.mp3',
        kcal: 300),
    Workout(
        name: '벤치프레스',
        minutes: 1,
        imageName: 'benchpress.jpeg',
        audioName: 'benchpress.mp3',
        kcal: 250),
  ];
  int workoutIndex = 0;

  @override
  void initState() {
    //StatefulWidget이 처음 생성되었을 때 호출. data 용도로 자주 사용
    // TODO: implement initState
    super.initState();
    currentWorkout = workouts[workoutIndex];
  }

  void dispose() {
    //객체가 영구적으로 제거되었을때 호출. 주로 resource를 release하기 위해 사용
    // TODO: implement dispose
    player.dispose();
    super.dispose();
  }

  Row getIconButton() {
    if (player.state == PlayerState.playing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              await player.pause();
              setState(() {}); //프레임워크에 데이터가 변경된 것을 알리기 위해 사용. 화면을 갱신
            },
            icon: Icon(Icons.pause_circle_filled),
            iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
            color: Theme.of(context).colorScheme.primary,
          ),
          IconButton(
            onPressed: () async {
              await player.stop();
              setState(() {});
            },
            icon: Icon(Icons.stop_circle),
            iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      );
    } else if (player.state == PlayerState.paused) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              await player.resume();
              setState(() {});
            },
            icon: Icon(Icons.play_circle_fill),
            iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
            color: Theme.of(context).colorScheme.primary,
          ),
          IconButton(
            onPressed: () async {
              await player.stop();
              setState(() {});
            },
            icon: Icon(Icons.stop_circle),
            iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              await player
                  .play(AssetSource('sounds/${currentWorkout.audioName}'));
              setState(() {});
            },
            icon: Icon(Icons.play_circle_fill),
            iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      );
    }
  }

  void nextWorkout() {
    if (workoutIndex == workouts.length - 1) {
      workoutIndex = -1;
    }
    setState(() {
      workoutIndex++;
      currentWorkout = workouts[workoutIndex];
    });
  }

  void previousWorkout() {
    if (workoutIndex > 0) {
      workoutIndex--;
    } else {
      workoutIndex = workouts.length - 1;
    }
    currentWorkout = workouts[workoutIndex];
  }

  @override
  Widget build(BuildContext context) {
    //위젯을 return하는 함수, 화면을 그리는 method
    return Scaffold(
        appBar: AppBar(
          title: Text('WorkoutGuide'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('${currentWorkout.name}',
                style: Theme.of(context).textTheme.displaySmall),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    await player.stop();
                    setState(() {
                      previousWorkout();
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                ),
                // Image(image: AssetImage('assets/squat.jpeg'),),
                Expanded(
                    child: Image.asset('assets/${currentWorkout.imageName}')),
                IconButton(
                  onPressed: () async {
                    await player.stop();

                    nextWorkout();
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                  iconSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                ),
              ],
            ),
            Text('${currentWorkout.minutes}분',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
            getIconButton()
          ],
        ));
  }
}
