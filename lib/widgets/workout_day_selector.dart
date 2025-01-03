import 'package:flutter/material.dart';
import 'package:workout_tracker/models/days_of_week.dart';

class WorkoutDaySelector extends StatefulWidget {
  WorkoutDaySelector({super.key});

  @override
  State<WorkoutDaySelector> createState() => _WorkoutDaySelectorState();
}

class _WorkoutDaySelectorState extends State<WorkoutDaySelector> {
  List<bool> isSelected = List.filled(7, false);

  void updateIsSelected(int index) {
    isSelected[index] = !isSelected[index];
  }

  @override
  Widget build(BuildContext context) {
    //isSelected[2] = true; //목요일을 선택한 것으로 나오게 test
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
