import '../../models/workout.dart';

sealed class WorkoutState {
  final List<Workout> workouts;
  WorkoutState({required this.workouts});
}

//Initial
final class WorkoutInitial extends WorkoutState {
  // WorkoutState 클래스가 workouts라는 속성을 가지고 있으며, 이 속성을 초기화하기 위해 빈 리스트를 제공하는 것
  WorkoutInitial() : super(workouts: []);
}

//Loaded
final class WorkoutLoaded extends WorkoutState {
  // WorkoutLoaded 객체가 생성될 때, 부모 클래스의 workouts 속성이 주어진 리스트로 설정
  WorkoutLoaded(List<Workout> workouts) : super(workouts: workouts);
}

//이 코드에는 error state는 없지만, 에러처리를 위해 만드는것이 좋음