import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_bloc.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_event.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_state.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:workout_tracker/pages/bloc_state/workout_day_selector.dart';

class WorkoutTile extends StatelessWidget {
  final int index;

  WorkoutTile({
    super.key,
    required this.index,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<WorkoutBloc, WorkoutState>(
          builder: (context, state) {
            Workout workout = state.workouts[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('${workout.imageName}'),
                    ),
                  ),
                ),
                Expanded(
                  //화면의 크기와 상관없이 가능한 최대 크기로 확장
                  child: Text(
                    '${index + 1}. ${workout.name}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text('${workout.minutes}분',
                      style: TextStyle(fontSize: 20, color: Colors.blue)),
                ),
                IconButton(
                    onPressed: () {
                      context.read<WorkoutBloc>().add(DeleteWorkout(index));
                    },
                    icon: const Icon(Icons.delete_outline, size: 22))
              ],
            );
          }
        ),
        WorkoutDaySelector(
          workoutIndex: index,
        ),
      ],
    );
  }
}
