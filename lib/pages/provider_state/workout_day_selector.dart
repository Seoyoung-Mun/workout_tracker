import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/logic/provider/workout_provider.dart';
import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/show_snackbar.dart';

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
    //함수 호출부에 widget.을 붙여야 하는 이유는 StatefulWidget의 멤버 변수에 접근하기 위해서
    // widget.updateWorkoutDays(changeIsSelectedToWorkoutDays(isSelected));
    // try {
    //   Provider.of<WorkoutProvider>(context, listen: false).updateWorkoutDays(
    //       isSelected: isSelected, workoutIndex: widget.workoutIndex);
    // } catch (e) {
    //   showSnackBar(context, e.toString());
    // }
    WorkoutProvider workoutProvider =
        Provider.of<WorkoutProvider>(context, listen: false);
    workoutProvider.addListener(() {
      //addListener는 notifyListeners를 통해 변경을 감지한 후 동작
      if (workoutProvider.errorState.$1) {
        showSnackBar(context, workoutProvider.errorState.$2!);
        workoutProvider.resetErrorState(); //에러상태 초기화
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // isSelected = changeWorkoutDaysToIsSelected(widget.workoutDays);
    isSelected = Provider.of<WorkoutProvider>(context, listen: false)
        .changeWorkoutDaysToIsSelected(
      Provider.of<WorkoutProvider>(context, listen: false)
          .workouts[widget.workoutIndex]
          .workoutDays,
    );
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
