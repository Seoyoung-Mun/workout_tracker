import 'models/days_of_week.dart';
import 'models/workout.dart';
import 'services/firebase_auth_service.dart';
import 'services/firestore_service.dart';

class SampleData {
  static final firebaseService = FirebaseService();
  static final authService = FirebaseAuthService();
  static final List<Workout> workoutsSample = [
    Workout(
      name: '바벨활용 종아리 운동',
      minutes: 15,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00201301-Balance-Board_Calves_360.gif?alt=media&token=9a7ccdea-6708-4cc6-a234-ed3b8865d9fc',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Get%20Away.mp3?alt=media&token=a9677874-d83c-4136-9152-17c979e1ff8d',
      kcal: 320,
      workoutDays: {DaysOfWeek.monday, DaysOfWeek.wednesday},
    ),
    Workout(
      name: '덤벨활용 앉아서 종아리운동1',
      minutes: 4,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00881301-Barbell-Seated-Calf-Raise_Calves_360.gif?alt=media&token=6e642503-49a3-4cd3-a8d3-80c8d0a3c4e3',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Garage.mp3?alt=media&token=ab8d6b20-86c7-4c45-b55a-45a33f14490b',
      kcal: 110,
      workoutDays: {DaysOfWeek.friday, DaysOfWeek.sunday},
    ),
    Workout(
      name: '덤벨활용 앉아서 종아리운동2',
      minutes: 4,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00881301-Barbell-Seated-Calf-Raise_Calves_360.gif?alt=media&token=6e642503-49a3-4cd3-a8d3-80c8d0a3c4e3',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Garage.mp3?alt=media&token=ab8d6b20-86c7-4c45-b55a-45a33f14490b',
      kcal: 110,
      workoutDays: {DaysOfWeek.monday},
    ),
    Workout(
      name: '덤벨활용 앉아서 종아리운동3',
      minutes: 4,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00881301-Barbell-Seated-Calf-Raise_Calves_360.gif?alt=media&token=6e642503-49a3-4cd3-a8d3-80c8d0a3c4e3',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Garage.mp3?alt=media&token=ab8d6b20-86c7-4c45-b55a-45a33f14490b',
      kcal: 110,
      workoutDays: {DaysOfWeek.wednesday, DaysOfWeek.saturday},
    ),
    Workout(
      name: '덤벨활용 앉아서 종아리운동4',
      minutes: 4,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00881301-Barbell-Seated-Calf-Raise_Calves_360.gif?alt=media&token=6e642503-49a3-4cd3-a8d3-80c8d0a3c4e3',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Garage.mp3?alt=media&token=ab8d6b20-86c7-4c45-b55a-45a33f14490b',
      kcal: 110,
      workoutDays: {DaysOfWeek.thursday},
    ),
    Workout(
      name: '덤벨활용 앉아서 종아리운동5',
      minutes: 4,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00881301-Barbell-Seated-Calf-Raise_Calves_360.gif?alt=media&token=6e642503-49a3-4cd3-a8d3-80c8d0a3c4e3',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Garage.mp3?alt=media&token=ab8d6b20-86c7-4c45-b55a-45a33f14490b',
      kcal: 110,
      workoutDays: {DaysOfWeek.saturday},
    ),
    Workout(
      name: '덤벨활용 앉아서 종아리운동6',
      minutes: 4,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00881301-Barbell-Seated-Calf-Raise_Calves_360.gif?alt=media&token=6e642503-49a3-4cd3-a8d3-80c8d0a3c4e3',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Garage.mp3?alt=media&token=ab8d6b20-86c7-4c45-b55a-45a33f14490b',
      kcal: 110,
      workoutDays: {DaysOfWeek.tuesday, DaysOfWeek.friday, DaysOfWeek.saturday},
    ),
    Workout(
      name: '덤벨활용 앉아서 종아리운동7',
      minutes: 4,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00881301-Barbell-Seated-Calf-Raise_Calves_360.gif?alt=media&token=6e642503-49a3-4cd3-a8d3-80c8d0a3c4e3',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Garage.mp3?alt=media&token=ab8d6b20-86c7-4c45-b55a-45a33f14490b',
      kcal: 110,
      workoutDays: {DaysOfWeek.friday, DaysOfWeek.saturday},
    ),
    Workout(
      name: '덤벨활용 앉아서 종아리운동8',
      minutes: 4,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00881301-Barbell-Seated-Calf-Raise_Calves_360.gif?alt=media&token=6e642503-49a3-4cd3-a8d3-80c8d0a3c4e3',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Garage.mp3?alt=media&token=ab8d6b20-86c7-4c45-b55a-45a33f14490b',
      kcal: 110,
      workoutDays: {DaysOfWeek.friday, DaysOfWeek.saturday},
    ),
    Workout(
      name: '덤벨활용 앉아서 종아리운동9',
      minutes: 4,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00881301-Barbell-Seated-Calf-Raise_Calves_360.gif?alt=media&token=6e642503-49a3-4cd3-a8d3-80c8d0a3c4e3',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Garage.mp3?alt=media&token=ab8d6b20-86c7-4c45-b55a-45a33f14490b',
      kcal: 110,
      workoutDays: {DaysOfWeek.friday, DaysOfWeek.saturday},
    ),
    Workout(
      name: '덤벨활용 앉아서 종아리운동10',
      minutes: 4,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00881301-Barbell-Seated-Calf-Raise_Calves_360.gif?alt=media&token=6e642503-49a3-4cd3-a8d3-80c8d0a3c4e3',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Garage.mp3?alt=media&token=ab8d6b20-86c7-4c45-b55a-45a33f14490b',
      kcal: 110,
      workoutDays: {DaysOfWeek.friday, DaysOfWeek.saturday},
    ),
    Workout(
      name: '덤벨활용 앉아서 종아리운동11',
      minutes: 4,
      imageName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/00881301-Barbell-Seated-Calf-Raise_Calves_360.gif?alt=media&token=6e642503-49a3-4cd3-a8d3-80c8d0a3c4e3',
      audioName:
          'https://firebasestorage.googleapis.com/v0/b/workout-tracker-b5fa8.appspot.com/o/Garage.mp3?alt=media&token=ab8d6b20-86c7-4c45-b55a-45a33f14490b',
      kcal: 110,
      workoutDays: {DaysOfWeek.friday, DaysOfWeek.saturday},
    ),
  ];

  static void insertSampleData() async {
    int i = 1;
    DateTime now = DateTime.now();
    for (var workout in workoutsSample) {
      workout.createdAt = now.add(Duration(seconds: i++));
      workout.uid = authService.user?.uid;
      await firebaseService.createWorkout(workout);
    }
  }
}
