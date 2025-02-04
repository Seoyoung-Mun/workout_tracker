import 'package:flutter/material.dart';
import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/pages/simple_state/workout_day_selector.dart';

class WorkoutTile extends StatelessWidget {
  final int index;
  final String name;
  final String image;
  final int minutes;
  final Set<DaysOfWeek> workoutDays;

  final void Function(int) deleteWorkout;
  final void Function(Set<DaysOfWeek>?) updateWorkoutDaysFromList;

  WorkoutTile({
    super.key,
    required this.index,
    required this.name,
    required this.image,
    required this.minutes,
    required this.workoutDays,
    required this.deleteWorkout,
    required this.updateWorkoutDaysFromList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  image: NetworkImage('${image}'),
                ),
              ),
            ),
            Expanded(
              //화면의 크기와 상관없이 가능한 최대 크기로 확장
              child: Text(
                '${index + 1}. ${name}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text('${minutes}분',
                  style: TextStyle(fontSize: 20, color: Colors.blue)),
            ),
            IconButton(onPressed: () {
              deleteWorkout(index);
            },
                icon: const Icon(Icons.delete_outline, size: 22))
          ],
        ),
        WorkoutDaySelector(
          workoutDays: workoutDays,
            updateWorkoutDays: updateWorkoutDaysFromList,
        ),
      ],
    );
  }
}
