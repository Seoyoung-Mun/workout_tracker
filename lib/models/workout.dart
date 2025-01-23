import 'package:flutter/cupertino.dart';
import 'package:workout_tracker/models/days_of_week.dart';

class Workout {
  String? id;
  String name;
  int minutes;
  String imageName;
  String audioName;
  int kcal;
  Set<DaysOfWeek>? workoutDays;
  String? uid; //그룹운동에선 null
  DateTime createdAt;

  Workout(
      {this.id,
      required this.name,
      required this.minutes,
      required this.imageName,
      required this.audioName,
      required this.kcal,
      this.workoutDays,
      this.uid,
      createdAt})
      : createdAt =
            createdAt ?? DateTime.now(); //createdAt이 null일때 현재시간으로 디폴트값 설정

  //firebase가 map형태로 데이터를 받기 때문에
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'kcal': kcal,
      'minutes': minutes,
      'imageName': imageName,
      'audioName': audioName,
      'workoutDays': workoutDays?.map((day) => day.index).toList(),
      'uid': uid,
      'createdAt': createdAt,
    };
  }

  //map형태로 받은 데이터를 Workout 형태로 변환 변환
  // fromMpa의 역할은 map형태로 받은 데이터를 Workout 형태로 변환하는 것
  factory Workout.fromMap(Map<String, dynamic> mapData) {

    //mapData['createdAt']는 Timestamp 형태이기 때문에 DateTime으로 변환
    DateTime createAt = DateTime.fromMillisecondsSinceEpoch(
        mapData['createdAt'].seconds * 1000);

    //map형태로 받은 데이터를 Set<DaysOfWeek> 형태로 변환
    Set<DaysOfWeek>? dayOfWeek;
    if (mapData['workoutDays'] != null) {
      dayOfWeek = Set<DaysOfWeek>.from(
          mapData['workoutDays'].map((day) => DaysOfWeek.values[day]));
    }

    return Workout(
      id: mapData['id'],
      uid: mapData['uid'],
      name: mapData['name'],
      audioName: mapData['audioName'],
      imageName: mapData['imageName'],
      kcal: mapData['kacl'],
      minutes: mapData['minutes'],
      createdAt: createAt,
      workoutDays: dayOfWeek,
    );
  }

  @override
  String toString() {
    //디버깅용 toString
    // TODO: implement toString
    return 'name:${name}, minutes:${minutes}, imageName:${imageName}, audioName:${audioName}, kcal:${kcal}';
    // return super.toString();
  }
}
//Model의 역할
//데이터 구조 정의: 데이터베이스의 JSON 데이터를 애플리케이션에서 사용하기 위한 객체 형태로 정의합니다.
//데이터 변환: JSON 데이터를 해당 모델 객체로 변환하거나, 모델 객체를 JSON 형식으로 변환하여 데이터 전송 및 저장을 용이하게 합니다.
//데이터 검증 및 관리: 모델을 통해 데이터의 유효성을 검증하고, 비즈니스 로직을 적용하여 데이터의 무결성을 유지합니다.
