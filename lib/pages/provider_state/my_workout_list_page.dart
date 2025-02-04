import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/logic/provider/workout_provider.dart';
import 'package:workout_tracker/models/days_of_week.dart';
import 'package:workout_tracker/pages/provider_state/add_workout_dialog.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:workout_tracker/logic/workout_manager.dart';
import 'package:workout_tracker/pages/provider_state/workout_tile.dart';
import 'package:workout_tracker/show_snackbar.dart';

// import '../../sample_data.dart';

class MyWorkoutListPage extends StatefulWidget {
  MyWorkoutListPage({super.key}) {
    WorkoutManager.increaseMonthlyWorkoutCount();
  }

  @override
  State<MyWorkoutListPage> createState() => _MyWorkoutListPageState();
}

class _MyWorkoutListPageState extends State<MyWorkoutListPage> {
  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      //   Provider.of<WorkoutProvider>(context, listen: false)
      //       .fetchAllWorkouts()
      //       .catchError((e) {
      //     showSnackBar(context, e.toString());
      //   });
      // }
      WorkoutProvider workoutProvider =
      Provider.of<WorkoutProvider>(context, listen: false);
      workoutProvider.fetchAllWorkouts();
      workoutProvider
          .addListener(() { //addListener는 notifyListeners를 통해 변경을 감지한 후 동작
        if (workoutProvider.errorState.$1) {
          showSnackBar(context, workoutProvider.errorState.$2!);
          workoutProvider.resetErrorState(); //에러상태 초기화
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_scrollListener);
    // SampleData.insertSampleData();
    //provicer에서 만든 getDoc
    // Provider.of<WorkoutProvider>(context, listen: false)
    //     .fetchAllWorkouts()
    //     .catchError((e) {
    //   showSnackBar(context, e.toString());
    // });
    WorkoutProvider workoutProvider =
        Provider.of<WorkoutProvider>(context, listen: false);
    workoutProvider.fetchAllWorkouts(); //provider에서 만든 메소드를 호출하여 데이터를 가져옴
    workoutProvider.addListener(() { //addListener는 notifyListeners를 통해 변경을 감지한 후 동작
      if (workoutProvider.errorState.$1) {
        showSnackBar(context, workoutProvider.errorState.$2!);
        workoutProvider.resetErrorState();//에러상태 초기화
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyWorkoutList'),
        centerTitle: true,
      ),
      body:
          Consumer<WorkoutProvider>(builder: (context, workoutProvider, child) {
        List<Workout> workouts = workoutProvider.workouts;
        if (workouts.isEmpty) {
          return Center(
            child: Text('등록된 운동이 없습니다.'),
          );
        }
        return ListView.builder(
          controller: _scrollController,
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            return WorkoutTile(
              index: index,
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: AddWorkoutDialog(),
            ),
          );
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, //버튼 위치 가운데 아래
    );
  }
}
