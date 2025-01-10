import '../models/days_of_week.dart';
import '../models/workout.dart';

class FakeDb {
  final List<Workout> _workouts = [
    Workout(
      name: '스쿼트',
      minutes: 30,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-5b016.firebasestorage.app/o/workout_images%2F01081301-Barbell-Standing-Leg-Calf-Raise_Calf_360%20Small.jpeg?alt=media&token=307ea3ab-d359-45ec-b31b-463fe9b82312',
      audioName: 'squat.mp3',
      kcal: 200,
      workoutDays: {DaysOfWeek.monday, DaysOfWeek.wednesday, DaysOfWeek.friday},
    ),
    Workout(
      name: '사이드런지',
      minutes: 20,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-5b016.firebasestorage.app/o/workout_images%2F00201301-Balance-Board_Calves_360%20Small.jpeg?alt=media&token=9ddc6680-f6db-4a0c-8180-1fcf9e80a415',
      audioName: 'side_lunge.mp3',
      kcal: 100,
      workoutDays: {DaysOfWeek.sunday},
    ),
  ];

  List<Workout> fetchWorkouts() {
    return List.from(_workouts); // _workouts에 직접 접근하지 않고 값 불러오기
  }

  Workout getWorkout(int index) {
    return _workouts.elementAt(index);
  }

  void addWorkout(Workout workout) {
    _workouts.add(workout);
  }

  void deleteWorkout(int workoutIndex) {
    _workouts.removeAt(workoutIndex);
  }

  void updataWorkout(Workout workout) {
    // _workouts[index] = workout;
    int targetIndex = _workouts.indexOf(workout);
    _workouts[targetIndex] = workout;
  }
}
