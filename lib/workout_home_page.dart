import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/animated_icon_widget.dart';
import 'package:workout_tracker/animated_text_carousel.dart';
import 'package:workout_tracker/dashboard_card.dart';
import 'package:workout_tracker/workout_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/animation_practice_widget.dart';

class WorkoutHomePage extends StatefulWidget {
  WorkoutHomePage({super.key});

  @override
  State<WorkoutHomePage> createState() => WorkoutHomePageState();
}

class WorkoutHomePageState extends State<WorkoutHomePage> {
  late Future<int> monthlyCountFuture;
  late Future<int> todayWorkoutTimeFuture;
  late Future<int> todayKcalFuture;
  @override
  void initState() {
    //화면이 생성될 때
    // TODO: implement initState
    super.initState();
    monthlyCountFuture = WorkoutManager.getMonthlyWorkoutCount();
    todayWorkoutTimeFuture = WorkoutManager.getTodayWorkoutTime();
    todayKcalFuture = WorkoutManager.getTodayKcalorie();
  }

  @override
  void didUpdateWidget(covariant WorkoutHomePage oldWidget) {
    //화면이 업데이트 될 때
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    monthlyCountFuture = WorkoutManager.getMonthlyWorkoutCount();
    todayWorkoutTimeFuture = WorkoutManager.getTodayWorkoutTime();
    todayKcalFuture = WorkoutManager.getTodayKcalorie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AnimatedTextCarousel(),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: Colors.orange,
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/me.jpg'),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              //세로 확장
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    //가로 확장
                    flex: 2,
                    child: DashboardCard(
                      icon: AnimatedIconWidget(
                        icon: Icons.fitness_center,
                        size:
                            Theme.of(context).textTheme.headlineSmall?.fontSize,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      // Icon(Icons.fitness_center,
                      //     size: Theme.of(context)
                      //         .textTheme
                      //         .headlineSmall
                      //         ?.fontSize,
                      //     color: Theme.of(context).colorScheme.primary),
                      title: Text(
                        'Monthly',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      info: Expanded(
                        child: Align(
                          child: FutureBuilder(
                              //future: WorkoutManager.getMonthlyWorkoutCount(), //함수를 다이렉트로 넘겨주면 안되고 변수에 담은 Future타입으로 넘겨줘야함
                              future: monthlyCountFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }
                                final monthlyWorkoutCount = snapshot.data ?? 0;
                                return Text(
                                  '${monthlyWorkoutCount}회',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            icon: AnimatedIconWidget(
                              icon: Icons.update,
                              size: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.fontSize,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            // Icon(Icons.update,
                            //     size: Theme.of(context)
                            //         .textTheme
                            //         .headlineSmall
                            //         ?.fontSize,
                            //     color: Theme.of(context).colorScheme.primary),
                            title: Text(
                              '오늘 운동 시간',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            info: Expanded(
                              child: Align(
                                child: FutureBuilder(
                                    future: todayWorkoutTimeFuture,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator();
                                      }
                                      if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      }
                                      final todayWorkoutTime =
                                          snapshot.data ?? 0;
                                      return Text(
                                        '${todayWorkoutTime}분',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: DashboardCard(
                            icon: AnimatedIconWidget(
                                icon: Icons.fitness_center,
                                size: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.fontSize,
                                color: Theme.of(context).colorScheme.primary),

                            // Icon(Icons.fitness_center,
                            //     size: Theme.of(context)
                            //         .textTheme
                            //         .headlineSmall
                            //         ?.fontSize,
                            //     color: Theme.of(context).colorScheme.primary),
                            title: Text(
                              '소모 칼로리',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            info: Expanded(
                              child: Align(
                                child: FutureBuilder(
                                    future: todayKcalFuture,
                                    builder: (context, snapsout) {
                                      final todayKcal = snapsout.data ?? 0;
                                      return Text(
                                        '${todayKcal}kcal',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                        child: Hero(
                          tag: 'group_0',
                          child: DashboardCard(
                            customOnTap: () =>
                                context.go('/workout_home/workout_list/0'),
                            icon: Icon(Icons.run_circle_outlined,
                                size: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.fontSize,
                                color: Theme.of(context).colorScheme.onPrimary),
                            title: Text(
                              '그룹1',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                            ),
                            info: Expanded(
                              child: Text(
                                WorkoutManager.workoutGroups[0].groupDescription,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                              ),
                            ),
                            backgraoundColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            imagePath: 'sample1.png',
                          ),
                        ),
                        width: 250),
                    SizedBox(
                        child: Hero(
                          tag: 'group_1',
                          child: DashboardCard(
                            customOnTap: () =>
                                context.go('/workout_home/workout_list/1'),
                            icon: Icon(Icons.rowing_outlined,
                                size: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.fontSize,
                                color: Theme.of(context).colorScheme.onPrimary),
                            title: Text(
                              '그룹2',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                            ),
                            info: Expanded(
                              child: Text(
                                WorkoutManager.workoutGroups[1].groupDescription,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                              ),
                            ),
                            backgraoundColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            imagePath: 'sample2.png',
                          ),
                        ),
                        width: 250),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: DashboardCard(
                customOnTap: () {
                  context.go(
                      '/workout_home/workout_list/${WorkoutManager.currentWorkoutGroupIndex}');
                },
                icon: Icon(Icons.list,
                    size: Theme.of(context).textTheme.headlineSmall?.fontSize,
                    color: Theme.of(context).colorScheme.primary),
                title: Text(
                  '운동 이어서 하기',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                info: Expanded(
                  child: Text(
                    '당신의 몸은 해 낼 수 있다. \n당신의 마음만 설득하면 된다.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                backgraoundColor: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
