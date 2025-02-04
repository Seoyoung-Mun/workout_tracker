import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/logic/provider/workout_provider.dart';
import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/pages/provider_state/workout_day_selector.dart';
import 'package:workout_tracker/show_snackbar.dart';

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
        Consumer<WorkoutProvider>(builder: (context, workoutProvider, child) {
          var workout = workoutProvider.workouts[index];

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
                    // WorkoutProvider workoutProvider =
                    //     Provider.of<WorkoutProvider>(context,
                    //         listen: false); //value에 접근하려면 true, 함수에 접근하려면 false
                    // try {
                    //   workoutProvider.deleteWorkout(index);
                    // } catch (e) {
                    //   showSnackBar(context, e.toString());
                    // }

                    WorkoutProvider workoutProvider =
                        Provider.of<WorkoutProvider>(context, listen: false);
                    workoutProvider.deleteWorkout(index);
                    workoutProvider.addListener(() {
                      //addListener는 notifyListeners를 통해 변경을 감지한 후 동작
                      if (workoutProvider.errorState.$1) {
                        showSnackBar(context, workoutProvider.errorState.$2!);
                        workoutProvider.resetErrorState(); //에러상태 초기화
                      }
                    });
                  },
                  icon: const Icon(Icons.delete_outline, size: 22))
            ],
          );
        }),
        WorkoutDaySelector(
          workoutIndex: index,
        ),
      ],
    );
  }
}
