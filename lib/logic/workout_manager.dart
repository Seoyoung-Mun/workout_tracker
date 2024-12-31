import 'package:workout_tracker/models/workout_group.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/workout.dart';

class WorkoutManager {
  static int? currentWorkoutGroupIndex;
  static List<Workout> workouts = [
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

  static List<WorkoutGroup> workoutGroups = [
    WorkoutGroup(groupDescription: '아침을 여는 5가지 운동 프로그램', workouts: [
      workouts[0],
      workouts[1],
      workouts[2],
      workouts[3],
      workouts[4],
    ]), //그룹1
    WorkoutGroup(groupDescription: '근력을 키우는 7가지 운동 프로그램', workouts: [
      workouts[1],
      workouts[2],
      workouts[3],
      workouts[4],
      workouts[5],
      workouts[6],
      workouts[7]
    ]), //그룹2
  ];

  static Future<void> increaseMonthlyWorkoutCount() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    int montlyCount = await getMonthlyWorkoutCount();
    asyncPrefs.setInt('monthlyCount', ++montlyCount);
  }

  static Future<int> getMonthlyWorkoutCount() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    int montylyCount = await asyncPrefs.getInt('monthlyCount') ?? 0;
    return montylyCount;
  }

  //오늘 운동시간 누적 함수
  static Future<void> increaseTodayWorkoutTime(int workoutTime) async {
    int todayWorkoutTime = await getTodayWorkoutTime();
    final SharedPreferencesAsync asyncPrefs =
        SharedPreferencesAsync(); //비동기 객체 생성

    // int nowWorkoutTime = workouts[currentWorkoutGroupIndex??0].minutes;//현재 운동시간
    todayWorkoutTime += workoutTime;
    print("오늘 운동시간 누적 : $todayWorkoutTime");
    asyncPrefs.setInt('todayWorkoutTime', todayWorkoutTime);
    //asyncPrefs.setInt('todayWorkoutTime', 0); //테스트용 (날짜변경시 데이터 리셋)
  }

  //오늘 운동시간 누적 가져오기
  static Future<int> getTodayWorkoutTime() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    int todayWorkoutTime = await asyncPrefs.getInt('todayWorkoutTime') ?? 0;
    return todayWorkoutTime;
  }

  //오늘 소모 칼로리 누적
  static Future<void> increaseTodayKcalorie(int nowKcal) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    int todayKcal = await asyncPrefs.getInt('todayKcalorie') ?? 0;
    await asyncPrefs.setInt('todayKcalorie', todayKcal + nowKcal);
  }
  //오늘 소모 칼로리 누적 가져오기
  static Future<int> getTodayKcalorie() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    int todayKcalorie = await asyncPrefs.getInt('todayKcalorie') ?? 0;
    return todayKcalorie;
  }

}
