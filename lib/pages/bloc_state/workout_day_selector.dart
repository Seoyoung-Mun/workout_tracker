import 'package:flutter/material.dart';
import 'package:workout_tracker/models/days_of_week.dart';

class WorkoutDaySelector extends StatefulWidget {
  final void Function(Set<DaysOfWeek>?) updateWorkoutDays;
  final Set<DaysOfWeek> workoutDays;

  WorkoutDaySelector({super.key, required this.updateWorkoutDays, required this.workoutDays});

  @override
  State<WorkoutDaySelector> createState() => _WorkoutDaySelectorState();
}

class _WorkoutDaySelectorState extends State<WorkoutDaySelector> {
  List<bool> isSelected = List.filled(7, false);

  void updateIsSelected(int index) {
    isSelected[index] = !isSelected[index];
    //함수 호출부에 widget.을 붙여야 하는 이유는 StatefulWidget의 멤버 변수에 접근하기 위해서
    // widget.updateWorkoutDays(changeIsSelectedToWorkoutDays(isSelected));
  }

  // Set<DaysOfWeek> changeIsSelectedToWorkoutDays(List<bool>? isSelected){
  //   Set<DaysOfWeek> selectedWorkoutDays = {};
  //   if(isSelected == null){
  //     return selectedWorkoutDays;
  //   }
  //   for (var weekDay in DaysOfWeek.values){
  //     if (isSelected[weekDay.index]){
  //       selectedWorkoutDays.add(weekDay);
  //     }
  //   }
  //   return selectedWorkoutDays;
  // }
  //
  // List<bool> changeWorkoutDaysToIsSelected(Set<DaysOfWeek>? workoutDays){
  //   List<bool> isSelected = List.filled(7, false);
  //   if (workoutDays == null){
  //     return isSelected;
  //   }
  //   for (var week in workoutDays){
  //     isSelected[week.index] = true;
  //   }
  //   return isSelected;
  // }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // isSelected = changeWorkoutDaysToIsSelected(widget.workoutDays);
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
