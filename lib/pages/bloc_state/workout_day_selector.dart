import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_bloc.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_event.dart';
import 'package:workout_tracker/models/days_of_week.dart';

class WorkoutDaySelector extends StatefulWidget {
  final int workoutIndex;

  WorkoutDaySelector({super.key, required this.workoutIndex});

  @override
  State<WorkoutDaySelector> createState() => _WorkoutDaySelectorState();
}

class _WorkoutDaySelectorState extends State<WorkoutDaySelector> {
  List<bool> isSelected = List.filled(7, false);

  void updateIsSelected(int index) {
    isSelected[index] = !isSelected[index];
    context.read<WorkoutBloc>().add(UpdateWorkout(
        workoutIndex: widget.workoutIndex, isSelected: isSelected));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = context.read<WorkoutBloc>().changeWorkoutDaysToIsSelected(
        context.read<WorkoutBloc>().state.workouts[widget.workoutIndex].workoutDays);
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (index) {
        setState(() {
          updateIsSelected(index);
        });
      },
      isSelected: isSelected,
      children: [
        //배열을 돌면서 아이템을 만듬
        for (var item in DaysOfWeek.values) Text(item.kor)
      ],
    );
  }
}
