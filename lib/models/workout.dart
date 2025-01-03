import 'package:workout_tracker/models/days_of_week.dart';

class Workout {
  String name;
  int minutes;
  String imageName;
  String audioName;
  int kcal;
  Set<DaysOfWeek>? workoutDays;

  Workout({required this.name,
      required this.minutes,
      required this.imageName,
      required this.audioName,
      required this.kcal,
      this.workoutDays
  });

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